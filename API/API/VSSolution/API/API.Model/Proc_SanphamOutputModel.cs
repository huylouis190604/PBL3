using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel.DataAnnotations;

namespace API.Model
{
    public class Proc_SanphamOutputModel { 
public List<Proc_Sanpham_ResultTable1> ResultTable1{get;set;}

public Proc_SanphamOutputModel()
{
ResultTable1 = new List<Proc_Sanpham_ResultTable1>();
}
}

public class Proc_Sanpham_ResultTable1 {

        public String Productid { get; set; }
        public String Name { get; set; }
        public String Brand { get; set; }
        public Int32 Price { get; set; }
        public Int32 Quantity { get; set; }
        public String Color { get; set; }
        public String Ram { get; set; }
        public String Memory { get; set; }
        public String Specid { get; set; }
        public String Img { get; set; }
        public String Type{get;set;}
        public String Specid1 { get; set; }
        public String Cpu { get; set; }
        public String Gpu { get; set; }
        public String Os { get; set; }
        public String Screen { get; set; }
        public String Pin { get; set; }
        public String Camera { get; set; }
        public String Size { get; set; }
        public Int32 Warrantly { get; set; }
        public String Sound { get; set; }
        public String Weight { get; set; }
        public String Conectivitytechnologies { get; set; }
        public String Charge { get; set; }
        public Int32 Yearofdebut { get; set; }
        public Int32? discountedPrice { get; set; }
        public int? per_cent { get; set; }
    }
}

