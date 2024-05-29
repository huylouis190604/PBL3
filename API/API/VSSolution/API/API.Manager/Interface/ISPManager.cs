using API.Model;
using API.Utility;
using System;
using System.Collections.Generic;
using System.Text;

namespace API.Manager.Interface
{
    public interface ISPManager
    {
       public APIResponse Sp_Login(Sp_LoginInputModel input);
public APIResponse Sp_Reg(Sp_RegInputModel input);
public APIResponse Sp_ShopingCart(Sp_ShopingCartInputModel input);
        public APIResponse Proc_Sanpham(Proc_SanphamInputModel input);
public APIResponse Proc_SanphamCT(Proc_SanphamCTInputModel input);
    }
}

