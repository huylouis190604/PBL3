using API.Model;
using System;
using System.Collections.Generic;

namespace API.DataAccess.Interface
{
    public interface IStoredProcedureDataAccess
    {
       public Sp_LoginOutputModel Sp_Login(Sp_LoginInputModel input);
public bool Sp_Reg(Sp_RegInputModel input);
public bool Sp_ShopingCart(Sp_ShopingCartInputModel input);
        public Proc_SanphamOutputModel Proc_Sanpham(Proc_SanphamInputModel input);
public Proc_SanphamCTOutputModel Proc_SanphamCT(Proc_SanphamCTInputModel input);
    }
}

