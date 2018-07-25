using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HHmedic.Sdk.Server.Core.Common;
using HHmedic.Sdk.Server.Family.Entity;
using HHmedic.Sdk.Server.Family.Request;
using HHmedic.Sdk.Server.Core.Util;

namespace HHmedic.Sdk.Server.Demo.Web
{
    public partial class AddProd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ("POST" == Request.HttpMethod)
            {
                //提交数据
                string _phoneNum = Request["phoneNum"];
                string _imei = Request["imei"];
                string _pid = Request["pid"];
                Product _product = new Product()
                {
                    PhoneNum = _phoneNum,
                    Imei = _imei,
                    Pid = int.Parse(_pid)
                };
                AddProduct(_product);
            }
        }

        private void AddProduct(Product Product)
        {
            ProductRequest _productRequest = new ProductRequest();
            ServerResponse _serverResponse = _productRequest.AddProduct(Product);
            Response.Write(JsonUtil.SerializeObject(_serverResponse));
            Response.End();
        }
    }
}