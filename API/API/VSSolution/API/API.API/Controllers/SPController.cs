using System;
using Microsoft.AspNetCore.Mvc;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using Microsoft.AspNetCore.Authorization;
using API.Manager.Interface;
using API.Model;
using API.Utility;
using log4net;


namespace API.API.Controllers
{
    [ApiController]
    public class SPController : ControllerBase
    {
        ILog log4Net;
        ISPManager Manager;
        ValidationResult ValidationResult;
        public SPController(ISPManager manager)
        {
            log4Net = this.Log<SPController>();
            Manager = manager;
            ValidationResult = new ValidationResult();
        }

        [HttpPost]
        [Route(APIEndpoint.DefaultRoute + "/Sp_Login")]
        public ActionResult Post_Sp_Login(Sp_LoginInputModel model)
        {
            try
            {
                return Ok(Manager.Sp_Login(model));
            }
            catch (Exception ex)
            {
                return StatusCode(500, new APIResponse(ResponseCode.ERROR, "Exception", ex.Message));
            }
        }
        [HttpPost]
        [Route(APIEndpoint.DefaultRoute + "/Sp_Reg")]
        public ActionResult Post_Sp_Reg(Sp_RegInputModel model)
        {
            try
            {
                return Ok(Manager.Sp_Reg(model));
            }
            catch (Exception ex)
            {
                return StatusCode(500, new APIResponse(ResponseCode.ERROR, "Exception", ex.Message));
            }
        }
        [HttpPost]
        [Route(APIEndpoint.DefaultRoute + "/Proc_ShopingCart")]
        public ActionResult Post_Sp_ShopingCart(Sp_ShopingCartInputModel model)
        {
            try
            {
                return Ok(Manager.Sp_ShopingCart(model));
            }
            catch (Exception ex)
            {
                return StatusCode(500, new APIResponse(ResponseCode.ERROR, "Exception", ex.Message));
            }
        }
        [HttpPost]
        [Route(APIEndpoint.DefaultRoute + "/Proc_Sanpham")]
        public ActionResult Post_Proc_Sanpham(Proc_SanphamInputModel model)
        {
            try
            {
                return Ok(Manager.Proc_Sanpham(model));
            }
            catch (Exception ex)
            {
                return StatusCode(500, new APIResponse(ResponseCode.ERROR, "Exception", ex.Message));
            }
        }
        [HttpPost]
        [Route(APIEndpoint.DefaultRoute + "/Proc_DetailSP")]
        public ActionResult Post_Proc_SanphamCT(Proc_SanphamCTInputModel model)
        {
            try
            {
                return Ok(Manager.Proc_SanphamCT(model));
            }
            catch (Exception ex)
            {
                return StatusCode(500, new APIResponse(ResponseCode.ERROR, "Exception", ex.Message));
            }
        }

    }
}


