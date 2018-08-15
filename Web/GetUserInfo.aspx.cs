using HHmedic.Sdk.Server.Core.Common;
using HHmedic.Sdk.Server.Core.Util;
using HHmedic.Sdk.Server.Family.Request;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HHmedic.Sdk.Server.Demo.Web
{
    public partial class GetUserInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ("POST" == Request.HttpMethod)
            {
                string _uuid = Request["uuid"];
                DoGetUserInfo(_uuid);
            }
        }

        private void DoGetUserInfo(string Uuid)
        {
            ServerResponse _serverResponse;
            if (!string.IsNullOrEmpty(Uuid))
            {
                UserRequest _userRequest = new UserRequest();
                _serverResponse = _userRequest.GetUserInfo(long.Parse(Uuid));
            }
            else
            {
                _serverResponse = new ServerResponse()
                {
                    Status = 400,
                    Message = "uuid不能为空"
                };
            }
            Response.Write(JsonUtil.SerializeObject(_serverResponse));
            Response.End();
        }
    }
}