<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SyncData.aspx.cs" Inherits="HHmedic.Sdk.Server.Demo.Web.SyncData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, minimal-ui" />
    <title>数据抄送</title>
    <link rel="stylesheet" href="../Vendor/weui/1.1.2/weui.css" />
    <link rel="stylesheet" href="../Vendor/weui/1.1.2/weui.example.css" />
    <link rel="stylesheet" href="../Vendor/hh/css/sdk-demo.css" />
</head>
<body>
    <div class="page">
        <div class="page__hd">
            <h1 class="page__title">数据抄送接口实现
            </h1>
            <p class="page__desc">
                请将当前页面的线上生产系统URL提供给和缓接口人，作为数据抄送接口URL。
            </p>
            <p class="page__desc">
                当前接口实现请参考代码：HHmedic.Sdk.Server.Demo.Web.SyncData类
            </p>
        </div>
        <div class="page__bd page__bd_spacing">
        </div>
        <div class="page__ft">
            <div class="weui-footer weui-footer_fixed-bottom">
                <p class="weui-footer__links">
                    <a href="https://api.hh-medic.com/project/47/interface/api/1370" class="weui-footer__link">HH-API</a>
                </p>
                <p class="weui-footer__text">Copyright © 2015-2018 hh-medic.com</p>
            </div>
        </div>
    </div>
</body>
</html>
