using Libri_application.App.Abstractions.Services;
using Libri_application.Models.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Libri_application.App.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class LibroController : ControllerBase
    {
        private readonly ILibroService _libroService;

        public LibroController(ILibroService libroService)
        {
            _libroService = libroService;
        }

        [HttpGet]
        [Route("GetLibro/{id}")]
        public Libro GetLibro(string id)
        {
            return _libroService.GetLibro(id);
        }
        [HttpPost]
        [Route("AddLibro")]
        public async Task<IActionResult> AddLibro(string isbn)
        {
            await _libroService.AggiungiLibro(isbn);
            return Ok();
        }
        [HttpDelete]
        [Route("DeleteLibro/{id}")]
        public IActionResult DeleteLibro(string id)
        {
            _libroService.EliminaLibro(id);
            return Ok();
        }
        [HttpPut]
        [Route("ModificaLibro/{id}")]
        public IActionResult ModificaLibro(Libro libro, string id)
        {
            _libroService.EliminaLibro(id);
            _libroService.AggiungiLibro(libro.id);
            return Ok();
        }

    }
}
