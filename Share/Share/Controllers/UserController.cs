using MySQL_EC;
using Share.Util;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Share.Controllers
{
    public class UserController : Controller
    {
        IService service = new ServiceImpl();
        // GET: User
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ToLogin() {

            return View("Login");
        }
        public bool Login()
        {
            var user = service.SelectToDateTable("User", MySqlUtil.GetSelect(Request), null);
            if (user.Columns.Count > 0)
            {
                Session["User_id"] = service.SelectToDateTable("User", MySqlUtil.GetSelect(Request), null).Rows[0][0];
                Session["User_name"]= service.SelectToDateTable("User", MySqlUtil.GetSelect(Request), null).Rows[0][1];
                return true;
            }
            else
                return false;
        }
        public ActionResult ToRegister() {

            return View("Register");
        }
        public void Logout() {

            Session.Remove("User_id");
        }
        public bool Register()
        {
            if (service.Insert("User", MySqlUtil.GetSelect(Request)) > 0){
                return true;
            }
            return false;
        }
    }
}