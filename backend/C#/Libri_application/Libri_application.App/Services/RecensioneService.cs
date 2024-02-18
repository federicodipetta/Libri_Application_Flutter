using Libri_application.App.Abstractions.Services;
using Libri_application.LibriService;
using Libri_application.Models.Entities;
using Libri_application.Models.Repository;

namespace Libri_application.App.Services
{
    public class RecensioneService : IRecensioneService
    {
        private readonly RecensioneRepository _repoR;
        private readonly LibroRepository _repoL;
        private readonly UtenteRepository _repoU;
        public RecensioneService(RecensioneRepository repoR, LibroRepository repoL, UtenteRepository repoU
           )
        {
            _repoL = repoL;
            _repoR = repoR;
            _repoU = repoU;
        }

        public async Task<bool>  AggiungiRecensione(string isbn, Recensione recensione)
        {
            if(_repoL.GetLibroByIsbn(isbn) == null)
            {
                var libriService = new LibriService.LibriService();
                Libro Libro = await libriService.GetLibro(isbn);
                _repoL.Add(Libro);
            }
            var libro = _repoL.GetLibroByIsbn(isbn);
            recensione.idLibro = libro.id;
            recensione.libro = libro;
            _repoR.Add(recensione);
            return true;
        }

        public bool EliminaRecensione(Recensione recensione)
        {
            _repoR.Delete(recensione);
            return true;
        }

        public Recensione GetRecensioneByLibro(int idUtente, string idLibro)
        {
            return _repoR.GetRecensioneByUtenteByLibro(idUtente,idLibro);
        }

        public List<Recensione> GetRecensioni(int idUtente)
        {
            return _repoR.GetRecensioneByUtente(idUtente).ToList();
        }

        public bool ModificaRecensione(Recensione recensione)
        {
            recensione.libro = _repoL.Get(recensione.idLibro);
            recensione.utente = _repoU.Get(recensione.idUtente);
            _repoR.Update(recensione);
            return true;
        }
    }
}
