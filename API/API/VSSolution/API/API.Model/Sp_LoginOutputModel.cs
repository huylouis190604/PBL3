using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel.DataAnnotations;

namespace API.Model
{
    public class Sp_LoginOutputModel { 
public List<Sp_Login_ResultTable1> ResultTable1{get;set;}

public Sp_LoginOutputModel()
{
ResultTable1 = new List<Sp_Login_ResultTable1>();
}
}

public class Sp_Login_ResultTable1 {
        public int customerID { get; set; }

        public int accountID { get;set;}
        public string fullName { get; set; }
        public DateTime birthDate { get; set; }
        public string address { get; set; }
        public string phoneNumber { get; set; }

    }

}

