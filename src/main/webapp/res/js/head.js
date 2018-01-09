createHead("北京", "北京", 0);
// 百度地图API功能
var map = new BMap.Map("allmap");
var geolocation = new BMap.Geolocation();//浏览器定位
geolocation.getCurrentPosition(function (r) {
    if (this.getStatus() == BMAP_STATUS_SUCCESS) {
        //表示获取成功那么 r 这个参数就包含有当前的地理位置经纬度
        // 创建地理编码实例
        var myGeo = new BMap.Geocoder();
        // 根据坐标点获得该地点的地址描述，是地址解析的逆向转换。
        //指定经纬度获取地址
        myGeo.getLocation(r.point, function (result) {
            var addComp = result.addressComponents;
            //对应的省市区、县街道，街道号
            //alert(addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber);
            createHead(addComp.province,addComp.city,1);
        });
    }
    else {
        alert('定位失败' + this.getStatus());
        layui.use('layer', function () {
            var layer = layui.layer;
            layer.tips('没有定位到您的城市,您可以手动选择城市哦', '.tb-link',
                {
                    tips: [1, '#009F95'],
                    time: 6000,//6秒
                    fixed: true //fixed - 固定 即鼠标滚动时，层是否固定在可视区域。如果不想，设置fixed: false即可
                }
            );
        });
    }
    //关于状态码
    //BMAP_STATUS_SUCCESS 检索成功。对应数值“0”。
    //BMAP_STATUS_CITY_LIST 城市列表。对应数值“1”。
    //BMAP_STATUS_UNKNOWN_LOCATION 位置结果未知。对应数值“2”。
    //BMAP_STATUS_UNKNOWN_ROUTE 导航结果未知。对应数值“3”。
    //BMAP_STATUS_INVALID_KEY 非法密钥。对应数值“4”。
    //BMAP_STATUS_INVALID_REQUEST 非法请求。对应数值“5”。
    //BMAP_STATUS_PERMISSION_DENIED 没有权限。对应数值“6”。(自 1.1 新增)
    //BMAP_STATUS_SERVICE_UNAVAILABLE 服务不可用。对应数值“7”。(自 1.1 新增)
    //BMAP_STATUS_TIMEOUT 超时。对应数值“8”。(自 1.1 新增)
});


