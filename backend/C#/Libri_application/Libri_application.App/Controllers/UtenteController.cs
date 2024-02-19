using Libri_application.App.Abstractions.Services;
using Libri_application.Models.Entities;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace Libri_application.App.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    public class UtenteController : ControllerBase
    {
        private readonly IUtenteService _service;
        public UtenteController(IUtenteService service)
        {
            _service = service;
        }
        [HttpGet]
        public Utente GetUtente()
        {
            var identity = this.User.Identity as ClaimsIdentity;
            var id = identity.Claims.Where(c => "Id" == c.Type).FirstOrDefault().Value;
            return _service.GetUtente(id);
        }
    }
}
