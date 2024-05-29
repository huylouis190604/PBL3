using API.DataAccess.Interface;
using API.Model;
using API.Utility;
using Microsoft.Extensions.Configuration;
using System;
using System.Data;
using System.Data.SqlClient;

namespace API.DataAccess.Impl
{
    public class StoredProcedureDataAccess : IStoredProcedureDataAccess
    {
        private MSSqlDatabase MSSqlDatabase { get; set; }
        public StoredProcedureDataAccess(MSSqlDatabase msSqlDatabase)
        {
            MSSqlDatabase = msSqlDatabase;
            SetANSIWarning();
        }
        private void SetANSIWarning()
        {
            //You can add more warning ON/OFF at this place.
            var cmd = this.MSSqlDatabase.Connection.CreateCommand();
            cmd.CommandText = "SET ANSI_WARNINGS OFF";
            cmd.ExecuteNonQuery();

        }



        public Sp_LoginOutputModel Sp_Login(Sp_LoginInputModel input)
        {
            bool outParam = false;
            var ret = new Sp_LoginOutputModel();
            var cmd = this.MSSqlDatabase.Connection.CreateCommand();
            cmd.CommandText = "sp_Login";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("username", input.Username);
            cmd.Parameters.AddWithValue("password", input.Password);
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataSet ds = new DataSet();
                da.Fill(ds);


                foreach (DataRow r in ds.Tables[0].Rows)
                {
                    var z1 = new Sp_Login_ResultTable1()
                    {
                        customerID = Convert.ToInt32(r["customerID"]),

                        accountID = Convert.ToInt32(r["accountID"]),
                        birthDate = Convert.ToDateTime(r["birthDate"].ToString()),
                        address = (String)r["address"],
                        fullName = (String)r["fullName"],

                        phoneNumber = (String)r["phoneNumber"],
                    };
                    ret.ResultTable1.Add(z1);
                };
            }
            return ret;
        }

