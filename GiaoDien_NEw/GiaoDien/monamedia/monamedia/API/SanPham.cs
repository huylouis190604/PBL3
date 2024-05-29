using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace monamedia.API
{
    public class SanPham
    {
        public class Document
        {
            public List<ResultTable1> ResultTable1 { get; set; }
        }

        public class ResultTable1
        {
            public string Productid { get; set; }
            public string Name { get; set; }
            public string Brand { get; set; }
            public int Price { get; set; }
            public int Quantity { get; set; }
            public string Color { get; set; }
            public string Ram { get; set; }
            public string Memory { get; set; }
            public string Specid { get; set; }
            public string Img { get; set; }
            public string Type { get; set; }
            public string Specid1 { get; set; }
            public string Cpu { get; set; }
            public string Gpu { get; set; }
            public string Os { get; set; }
            public string Screen { get; set; }
            public string Pin { get; set; }
            public string Camera { get; set; }
            public string Size { get; set; }
            public int Warrantly { get; set; }
            public string Sound { get; set; }
            public string Weight { get; set; }
            public string Conectivitytechnologies { get; set; }
            public string Charge { get; set; }
            public int Yearofdebut { get; set; }
        }

        public class Root
        {
            public int code { get; set; }
            public string message { get; set; }
            public Document document { get; set; }
        }


    }
}