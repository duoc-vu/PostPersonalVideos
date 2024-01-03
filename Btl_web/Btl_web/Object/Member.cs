using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Btl_web.Object
{
    public class Member
    {
        public string MemberName { get; set; }

        /// <summary>
        /// Mật khẩu
        /// </summary>

        public string Password { get; set; }

        public string UrlImg { get; set; }
        public string MST { get; set; }

        public string Bio { get; set; }
    }
}