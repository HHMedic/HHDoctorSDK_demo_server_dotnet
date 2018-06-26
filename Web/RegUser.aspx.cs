using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HHmedic.Sdk.Server.Family.Entity;
using HHmedic.Sdk.Server.Family.Request;
using HHmedic.Sdk.Server.Core.Common;
using HHmedic.Sdk.Server.Core.Util;

namespace HHmedic.Sdk.Server.Demo.Web
{
    public partial class RegUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ("POST" == Request.HttpMethod)
            {
                //提交数据
                string _name = Request["name"];
                string _phoneNum = Request["phoneNum"];
                string _sex = Request["sex"];
                string _birthday = Request["birthday"];
                string _userId = Request["userId"];
                Family.Entity.User _user = new Family.Entity.User()
                {
                    Name = _name,
                    PhoneNum = _phoneNum,
                    Sex = "男" == _sex ? Family.Entity.User.SexEnum.男 : Family.Entity.User.SexEnum.女,
                    Birthday = DateTime.Parse(_birthday),
                    UserId = _userId
                };
                RegisterUser(_user);
            }
        }

        private void RegisterUser(Family.Entity.User User)
        {
            UserRequest _userRequest = new UserRequest();
            ServerResponse _serverResponse = _userRequest.RegisterUser(User, false, string.Empty);
            Response.Write(JsonUtil.SerializeObject(_serverResponse));
            Response.End();
        }
    }
}