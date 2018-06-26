﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegUser.aspx.cs" Inherits="HHmedic.Sdk.Server.Demo.Web.RegUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, minimal-ui" />
    <title>注册用户</title>
    <link rel="stylesheet" href="../Vendor/weui/1.1.2/weui.css" />
    <link rel="stylesheet" href="../Vendor/weui/1.1.2/weui.example.css" />
    <link rel="stylesheet" href="../Vendor/hh/css/sdk-demo.css" />
</head>
<body>
    <div class="page">
        <div class="page__hd">
            <h1 class="page__title">注册用户
            </h1>
            <p class="page__desc">同步用户基本信息，注册新用户，获取和缓视频医生用户uuid。</p>
        </div>
        <div class="page__bd">
            <div class="weui-cells__title">用户信息</div>
            <div class="weui-cells weui-cells_form">
                <div class="weui-cell">
                    <div class="weui-cell__hd">
                        <label class="weui-label">手机号</label>
                    </div>
                    <div class="weui-cell__bd">
                        <input id="phoneNum" class="weui-input" type="tel" placeholder="请输入手机号" />
                    </div>
                </div>

                <div class="weui-cell">
                    <div class="weui-cell__hd">
                        <label class="weui-label">姓名</label>
                    </div>
                    <div class="weui-cell__bd">
                        <input id="name" class="weui-input" type="text" placeholder="请输入姓名" />
                    </div>
                </div>

                <div class="weui-cell weui-cell_select weui-cell_select-after">
                    <div class="weui-cell__hd">
                        <label class="weui-label">性别</label>
                    </div>
                    <div class="weui-cell__bd">
                        <select id="sex" class="weui-select">
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select>
                    </div>
                </div>

                <div class="weui-cell">
                    <div class="weui-cell__hd">
                        <label class="weui-label">用户ID</label>
                    </div>
                    <div class="weui-cell__bd">
                        <input id="userId" class="weui-input" type="text" placeholder="请输入本系统用户唯一标识" />
                    </div>
                </div>

                <div class="weui-cell">
                    <div class="weui-cell__hd">
                        <label class="weui-label">出生日期</label>
                    </div>
                    <div class="weui-cell__bd">
                        <input id="birthday" class="weui-input" type="date" value="" />
                    </div>
                </div>

            </div>

            <div class="weui-btn-area">
                <a class="weui-btn weui-btn_primary" href="javascript:" id="btnSave">保存</a>
            </div>
        </div>
        <div class="page__ft">
            <div class="weui-footer weui-footer_fixed-bottom">
                <p class="weui-footer__links">
                    <a href="https://api.hh-medic.com/project/47/interface/api/1367" class="weui-footer__link">HH-API</a>
                </p>
                <p class="weui-footer__text">Copyright © 2015-2018 hh-medic.com</p>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="../Vendor/jQuery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="../Vendor/hh/js/sdk-demo.js"></script>
    <script type="text/javascript">
        //点击"保存"按纽
        $('#btnSave').on('touchstart click', function () {
            var checkResult = checkInput();
            if (checkResult) {
                showMsg(checkResult);
                return false;
            }
            regUser();
            return false;
        })

        //检查输入信息
        function checkInput() {
            //TODO:需对手机号码和出生日期的合法性进行验证。此处仅演示功能，不对上述字段做合法性验证。
            var inputs = $('.weui-cells_form').find('input');
            for (var i = 0; i < inputs.length; i++) {
                if (!$(inputs[i]).val()) {
                    var label = $(inputs[i]).parent().parent().find('.weui-label').text();
                    return label + '不能为空';
                }
            }
            return '';
        }

        //注册用户
        function regUser() {
            var params = new Array();
            var inputs = $('.weui-cells_form').find('input');
            for (var i = 0; i < inputs.length; i++) {
                params.push($(inputs[i]).attr('id') + '=' + encodeURIComponent($(inputs[i]).val()));
            }
            params.push('sex=' + encodeURIComponent($('#sex').val()));
            $.post('./reg', params.join('&'), function (res, succ) {
                if ('success' == succ) {
                    showMsg('成功：' + res);
                } else {
                    showMsg('注册用户失败！');
                }
            })
        }

    </script>
</body>
</html>
