using HHmedic.Sdk.Server.Core.Common;
using HHmedic.Sdk.Server.Core.Util;
using HHmedic.Sdk.Server.Family.Entity;
using HHmedic.Sdk.Server.Family.Request;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HHmedic.Sdk.Server.Demo.Web
{
    public partial class AddMember : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ("POST" == Request.HttpMethod)
            {
                string _uuid = Request["uuid"];
                string _name = Request["name"];
                string _photo = Request["photoUrl"];
                string _sex = Request["sex"];
                string _birthday = Request["birthday"];
                string _relation = Request["relation"];
                DoAddMember(_uuid, _name, _photo, _sex, _birthday, _relation);
            }
        }

        private void DoAddMember(string Pid, string Name, string Photo, string Sex, string Birthday, string Relation)
        {
            User _user = new User()
            {
                Pid = long.Parse(Pid),
                Name = Name,
                Birthday = DatetimeUtil.GetUnixTimeStamp(Birthday),
                Sex = Sex,
                Photourl = Photo,
                Relation = Relation
            };
            UserRequest _userRequest = new UserRequest();
            ServerResponse _serverResponse = _userRequest.AddMember(_user, false, string.Empty);
            Response.Write(JsonUtil.SerializeObject(_serverResponse));
            Response.End();
        }
    }
}