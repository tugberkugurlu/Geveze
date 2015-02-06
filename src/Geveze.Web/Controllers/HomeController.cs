using System.Web.Mvc;

namespace Geveze.Web.Controllers {

    [Authorize]
    public class HomeController : Controller {

        public ViewResult Index() {

            return View();
        }
    }
}