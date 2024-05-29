using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace monamedia.API
{
    public class LaptopViewModel
    {
        public string ProductId { get; set; }
        public string Name { get; set; }
        public string Brand { get; set; }
        public int Price { get; set; }
        public int Quantity { get; set; }
        public string Color { get; set; }
        public string Ram { get; set; }
        public string Memory { get; set; }
        public string SpecId { get; set; }
        public string Img { get; set; }
        public string Type { get; set; }
        public string SpecId1 { get; set; }
        public string Cpu { get; set; }
        public string Gpu { get; set; }
        public string Os { get; set; }
        public string Screen { get; set; }
        public string Pin { get; set; }
        public string Camera { get; set; }
        public string Size { get; set; }
        public int Warranty { get; set; }
        public string Sound { get; set; }
        public string Weight { get; set; }
        public string ConnectivityTechnologies { get; set; }
        public string Charge { get; set; }
        public int YearOfDebut { get; set; }
        public int? discountedPrice { get; set; }
        public int? per_cent { get; set; }
    }

}