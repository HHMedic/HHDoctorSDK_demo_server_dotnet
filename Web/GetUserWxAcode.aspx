<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetUserWxAcode.aspx.cs" Inherits="HHmedic.Sdk.Server.Demo.Web.GetUserWxAcode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, minimal-ui" />
    <title>获取小程序码</title>
    <link rel="stylesheet" href="../Vendor/weui/1.1.2/weui.css" />
    <link rel="stylesheet" href="../Vendor/weui/1.1.2/weui.example.css" />
    <link rel="stylesheet" href="../Vendor/hh/css/sdk-demo.css" />
</head>
<body>
    <div class="page">
        <div class="page__hd">
            <h1 class="page__title">获取小程序码
            </h1>
            <p class="page__desc">根据UUID获取指定用户的微信小程序码，可在微信中直接长按呼叫视频医生。</p>
        </div>
        <div class="page__bd">
            <div class="weui-cells__title">用户信息</div>
            <div class="weui-cells weui-cells_form">
                <div class="weui-cell">
                    <div class="weui-cell__hd">
                        <label class="weui-label">UUID</label>
                    </div>
                    <div class="weui-cell__bd">
                        <input id="uuid" class="weui-input" type="number" placeholder="用户UUID" />
                    </div>
                </div>
            </div>

            <div class="weui-btn-area">
                <a class="weui-btn weui-btn_primary" href="javascript:" id="btnGet">获取</a>
            </div>

            <div class="weui-cells" style="text-align: center">
                <img id="imgWxAcode" style="width: 200px; height: 200px;"
                    src="data:image/gif;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVQImWNgYGBgAAAABQABh6FO1AAAAABJRU5ErkJggg==" />
            </div>
        </div>
        <div class="page__ft">
            <div class="weui-footer weui-footer_fixed-bottom">
                <p class="weui-footer__links">
                    <a href="#" class="weui-footer__link">HH-API</a>
                </p>
                <p class="weui-footer__text">Copyright © 2015-2018 hh-medic.com</p>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="../Vendor/jQuery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="../Vendor/hh/js/sdk-demo.js"></script>
    <script type="text/javascript">
        //点击"获取"按纽
        $('#btnGet').on('touchstart click', function () {
            var checkResult = checkInput();
            if (checkResult) {
                showMsg(checkResult);
                return false;
            }
            getWxAcode();
            return false;
        })

        //检查输入信息
        function checkInput() {
            var inputs = $('.weui-cells_form').find('input');
            for (var i = 0; i < inputs.length; i++) {
                if (!$(inputs[i]).val()) {
                    var label = $(inputs[i]).parent().parent().find('.weui-label').text();
                    if (label) {
                        return label + '不能为空';
                    } else {
                        var select = $(inputs[i]).parent().parent().find('.weui-select').text();
                        return select + '不能为空';
                    }
                }
            }
            return '';
        }

        //获取微信小程序码
        function getWxAcode() {
            var params = new Array();
            params.push('uuid=' + $('#uuid').val());
            $.post('./wxacode', params.join('&'), function (res, succ) {
                if ('success' == succ) {
                    showWxAcode(res);
                    showMsg('调用成功：' + res);
                } else {
                    showMsg('获取微信小程序码失败！');
                }
            })
        }

        //显示图片
        function showWxAcode(res) {
            var data = JSON.parse(res);
            if (200 == data.Status) {
                $('#imgWxAcode').attr('src', data.Data.wxacode);
            } else {
                $('#imgWxAcode').attr('src', 'data:image/gif;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVQImWNgYGBgAAAABQABh6FO1AAAAABJRU5ErkJggg==');
            }
        }
    </script>
</body>
</html>
