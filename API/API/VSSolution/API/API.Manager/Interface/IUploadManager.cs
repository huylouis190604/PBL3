using Microsoft.AspNetCore.Http;
using API.Model;
using API.Utility;
using System.Collections.Generic;

namespace API.Manager.Interface
{
    public interface IUploadManager
    {
        APIResponse UploadImages(List<IFormFile> images);
    }
}

