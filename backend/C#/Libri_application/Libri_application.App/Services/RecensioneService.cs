using Libri_application.App.Abstractions.Services;
using Libri_application.Models.Entities;
using Libri_application.Models.Repository;

namespace Libri_application.App.Services
{
    public class RecensioneService : IRecensioneService
    {
        private readonly RecensioneRepository _repoR;
        private readonly LibroRepository _repoL;
        private readonly UtenteRepository _repoU;
        public RecensioneService(RecensioneRepository repoR, LibroRepository repoL, UtenteRepository repoU)
        {
            _repoL = repoL;
            _repoR = repoR;
            _repoU = repoU;
        }

        public Task<bool> AggiungiRecensione(Recensione recensione)
        {
            throw new NotImplementedException();
        }

        public Task<bool> EliminaRecensione(Recensione recensione)
        {
            throw new NotImplementedException();
        }

        public Task<Recensione> GetRecensioneByLibro(int idUtente, string idLibro)
        {
            throw new NotImplementedException();
        }

        public Task<List<Recensione>> GetRecensioni(int idUtente)
        {
            throw new NotImplementedException();
        }

        public Task<bool> ModificaRecensione(Recensione recensione)
        {
            throw new NotImplementedException();
        }
    }
}
