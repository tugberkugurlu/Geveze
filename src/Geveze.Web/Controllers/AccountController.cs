using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Mvc;
using System.Web.Security;
using Dapper;
using Geveze.Web.Models;

namespace Geveze.Web.Controllers 
{
    public class AccountController : Controller
    {
        public const string DbConnStrName = "gevezedb";

        public ViewResult Login() 
        {
            return View();
        }

        [HttpPost]
        [ActionName("Login")]
        public ActionResult PostLogin(LoginModel loginModel) 
        {
            if (ModelState.IsValid)
            {
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["gevezedb"].ConnectionString))
                {
                    connection.Open();
                    connection.Execute("INSERT INTO Users (Id, Name) VALUES(@id, @name)", new { id = Guid.NewGuid().ToString("D"), name = loginModel.Name });
                }

                FormsAuthentication.SetAuthCookie(loginModel.Name, true);
                return RedirectToAction("index", "home");
            }

            return View(loginModel);
        }

        [HttpPost]
        [ActionName("SignOut")]
        public ActionResult PostSignOut() 
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("index", "home");
        }
    }
}