using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace monamedia.API
{
    public class OrderModel
    {
        public int CustomerID { get; set; }
        public int Fee { get; set; }
        public int Total { get; set; }
        public string ProductID { get; set; }
        public int Quantity { get; set; }
        public int Price { get; set; }

    }

}