        public bool Sp_Reg(Sp_RegInputModel input)
        {
            bool outParam = false;

            var cmd = this.MSSqlDatabase.Connection.CreateCommand();
            cmd.CommandText = "sp_Reg";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("userName", input.Username);
            cmd.Parameters.AddWithValue("password", input.Password);
            cmd.Parameters.AddWithValue("email", input.Email);
            cmd.Parameters.AddWithValue("fullName", input.Fullname);
            cmd.Parameters.AddWithValue("birthDate", input.Birthdate);
            cmd.Parameters.AddWithValue("gender", input.Gender);
            cmd.Parameters.AddWithValue("address", input.Address);
            cmd.Parameters.AddWithValue("phoneNumber", input.Phonenumber);
            cmd.Parameters.AddWithValue("accountStatus", input.Accountstatus);
            cmd.Parameters.AddWithValue("role", input.Role);
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataSet ds = new DataSet();
                da.Fill(ds);


            }
            return true;
        }
        public bool Sp_ShopingCart(Sp_ShopingCartInputModel input)
        {
            bool outParam = false;

            var cmd = this.MSSqlDatabase.Connection.CreateCommand();
            cmd.CommandText = "Proc_ShopingCart";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("customerID", input.customerID);
            cmd.Parameters.AddWithValue("timeOrder", DateTime.Now);
            cmd.Parameters.AddWithValue("method", "COD");
            cmd.Parameters.AddWithValue("fee", input.fee);
            cmd.Parameters.AddWithValue("total", input.total);
            cmd.Parameters.AddWithValue("price", input.price);
            cmd.Parameters.AddWithValue("status", "Chờ xác nhận");
            cmd.Parameters.AddWithValue("productID", input.productID);
            cmd.Parameters.AddWithValue("quantity", input.quantity);
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataSet ds = new DataSet();
                da.Fill(ds);


            }
            return true;
        }
        public Proc_SanphamOutputModel Proc_Sanpham(Proc_SanphamInputModel input)
        {

            var ret = new Proc_SanphamOutputModel();
            var cmd = this.MSSqlDatabase.Connection.CreateCommand();
            cmd.CommandText = "Proc_SanPham";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("type", input.masp);
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataSet ds = new DataSet();
                da.Fill(ds);


                foreach (DataRow r in ds.Tables[0].Rows)
                {
                    var z1 = new Proc_Sanpham_ResultTable1()
                    {
                        Productid = (String)r["productID"],
                        Name = (String)r["name"],
                        Brand = (String)r["brand"],
                        Price = Convert.ToInt32(r["price"]),
                        Quantity = Convert.ToInt32(r["quantity"]),
                        Color = (String)r["color"],
                        Ram = (String)r["ram"],
                        Memory = (String)r["memory"],
                        Specid = (String)r["specID"],
                        Img = (String)r["img"],
                        Type = (String)r["type"],
                        Specid1 = (String)r["SpecID1"],
                        Cpu = (String)r["CPU"],
                        Gpu = (String)r["GPU"],
                        Os = (String)r["OS"],
                        Screen = (String)r["screen"],
                        Pin = (String)r["pin"],
                        Camera = (String)r["camera"],
                        Size = (String)r["size"],
                        Warrantly = Convert.ToInt32(r["warrantly"]),
                        Sound = (String)r["sound"],
                        Weight = (String)r["weight"],
                        Conectivitytechnologies = (String)r["conectivityTechnologies"],
                        Charge = (String)r["charge"],
                        Yearofdebut = Convert.ToInt32(r["yearOfDebut"]),
                        discountedPrice = Convert.ToInt32(r["discountedPrice"]),
                        per_cent = r["per_cent"] == null? 0: Convert.ToInt32(r["per_cent"]),
                    };
                    ret.ResultTable1.Add(z1);
                };
            }
            return ret;
        }
        public Proc_SanphamCTOutputModel Proc_SanphamCT(Proc_SanphamCTInputModel input)
        {

            var ret = new Proc_SanphamCTOutputModel();
            var cmd = this.MSSqlDatabase.Connection.CreateCommand();
            cmd.CommandText = "Proc_DetailSP";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("productID", input.masp);
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataSet ds = new DataSet();
                da.Fill(ds);


                foreach (DataRow r in ds.Tables[0].Rows)
                {
                    var z1 = new Proc_SanphamCT_ResultTable1()
                    {
                        Productid = (String)r["productID"],
                        Name = (String)r["name"],
                        Brand = (String)r["brand"],
                        Price = Convert.ToInt32(r["price"]),
                        Quantity = Convert.ToInt32(r["quantity"]),
                        Color = (String)r["color"],
                        Ram = (String)r["ram"],
                        Memory = (String)r["memory"],
                        Specid = (String)r["specID"],
                        Img = (String)r["img"],
                        Type = (String)r["type"],
                        Specid1 = (String)r["SpecID1"],
                        Cpu = (String)r["CPU"],
                        Gpu = (String)r["GPU"],
                        Os = (String)r["OS"],
                        Screen = (String)r["screen"],
                        Pin = (String)r["pin"],
                        Camera = (String)r["camera"],
                        Size = (String)r["size"],
                        Warrantly = Convert.ToInt32(r["warrantly"]),
                        Sound = (String)r["sound"],
                        Weight = (String)r["weight"],
                        Conectivitytechnologies = (String)r["conectivityTechnologies"],
                        Charge = (String)r["charge"],
                        Yearofdebut = Convert.ToInt32(r["yearOfDebut"]),
                        discountedPrice = Convert.ToInt32(r["discountedPrice"]),
                        per_cent = r["per_cent"] == null ? 0 : Convert.ToInt32(r["per_cent"]),
                    };
                    ret.ResultTable1.Add(z1);
                };
            }
            return ret;
        }
    }
}

