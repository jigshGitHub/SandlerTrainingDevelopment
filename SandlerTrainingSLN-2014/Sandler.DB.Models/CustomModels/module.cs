using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sandler.DB.Models
{
    public partial class module
    {

        public List<int> pageMenuGroups_
        {
            get
            {
                if (String.IsNullOrEmpty(pageMenuGroups))
                    return null;
                else
                {
                    List<String> _strings = new List<string>(pageMenuGroups.Split(','));
                    return _strings.ConvertAll<int>(x => Convert.ToInt32(x));
                }
            }
        }
    }
}
