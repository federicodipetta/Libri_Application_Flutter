using Libri_application.App.Abstractions.Services;
using Libri_application.App.Models.Dtos;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Libri_application.App.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AutenticazioneController : ControllerBase
    {
        private readonly IAutenticazioneService _service;
        public AutenticazioneController(IAutenticazioneService service)
        {
            _service = service;
        }
        [HttpPost("login")]
        public IActionResult Login([FromBody] UserDto user)
        {
            var token = _service.Login(user.Username, user.Password);
            if (token == null)
            {
                return Unauthorized();
            }
            return Ok(token);
        }
        [HttpPost("logout")]
        public IActionResult Logout([FromBody] UserDto user)
        {
            if (_service.Logout(user.Username))
            {
                return Ok();
            }
            return NotFound();
        }
        [HttpPost("register")]
        public IActionResult Register([FromBody] UserDto user)
        {
            var token = _service.Register(user.Username, user.Password, user.Mail);
            if (token == null)
            {
                return BadRequest();
            }
            return Ok(token);
        }   
    }
}
