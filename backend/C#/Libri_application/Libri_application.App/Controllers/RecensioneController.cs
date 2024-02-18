using Libri_application.App.Abstractions.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Libri_application.App.Controllers
{
    [Route("api/v0/[controller]")]
    [ApiController]
    public class RecensioneController : ControllerBase
    {
        private readonly IRecensioneService _recensioneService;




    }
}
