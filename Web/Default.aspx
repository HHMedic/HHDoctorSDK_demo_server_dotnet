<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HHmedic.Sdk.Server.Demo._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, minimal-ui" />
    <title>SDK演示</title>
    <link rel="stylesheet" href="../Vendor/weui/1.1.2/weui.css" />
    <link rel="stylesheet" href="../Vendor/weui/1.1.2/weui.example.css" />
    <link rel="stylesheet" href="../Vendor/hh/css/sdk-demo.css" />
</head>
<body>
    <div class="page">
        <div class="page__hd">
            <h1 class="page__title">
                <!--<img src="https://imgs.hh-medic.com/icon/hhlogo32.png" alt="WeUI" height="21px"/>-->
                和缓视频医生服务器SDK演示
            </h1>
            <p class="page__desc">和缓视频医生服务器SDK演示。</p>
        </div>
        <div class="page__bd page__bd_spacing">

            <div class="weui-cells__title">用户相关</div>
            <div class="weui-cells">
                <a class="weui-cell weui-cell_access" href="./user/reg">
                    <div class="weui-cell__bd">
                        <p>新用户注册</p>
                    </div>
                    <div class="weui-cell__ft">
                    </div>
                </a>
                <a class="weui-cell weui-cell_access" href="./user/addmember">
                    <div class="weui-cell__bd">
                        <p>添加家庭成员</p>
                    </div>
                    <div class="weui-cell__ft">
                    </div>
                </a>
                <a class="weui-cell weui-cell_access" href="./user/wxacode">
                    <div class="weui-cell__bd">
                        <p>获取小程序码</p>
                    </div>
                    <div class="weui-cell__ft">
                    </div>
                </a>
            </div>

            <div class="weui-cells__title">套餐产品</div>
            <div class="weui-cells">
                <a class="weui-cell weui-cell_access" href="./product/add">
                    <div class="weui-cell__bd">
                        <p>添加产品套餐</p>
                    </div>
                    <div class="weui-cell__ft">
                    </div>
                </a>
            </div>

            <div class="weui-cells__title">数据同步</div>
            <div class="weui-cells">
                <a class="weui-cell weui-cell_access" href="./data/sync">
                    <div class="weui-cell__bd">
                        <p>数据抄送</p>
                    </div>
                    <div class="weui-cell__ft">
                    </div>
                </a>
            </div>

        </div>
        <div class="page__ft">
            <div class="weui-footer weui-footer_fixed-bottom">
                <p class="weui-footer__links">
                    <a href="https://api.hh-medic.com" class="weui-footer__link">HH-API</a>
                </p>
                <p class="weui-footer__text">Copyright © 2015-2018 hh-medic.com</p>
            </div>
        </div>
    </div>
</body>
</html>
