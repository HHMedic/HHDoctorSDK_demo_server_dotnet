<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProd.aspx.cs" Inherits="HHmedic.Sdk.Server.Demo.Web.AddProd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, minimal-ui" />
    <title>添加产品套餐</title>
    <link rel="stylesheet" href="../Vendor/weui/1.1.2/weui.css" />
    <link rel="stylesheet" href="../Vendor/weui/1.1.2/weui.example.css" />
    <link rel="stylesheet" href="../Vendor/hh/css/sdk-demo.css" />
</head>
<body>
    <div class="page">
        <div class="page__hd">
            <h1 class="page__title">添加产品套餐
            </h1>
            <p class="page__desc">给指定的用户添加产品套餐。</p>
        </div>
        <div class="page__bd">
            <div class="weui-cells__title">用户及产品套餐信息</div>
            <div class="weui-cells weui-cells_form">
                <div class="weui-cell">
                    <div class="weui-cell__hd">
                        <label class="weui-label">手机号</label>
                    </div>
                    <div class="weui-cell__bd">
                        <input id="phoneNum" class="weui-input" type="tel" placeholder="请输入手机号" />
                    </div>
                </div>


                <div class="weui-cell weui-cell_select weui-cell_select-after">
                    <div class="weui-cell__hd">
                        <label class="weui-label">产品套餐</label>
                    </div>
                    <div class="weui-cell__bd">
                        <select id="pid" class="weui-select">
                            <option value="100">和享年卡(100)</option>
                            <option value="101">和享季卡(101)</option>
                            <option value="102">单次会员(102)</option>
                            <option value="103">尊享年卡(103)</option>
                        </select>
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
                    <a href="https://api.hh-medic.com/project/47/interface/api/1568" class="weui-footer__link">HH-API</a>
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
            addProduct();
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

        //添加产品套餐
        function addProduct() {
            var params = new Array();
            params.push('phoneNum=' + $('#phoneNum').val());
            params.push('pid=' + $('#pid').val());
            $.post('./add', params.join('&'), function (res, succ) {
                if ('success' == succ) {
                    showMsg('成功：' + res);
                } else {
                    showMsg('添加产品套餐失败！');
                }
            })
        }

    </script>
</body>
</html>
