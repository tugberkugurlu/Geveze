using System.ComponentModel.DataAnnotations;

namespace Geveze.Web.Models {
    
    public class LoginModel {

        [Required]
        public string Name { get; set; }
    }
}