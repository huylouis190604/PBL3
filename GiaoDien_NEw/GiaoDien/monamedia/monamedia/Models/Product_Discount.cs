//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace monamedia.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product_Discount
    {
        public string productID { get; set; }
        public int discountID { get; set; }
    
        public virtual Discount Discount { get; set; }
        public virtual Discount Discount1 { get; set; }
        public virtual Product Product { get; set; }
        public virtual Product Product1 { get; set; }
    }
}