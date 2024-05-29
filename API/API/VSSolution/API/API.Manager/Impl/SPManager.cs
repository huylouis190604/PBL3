using API.DataAccess.Interface;
using API.Manager.Interface;
using API.Model;
using API.Utility;
using System;
using System.Collections.Generic;
using System.Text;

namespace API.Manager.Impl
{
    public class SPManager : ISPManager
    {
        private readonly IStoredProcedureDataAccess DataAccess = null;
        public SPManager(IStoredProcedureDataAccess dataAccess)
        {
            DataAccess = dataAccess;
        }
        public APIResponse Sp_Login(Sp_LoginInputModel input)
    {
    var result = DataAccess.Sp_Login(input);
if (result != null)
    {
        return new APIResponse(ResponseCode.SUCCESS, "SP Executed Successfully", result);
   }
    else
    {
        return new APIResponse(ResponseCode.ERROR, "Error in Executing SP");
    }
}
public APIResponse Sp_Reg(Sp_RegInputModel input)
    {
    var result = DataAccess.Sp_Reg(input);
if (result)
    {
        return new APIResponse(ResponseCode.SUCCESS, "SP Executed Successfully", result);
   }
    else
    {
        return new APIResponse(ResponseCode.ERROR, "Error in Executing SP");
    }
}
        public APIResponse Sp_ShopingCart(Sp_ShopingCartInputModel input)
        {
            var result = DataAccess.Sp_ShopingCart(input);
            if (result)
            {
                return new APIResponse(ResponseCode.SUCCESS, "SP Executed Successfully", result);
            }
            else
            {
                return new APIResponse(ResponseCode.ERROR, "Error in Executing SP");
            }
        }
        public APIResponse Proc_Sanpham(Proc_SanphamInputModel input)
    {
    var result = DataAccess.Proc_Sanpham(input);
if (result != null)
    {
        return new APIResponse(ResponseCode.SUCCESS, "SP Executed Successfully", result);
   }
    else
    {
        return new APIResponse(ResponseCode.ERROR, "Error in Executing SP");
    }
}

        public APIResponse Proc_SanphamCT(Proc_SanphamCTInputModel input)
        {
            var result = DataAccess.Proc_SanphamCT(input);
            if (result != null)
            {
                return new APIResponse(ResponseCode.SUCCESS, "SP Executed Successfully", result);
            }
            else
            {
                return new APIResponse(ResponseCode.ERROR, "Error in Executing SP");
            }
        }

    }
}

