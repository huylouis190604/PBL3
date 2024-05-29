using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel.DataAnnotations;

namespace API.Model
{
    public class Sp_ShopingCartInputModel
    {
public int customerID { get;set;}
public int fee { get;set;}
public int total { get;set;}
public string productID { get;set;}
public int price { get;set;}

public int quantity { get;set;}
    }
}

