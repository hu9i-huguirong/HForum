function shake(msg) {
	$.tooltip(msg);
	$("#login_form").removeClass('shake_effect');
	setTimeout(function() {
				$("#login_form").addClass('shake_effect')
			}, 1);
}

$(function() {
	$("#login").click(function() {
				var userName = $("#input-10").val();
				var userPwd = $("#input-11").val();
				
				var phone_reg = /^[1][3,4,5,7,8][0-9]{9}$/;
				var email_reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
				if ((!userName || userName.trim() == "") && (!userPwd)) {
					shake("请输入要登录的帐号和密码");
					return false;
				} else if (!userName || userName.trim() == "") {
					shake("登录帐号不能为空");
					return false;
				} else if (!userPwd) {
					shake("密码不能为空");
					return false;
				} else {
					if (email_reg.test(userName) || phone_reg.test(userName)) {
						$("#login").html("登录中...");
						//禁用按钮
						$("#login").attr("disabled",true);	
						$(".login-form").submit();				
						return true;
					} else {
						shake("请输入有效邮箱帐号或手机号");
						return false;
					}
				}

			});

});

(function() {
	if (!String.prototype.trim) {
		(function() {
			var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
			String.prototype.trim = function() {
				return this.replace(rtrim, '');
			};
		})();
	}

	[].slice.call(document.querySelectorAll('input.input__field')).forEach(
			function(inputEl) {
				if (inputEl.value.trim() !== '') {
					classie.add(inputEl.parentNode, 'input--filled');
				}

				inputEl.addEventListener('focus', onInputFocus);
				inputEl.addEventListener('blur', onInputBlur);
			});

	function onInputFocus(ev) {
		classie.add(ev.target.parentNode, 'input--filled');
	}

	function onInputBlur(ev) {
		if (ev.target.value.trim() === '') {
			classie.remove(ev.target.parentNode, 'input--filled');
		}
	}
})();