using Libri_application.App.Abstractions.Services;
using Libri_application.App.Factorys;
using Libri_application.App.Models.Dtos;
using Libri_application.App.Models.Requests;
using Libri_application.App.Models.Responses;
using Libri_application.Models.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Libri_application.App.Controllers
{
    [ApiController]
    [Route("api/v1/[controller]")]
    public class RecensioneController : ControllerBase
    {
        private readonly IRecensioneService _recensioneService;

        public RecensioneController(IRecensioneService recensioneService)
        {
            _recensioneService = recensioneService;
        }

        [HttpGet]
        [Route("GetRecensione/{idU:int}/{idL}")]
        public IActionResult GetRecensione(int idU, string idL)
        {
            var recensione = _recensioneService.GetRecensioneByLibro(idU, idL);
            var response = new RecensioneCompletaResonse();
            response.recensione = new RecensioneDto(recensione);
            response.libro = new LibroDto(recensione.libro);
            response.utente = new UtenteOutDto(recensione.utente);
            return Ok(ResponseFactory.WithSuccess(response));
        }

        [HttpPost]
        [Route("AddRecensione")]
        public async Task<IActionResult> AddRecensione(RecensioneRequest recensione)
        {
            await _recensioneService.AggiungiRecensione(recensione.isbn,recensione.ToRecensione());
            return Ok();
        }

        [HttpDelete]
        [Route("DeleteRecensione")]
        public IActionResult DeleteRecensione(RecensioneDelete recensione)
        {
            _recensioneService.EliminaRecensione(recensione.ToRecensione());
            return Ok();
        }

        [HttpGet]
        [Route("GetRecensioni/{idU:int}")]
        public List<RecensioneRidottaDto> GetRecensioni(int idU)
        {
            var recensioni =  _recensioneService.GetRecensioni(idU);

            return recensioni.Select(x => new RecensioneRidottaDto(x)).ToList();
        }

        [HttpPut]
        [Route("ModificaRecensione")]
        public IActionResult ModificaRecensione(ModificaRecensioneRequest recensione)
        {
            _recensioneService.ModificaRecensione(recensione.ToRecensione());
            return Ok();
        }

    }
}
