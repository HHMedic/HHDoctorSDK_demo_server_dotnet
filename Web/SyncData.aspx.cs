using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HHmedic.Sdk.Server.Core.Util;
using HHmedic.Sdk.Server.Core.Profile;

namespace HHmedic.Sdk.Server.Demo.Web
{
    public partial class SyncData : System.Web.UI.Page
    {
        private string _data = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if ("POST" == Request.HttpMethod)
            {
                DoSyncData();
            }
        }

        private void DoSyncData()
        {
            //验证访问合法性
            if (!ValidateRequest())
            {
                Response.End();
                return;
            }
            SaveData();
            Response.Write("SUCCESS");
            Response.End();
        }

        /// <summary>
        /// 验证数据同步请求是否合法
        /// </summary>
        /// <returns></returns>
        private bool ValidateRequest()
        {
            string _curTime = Request["CurTime"],
                _md5 = Request["MD5"],
                _checkSum = Request["CheckSum"];
            _data = GetRequestBodyData();

            if (string.IsNullOrEmpty(_curTime)
                || string.IsNullOrEmpty(_md5)
                || string.IsNullOrEmpty(_checkSum)
                || string.IsNullOrEmpty(_data))
            {
                return false;
            }
            string _expectedCheckSum = CheckSumBuilder.GetCheckSum(SdkProfile.AppSecret, _md5, _curTime),
                _expectedMd5 = CheckSumBuilder.GetMD5(_data);

            return (_md5.Equals(_expectedMd5) && _checkSum.Equals(_expectedCheckSum));
        }

        /// <summary>
        /// 获取post请求的body部分
        /// </summary>
        /// <returns></returns>
        private string GetRequestBodyData()
        {
            Stream _stream = Request.InputStream;
            List<byte> _inputBytes = new List<byte>();
            int _bufSize = 1024;
            byte[] _buffer = new byte[_bufSize];
            int _readLength = _stream.Read(_buffer, 0, _bufSize);
            while (_readLength > 0)
            {
                byte[] _tmpBuf = new byte[_readLength];
                Array.Copy(_buffer, _tmpBuf, _readLength);
                _inputBytes.AddRange(_tmpBuf);
                _readLength = _stream.Read(_buffer, 0, _bufSize);
            }
            return System.Text.Encoding.UTF8.GetString(_inputBytes.ToArray());
        }

        /// <summary>
        /// 对同步的数据进行处理
        /// </summary>
        private void SaveData()
        {
            Console.WriteLine(_data);
        }
    }
}