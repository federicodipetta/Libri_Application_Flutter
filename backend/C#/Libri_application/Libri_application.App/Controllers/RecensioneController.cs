using Libri_application.App.Abstractions.Services;
using Libri_application.App.Models.Dtos;
using Libri_application.App.Models.Requests;
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
        [Route("GetRensione/{idU:int}/{idL}")]
        public Recensione GetRecensione(int idU, string idL)
        {
            return _recensioneService.GetRecensioneByLibro(idU, idL);
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
        public List<RecensioneRidottaDto> GetRecensioni(int idUtente)
        {
            var recensioni =  _recensioneService.GetRecensioni(idUtente);

            return recensioni.Select(x => new RecensioneRidottaDto(x)).ToList();
        }

        [HttpPut]
        [Route("ModificaRecensione")]
        public IActionResult ModificaRecensione(RecensioneRequest recensione)
        {
            _recensioneService.ModificaRecensione(recensione.ToRecensione());
            return Ok();
        }


        


    }
}
