
using MySQL_EC;
using Share.Util;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Share.Controllers
{
    public class NewsController : Controller
    {
        IService service = new ServiceImpl();
        public ViewResult Index()
        {
            DataTable dataTable = service.SelectToDateTable("new", 
                MySqlUtil.GetSelect(Request), null);//查询记录
            return View(dataTable);
        }
        public int InsertComment()
        {
            return service.Insert("comment", MySqlUtil.GetSelect(Request));//插入记录
        }
    
        public string InsertNews() {
            return "0";
        }
        public string SelectNewsByType() {

            return service.Select("new", MySqlUtil.GetSelect(Request), null);
        }
        public int Report(){

            return service.Insert("report", MySqlUtil.GetSelect(Request));
        }
        public ViewResult Comment() {

            DataTable dataTable = service.SelectToDateTable("commentAnduser", MySqlUtil.GetSelect(Request), "time desc");
            return View(dataTable);
        }
    }
}