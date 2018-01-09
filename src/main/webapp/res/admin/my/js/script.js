//获取ID
var mh1 = function (id) {
    return typeof id === "string" ? document.getElementById(id) : id
};
//获取tagName
var mh2 = function (tagName, oParent) {
    return (oParent || document).getElementsByTagName(tagName);
};
//获取class
var mh3 = function (sClass, oParent) {
    var aClass = [],
        i = 0,
        reClass = new RegExp("(\\s|^)" + sClass + "($|\\s)"),
        aElement = mh2("*", oParent);
    for (i = 0; i < aElement.length; i++) reClass.test(aElement[i].className) && aClass.push(aElement[i]);
    return aClass
};

//获取元素位置
function getPos(obj) {
    var iTop = obj.offsetTop;
    var iLeft = obj.offsetLeft;
    while (obj.offsetParent) {
        iTop += obj.offsetParent.offsetTop;
        iLeft += obj.offsetParent.offsetLeft;
        obj = obj.offsetParent;
    }
    return {top: iTop, left: iLeft}
};
//创建照片墙对象
var PhotoWall = function () {
    this.initialize.apply(this, arguments)
};
PhotoWall.prototype = {
    initialize: function (obj, aData) {
        var oThis = this;
        this.oParent = mh1(obj);
        this.oUl = mh2("ul", this.oParent)[0];
        this.oBtn = mh2("a", this.oParent)[0];
        this.zIndex = 1;
        this.aPos = [];
        this.aData = aData;
        this.dom = document.documentElement || document.body;
        this.create();
        // this.oBtn.onclick = function () {
        //     oThis.randomOrder()
        // }
    },
    create: function () {
        var aFrag = document.createDocumentFragment();
        var i = 0;
        for (i = 0; i < this.aData.length; i++) {
            var oLi = document.createElement("li");
            var oa = document.createElement("a");
            oa.href = "javascript:;";
            if (this.aData[i].selected) {
                oa.className = "layui-btn";
            }
            else {
                oa.className = "layui-btn layui-btn-primary";
            }

            oa.innerText = this.aData[i].channelName;
            oLi.appendChild(oa);
            aFrag.appendChild(oLi)
        }
        this.oUl.appendChild(aFrag);
        this.aLi = mh2("li", this.oParent);
        this.changeLayout()
    },
    changeLayout: function () {
        var i = 0;
        this.oParent.style.height = this.oParent.offsetHeight - 2 + "px";
        this.aPos.length = 0;
        for (i = 0; i < this.aLi.length; i++) this.aLi[i].style.cssText = "";
        for (i = 0; i < this.aLi.length; i++) {
            this.aLi[i].index = i;
            this.aLi[i].style.top = getPos(this.aLi[i]).top + "px";
            this.aLi[i].style.left = getPos(this.aLi[i]).left + "px";
            this.aPos.push({left: getPos(this.aLi[i]).left, top: getPos(this.aLi[i]).top})
        }
        for (i = 0; i < this.aLi.length; i++) {
            this.aLi[i].style.position = "absolute";
            this.aLi[i].style.margin = "0";
            this.drag(this.aLi[i])
        }
    },
    drag: function (obj, handle) {
        var oThis = this;
        var handle = handle || obj;
        handle.style.cursor = "move";
        handle.onmousedown = function (event) {
            var event = event || window.event;
            var disX = event.clientX - this.offsetLeft;
            var disY = event.clientY - this.offsetTop;
            var oNear = null;
            handle.style.zIndex = oThis.zIndex++;

            document.onmousemove = function (event) {
                var event = event || window.event;
                var iL = event.clientX - disX;
                var iT = event.clientY - disY;
                var maxL = Math.max(oThis.dom.clientWidth, oThis.dom.scrollWidth) - handle.offsetWidth;
                var maxT = Math.max(oThis.dom.clientHeight, oThis.dom.scrollHeight) - handle.offsetHeight;

                iL < 0 && (iL = 0);
                iT < 0 && (iT = 0);
                iL > maxL && (iL = maxL);
                iT > maxT && (iT = maxT);

                handle.style.left = iL + "px";
                handle.style.top = iT + "px";

                oNear = oThis.findNearest(obj);

                for (var i = 0; i < oThis.aLi.length; i++) oThis.aLi[i].className = "";

                oNear && (oNear.className = "hig");

                return false
            };
            document.onmouseup = function () {
                document.onmousemove = null;
                document.onmouseup = null;

                if (oNear) {
                    handle.index = [handle.index, oNear.index];
                    oNear.index = handle.index[0];
                    handle.index = handle.index[1];
                    oNear.style.zIndex = oThis.zIndex++;
                    oThis.doMove(handle, oThis.aPos[handle.index]);
                    oThis.doMove(oNear, oThis.aPos[oNear.index]);
                    oNear.className = "";
                }
                else {
                    oThis.doMove(handle, oThis.aPos[handle.index])
                }

                handle.releaseCapture && handle.releaseCapture()
            };
            this.setCapture && this.setCapture();
            return false
        };
    },
    doMove: function (obj, iTarget, callback) {
        var oThis = this;
        clearInterval(obj.timer);
        obj.timer = setInterval(function () {
            var iCurL = getPos(obj).left;
            var iCurT = getPos(obj).top;
            var iSpeedL = (iTarget.left - iCurL) / 5;
            var iSpeedT = (iTarget.top - iCurT) / 5;
            iSpeedL = iSpeedL > 0 ? Math.ceil(iSpeedL) : Math.floor(iSpeedL);
            iSpeedT = iSpeedT > 0 ? Math.ceil(iSpeedT) : Math.floor(iSpeedT);

            if (iCurL == iTarget.left && iCurT == iTarget.top) {
                clearInterval(obj.timer);
                callback && callback()
            }
            else {
                obj.style.left = iCurL + iSpeedL + "px";
                obj.style.top = iCurT + iSpeedT + "px"
            }
        }, 30)
    },
    findNearest: function (obj) {
        var aDistance = [];
        var i = 0;
        for (i = 0; i < this.aLi.length; i++) aDistance[i] = this.aLi[i] == obj ? Number.MAX_VALUE : this.getDistance(obj, this.aLi[i]);

        var minNum = Number.MAX_VALUE;
        var minIndex = -1;
        for (i = 0; i < aDistance.length; i++) aDistance[i] < minNum && (minNum = aDistance[i], minIndex = i);

        return this.isButt(obj, this.aLi[minIndex]) ? this.aLi[minIndex] : null
    },
    getDistance: function (obj1, obj2) {
        var a = (obj1.offsetLeft + obj1.offsetWidth / 2) - (obj2.offsetLeft + obj2.offsetWidth / 2);
        var b = (obj1.offsetTop + obj1.offsetTop / 2) - (obj2.offsetTop + obj2.offsetTop / 2);
        return Math.sqrt(a * a + b * b)
    },
    isButt: function (obj1, obj2) {
        var l1 = obj1.offsetLeft;
        var t1 = obj1.offsetTop;
        var r1 = l1 + obj1.offsetWidth;
        var b1 = t1 + obj1.offsetHeight;

        var l2 = obj2.offsetLeft;
        var t2 = obj2.offsetTop;
        var r2 = l2 + obj2.offsetWidth;
        var b2 = t2 + obj2.offsetHeight;

        return !(r1 < l2 || b1 < t2 || r2 < l1 || b2 < t1)
    },
    randomOrder: function () {
        this.aPos.sort(function () {
            return Math.random() > 0.5 ? 1 : -1
        });
        for (var i = 0; i < this.aLi.length; i++) {
            this.aLi[i].index = i;
            this.doMove(this.aLi[i], this.aPos[i])
        }
    }
};
window.onload = function () {

    var aBox = mh3("box");
    var aExample = [];
    var aData1 = [];
    var aData2 = [];
    //生成数据
    var url = "channel/list";
    var d = {paginate: false};

    $.ajax({
        type: "POST",
        url: url,
        async: false,
        data: d,

        success: function (result) {
            for (var i = 0; i < result.data.length; i++) {
                if (result.data[i].selected) {
                    aData1[aData1.length] = result.data[i];
                }
                else {
                    aData2[aData2.length] = result.data[i];
                }
            }
        }
    });

    //创建实例
    var oExample1 = new PhotoWall(aBox[0], aData1);
    var oExample2 = new PhotoWall(aBox[1], aData2);
    aExample.push(oExample1);
    aExample.push(oExample2);
    this.onresize = function () {
        for (var p in aExample) aExample[p].changeLayout()
    };
    this.onresize();

    $("#save-postions").click(function () {
        var aData3 = aData1.concat(aData2);
        $.each($("ul"), function (i) {
            $.each($(this).find("li"), function (j) {
                var htmlPostion = parseInt(($(this).css("left")).replace("px", "")) + parseInt(($(this).css("top")).replace("px", ""));

                if (i == 0) {
                    for (var k = 0; k < aData1.length; k++) {
                        var wallPostion = oExample1.aPos[k].left + oExample1.aPos[k].top;
                        if (htmlPostion == wallPostion) {
                            aData3[j].position = k + 1;
                            break;
                        }
                    }
                }
                else if (i == 1) {
                    for (var k = 0; k < aData2.length; k++) {
                        var wallPostion = oExample2.aPos[k].left + oExample2.aPos[k].top;
                        if (htmlPostion == wallPostion) {
                            aData3[aData1.length + j].position = k + 1;
                            break;
                        }
                    }
                }
            });
        });
        var channels = [];
        //只更新postion就行了
        $.each(aData3, function () {
            channels[channels.length] = {"channelId": this.channelId, "position": this.position}
        });
        $.ajax({
            type: "POST",
            url: "channel/updatePostions",
            async: false,
            data: JSON.stringify(channels),//@RequestBody接收的是一个json串,而不是json对象
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {
                if (result == 0) {
                    parent.layer.msg("操作成功");
                    parent.location.reload();
                    //当你在iframe页面关闭自身时
                    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                    parent.layer.close(index); //再执行关闭
                }
                else {
                    parent.layer.msg("保存失败");
                }
            }
        });
    });
};

