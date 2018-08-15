<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetUserInfo.aspx.cs" Inherits="HHmedic.Sdk.Server.Demo.Web.GetUserInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, minimal-ui" />
    <title>获取用户信息</title>
    <link rel="stylesheet" href="../Vendor/weui/1.1.2/weui.css" />
    <link rel="stylesheet" href="../Vendor/weui/1.1.2/weui.example.css" />
    <link rel="stylesheet" href="../Vendor/hh/css/sdk-demo.css" />
</head>
<body>
    <div class="page">
        <div class="page__hd">
            <h1 class="page__title">获取用户信息
            </h1>
            <p class="page__desc">根据UUID获取指定用户的基本信息，包括姓名、头像、已购买的套餐信息等。</p>
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

            <div class="weui-form-preview">
                <div class="weui-form-preview__bd">
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">姓名</label>
                        <span id="name" class="weui-form-preview__value"></span>
                    </div>
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">性别</label>
                        <span id="sex" class="weui-form-preview__value"></span>
                    </div>
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">产品套餐</label>
                        <span id="productId" class="weui-form-preview__value"></span>
                    </div>
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">开始时间</label>
                        <span id="beginTime" class="weui-form-preview__value"></span>
                    </div>
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">结束时间</label>
                        <span id="expireTime" class="weui-form-preview__value"></span>
                    </div>
                </div>
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
            getUserInfo();
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

        //获取用户信息
        function getUserInfo() {
            var params = new Array();
            params.push('uuid=' + $('#uuid').val());
            $.post('./userinfo', params.join('&'), function (res, succ) {
                if ('success' == succ) {
                    var data = JSON.parse(res);
                    console.dir(data);
                    if (200 == data.Status) {
                        showMsg('调用成功');
                        showUserInfo(data);
                    } else {
                        showMsg('获取用户信息失败！' + data.Message);
                        clearUserInfo();
                    }
                } else {
                    showMsg('获取用户信息失败！');
                    clearUserInfo();
                }
            })
        }

        //显示图片
        function showUserInfo(data) {
            $('#name').text(data.Data.Name);
            $('#sex').text(data.Data.Sex);
            $('#productId').text(data.Data.Product.ProductServiceId);
            $('#beginTime').text(data.Data.Product.BeginTimeDT);
            $('#expireTime').text(data.Data.Product.ExpireTimeDT);
        }
        function clearUserInfo() {
            $('#name').text('');
            $('#sex').text('');
            $('#productId').text('');
            $('#beginTime').text('');
            $('#expireTime').text('');
        }
    </script>
</body>
</html>
