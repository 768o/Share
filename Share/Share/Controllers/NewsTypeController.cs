using MySQL_EC;

using System.Web.Mvc;

namespace Share.Controllers
{
    public class NewsTypeController : Controller
    {
        IService service = new ServiceImpl();
        // GET: NewsType
        public string Index()
        {
            return service.Select("newstype",null,null);
        }
    }
}