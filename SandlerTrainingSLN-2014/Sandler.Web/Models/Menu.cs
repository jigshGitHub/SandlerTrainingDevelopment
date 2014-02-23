using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sandler.Web.Models
{
    [Serializable()]
    public class MenuItem
    {
        public string Id { get; set; }
        public string Text { get; set; }
        public string Link { get; set; }
        public bool IsVisible { get; set; }

        public MenuItem()
        {
            //
            // TODO: Add constructor logic here
            //
        }
    }

    [Serializable()]
    public class Menu
    {
        public string Title { get; set; }
        public bool IsVisible { get; set; }
        public List<MenuItem> Items { get; set; }

        public Menu()
        {
        }
    }
}