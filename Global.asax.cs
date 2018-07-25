using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using HHmedic.Sdk.Server.Core.Profile;

namespace HHmedic.Sdk.Server.Demo
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            //注册页面路由
            RegRouters();
            //注册SDK
            //SdkProfile.Initialize(-1, "AppId", "AppSecret", SdkProfile.ProfileTypeEnum.TEST);
            SdkProfile.Initialize(3009, "3g8FOx82Fs8vgNboYYck", "Bck3bOeR5rSJ", SdkProfile.ProfileTypeEnum.TEST);
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }

        private void RegRouters()
        {
            RouteTable.Routes.MapPageRoute("Index", "", "~/Web/Default.aspx");
            RouteTable.Routes.MapPageRoute("RegUser", "user/reg", "~/Web/RegUser.aspx");
            RouteTable.Routes.MapPageRoute("AddMember", "user/addmember", "~/Web/AddMember.aspx");
            RouteTable.Routes.MapPageRoute("WxACode", "user/wxacode", "~/Web/GetUserWxAcode.aspx");
            RouteTable.Routes.MapPageRoute("AddProd", "product/add", "~/Web/AddProd.aspx");
            RouteTable.Routes.MapPageRoute("SyncData", "data/sync", "~/Web/SyncData.aspx");
        }

    }
}