function createHead( provinceName,cityName,code) {
    cityName = cityName.replace("市", "");
    $.post("util/weather", {cityName: cityName}, function (result) {

        //天气
        var heads = "<div style=\"height: 34px;  background: #2577E3\" ><div class='y-box wtopbar'><ul class='y-left' style='margin-left: 120px;'>";
        heads += "<li class='tb-item weather'><a class='tb-link' href='javascript:;'><span>&nbsp;";
        heads += result[0].cityName + "</span><span class='city_state'>" + result[0].weatherDes + "";

        heads += "</span><span class='city_temperature'><em>" + result[0].min + "</em>° &nbsp;/&nbsp; <em>" + result[0].max;
        heads += "</em>° </span><i class='y-icon icon-more'></i></a><div class=\"weather-box\" ><div class=\"y-weather\" style='width: 280px;height: 140px;'>";
        heads += "<div class=\"w-header\" ><span class=\"y-icon icon-location\" >&nbsp;" + result[0].cityName + "</span><span class=\"wind\">" + result[0].wind;
        heads += "</span><span class=\"air\" style=\"background: #5cbf4c\">" + result[0].air + "</span></div><ul class=\"y-box days-weather show\">";
        heads += "<li class=\"y-left day\"><span class=\"title\">今天</span><div title=" + result[0].weatherDes + " class=\"weather-icon weather-icon-31\"></div>"
        heads += "<span class=\"temperature\"><em>" + result[0].min + "</em>° / <em>" + result[0].max + "</em>° </span></li>";
        heads += "<li class=\"y-left day\"><span class=\"title\">明天</span>";
        heads += "<div title=" + result[1].weatherDes + " class=\"weather-icon weather-icon-1\"></div>";
        heads += "<span class=\"temperature\"><em>" + result[1].min + "</em>° / <em>" + result[1].max + "</em>° </span></li>";
        heads += "<li class=\"y-left day\"><span class=\"title\">后天</span>";
        heads += "<div title=" + result[2].weatherDes + " class=\"weather-icon weather-icon-4\"></div>";
        heads += "<span class=\"temperature\"><em>" + result[2].min + "</em>° / <em>" + result[2].max + "</em>° </span></li></ul>";

        //城市选择
        heads += "<div class=\"y-box city-select\" ><div class=\"y-box\"><form class=\"layui-form layui-form-pane\" action=\"\">";
        heads += "<div class=\"layui-form-item\"><div class=\"layui-input-inline\" style=\"width: 90px;\"><select name=\"provinceName\" lay-filter=\"provinceName\">";

        $.each(cityObj, function (index) {
            if (index == 0) {
                $.each(this.citys, function () {
                    if (provinceName == this.citysName) {
                        heads += "<option selected value=" + this.citysName + ">" + this.citysName + "</option>";
                    }
                    else {
                        heads += "<option value=" + this.citysName + ">" + this.citysName + "</option>";
                    }

                });
            }
            else {
                if (provinceName == this.provinceName) {
                    heads += "<option selected value='" + this.provinceName + "'>" + this.provinceName + "</option>";
                }
                else {
                    heads += "<option value='" + this.provinceName + "'>" + this.provinceName + "</option>";
                }

            }
        });

        heads += " </select></div><div class=\"layui-input-inline\" style=\"width: 90px;\"><select name=\"cityName\">";

        $.each(cityObj, function (index) {
            if (index == 0) {
                $.each(this.citys, function () {
                    if (provinceName == this.citysName) {
                        heads += "<option selected value='" + this.citysName + "'>" + this.citysName + "</option>"
                    }
                });
            }
            else {
                if (provinceName == this.provinceName) {
                    $.each(this.citys, function () {
                        if (cityName == this.citysName) {
                            heads += "<option selected value='" + this.citysName + "'>" + this.citysName + "</option>"
                        }
                        else {
                            heads += "<option value='" + this.citysName + "'>" + this.citysName + "</option>"
                        }
                    });
                }
            }


        });
        heads += "</select></div></div> <div class=\"layui-form-item\"><div> <button class=\"layui-btn\" lay-submit=\"\" lay-filter=\"swich-city\" style=\"height: 35px; width: 90px\">确定</button>";
        heads += " <button class=\"layui-btn layui-btn-primary\" style=\"height: 35px;width: 90px;margin-left: 5px\">取消</button>";
        heads += "</div></div></form></div></div></div></div></li></ul>";

        //右侧工具条
        heads += " <ul class=\"y-right\"><li class=\"tb-item\"><a class=\"tb-link\" href=\"javascript:void(0)\">首页</a></li>";
        heads += "<li class=\"tb-item\"><a class=\"tb-link\" href=\"/\" target=\"_blank\">下载APP</a></li>";
        heads += "<li class=\"tb-item zoomIn dialog\"><a class=\"tb-link\" href=\"javascript:void(0)\">登录</a></li>";
        heads += " <li class=\"tb-item\"><a class=\"tb-link\" href=\"javascript:void(0)\">注册</a></li>";
        heads += "<li class=\"tb-item\"><a class=\"tb-link\" href=\"javascript:void(0)\">反馈</a></li>";
        heads += "<li class=\"tb-item more\"><a class=\"tb-link\" href=\"/about/\">更多产品</a>";
        heads += "<div class=\"layer\"><ul><li><a href=\"/\" class=\"layer-item\" target=\"_blank\">HForum社区</a></li>";
        heads += "<li><a href=\"/\" class=\"layer-item\" target=\"_blank\" >暂未开发</a></li>";
        heads += "<li><a href=\"/\" class=\"layer-item\" target=\"_blank\">暂未开发</a></li>";
        heads += "</ul></div></li></ul><div id=\"J_userFeedback\"></div></div> </div>";

        $("#header").html(heads);
        layui.use(['layer'], function () {
            var layer = layui.layer;
            form.render('select');
            if (code == 1) {
                layer.tips('您也可以自己选择城市哦', '.tb-link',
                    {
                        tips: [1, '#009F95'],
                        time: 6000,//6秒
                        fixed: true //fixed - 固定 即鼠标滚动时，层是否固定在可视区域。如果不想，设置fixed: false即可
                    }
                );
            }
            form.on('select(provinceName)', function (data) {
                // console.log(data.elem); //得到select原始DOM对象
                // console.log(data.value); //得到被选中的值
                // console.log(data.othis); //得到美化后的DOM对象
                $.each(cityObj, function (index) {
                    if (this.provinceName == "直辖市") {
                        $.each(this.citys, function () {
                            if (data.value == this.citysName) {
                                var option = "<option selected value='" + this.citysName + "'>" + this.citysName + "</option>"
                                $("select[name='cityName']").html(option);
                                form.render('select');
                            }
                        });
                    }
                    else {
                        if (data.value == this.provinceName) {
                            var options = ""
                            $.each(this.citys, function () {
                                options += "<option  value='" + this.citysName + "'>" + this.citysName + "</option>"
                            });
                            $("select[name='cityName']").html(options);
                            form.render('select');
                        }
                    }
                });
            });
        });


        $(".dialog").click(function () {
            layer.open({
                type: 2,
                area: ['600px', '450px'],
                title: ['', 'height: 3px;background: #2577E3'],
                scrollbar: false,//屏蔽浏览器滚动条
                content: ['/login', 'no'],
                success: function (layero, index) {
                }
            });
        });
        $(".icon-location").click(function () {
            $(".days-weather").removeClass('show');
            $(".city-select").show();
        });
        $(".layui-btn-primary").click(function () {
            $(".days-weather").addClass('show');
            $(".city-select").hide();
            return false;
        });

        form.on('submit(swich-city)', function (data) {
            var provinceName = data.field.provinceName;
            var cityName = data.field.cityName;
            createHead(provinceName, cityName, 2);
            return false;
        });
    });


}