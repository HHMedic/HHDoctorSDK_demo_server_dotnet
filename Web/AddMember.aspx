<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddMember.aspx.cs" Inherits="HHmedic.Sdk.Server.Demo.Web.AddMember" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, minimal-ui" />
    <title>添加成员</title>
    <link rel="stylesheet" href="../Vendor/weui/1.1.2/weui.css" />
    <link rel="stylesheet" href="../Vendor/weui/1.1.2/weui.example.css" />
    <link rel="stylesheet" href="../Vendor/hh/css/sdk-demo.css" />
</head>
<body>
    <div class="page">
        <div class="page__hd">
            <h1 class="page__title">添加成员
            </h1>
            <p class="page__desc">在用户家庭中添加新的成员。</p>
        </div>
        <div class="page__bd">
            <div class="weui-cells__title">成员信息</div>
            <div class="weui-cells weui-cells_form">
                <div class="weui-cell">
                    <div class="weui-cell__hd">
                        <label class="weui-label">主账号</label>
                    </div>
                    <div class="weui-cell__bd">
                        <input id="uuid" class="weui-input" type="number" placeholder="请输入家庭主账号uuid" />
                    </div>
                </div>

                <div class="weui-cell">
                    <div class="weui-cell__hd">
                        <label class="weui-label">姓名</label>
                    </div>
                    <div class="weui-cell__bd">
                        <input id="name" class="weui-input" type="text" placeholder="请输入成员姓名" />
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

                <div class="weui-cell weui-cell_select weui-cell_select-after">
                    <div class="weui-cell__hd">
                        <label class="weui-label">关系</label>
                    </div>
                    <div class="weui-cell__bd">
                        <select id="relation" class="weui-select">
                            <option value="妻子">妻子</option>
                            <option value="丈夫">丈夫</option>
                            <option value="儿子">儿子</option>
                            <option value="女儿">女儿</option>
                            <option value="父亲">父亲</option>
                            <option value="母亲">母亲</option>
                            <option value="公公">公公</option>
                            <option value="婆婆">婆婆</option>
                            <option value="岳父">岳父</option>
                            <option value="岳母">岳母</option>
                        </select>
                    </div>
                </div>

                <div class="weui-cell">
                    <div class="weui-cell__hd">
                        <label class="weui-label">头像</label>
                    </div>
                    <div class="weui-cell__bd">
                        <input id="photoUrl" class="weui-input" type="text" placeholder="头像URL，留空使用默认" />
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
                    <a href="https://api.hh-medic.com/project/47/interface/api/1584" class="weui-footer__link">HH-API</a>
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
            if ($(this).hasClass('weui-btn_disabled')) {
                return;
            }

            var checkResult = checkInput();
            if (checkResult) {
                showMsg(checkResult);
                return false;
            }
            $('#btnSave').addClass('weui-btn_disabled')
            addMember();
            return false;
        })

        //检查输入信息
        function checkInput() {
            var inputs = $('.weui-cells_form').find('input');
            for (var i = 0; i < inputs.length; i++) {
                if (!$(inputs[i]).val()) {
                    var label = $(inputs[i]).parent().parent().find('.weui-label').text();
                    if ('头像' == label) {
                        continue;
                    }
                    return label + '不能为空';
                }
            }
            return '';
        }

        //添加成员
        function addMember() {
            var params = new Array();
            var inputs = $('.weui-cells_form').find('input');
            for (var i = 0; i < inputs.length; i++) {
                params.push($(inputs[i]).attr('id') + '=' + encodeURIComponent($(inputs[i]).val()));
            }
            params.push('sex=' + encodeURIComponent($('#sex').val()));
            params.push('relation=' + encodeURIComponent($('#relation').val()));

            $.post('./addmember', params.join('&'), function (res, succ) {
                if ('success' == succ) {
                    showMsg('调用成功：' + res);
                } else {
                    showMsg('添加成员失败！');
                    $('#btnSave').removeClass('weui-btn_disabled')
                }
            })
        }

    </script>

</body>
</html>
