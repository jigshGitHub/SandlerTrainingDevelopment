using Sandler.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sandler.Web.ViewModels
{
    public class BaseViewModel
    {
        public UserModel CurrentUser { get; set; }
        public string RoleEntityValue { get; set; }
        public List<Menu> CRMMenu { get; set; }
    }

    public class EntityViewModel<TEntity>
    {
        public BaseViewModel BaseModel { get; set; }
        public TEntity EntityModel { get; set; }
    }
}