using Libri_application.Models.Entities;

namespace Libri_application.App.Abstractions.Services
{
    public interface IRecensioneService
    {
        Task<List<Recensione>> GetRecensioni(int idUtente);
        Task<Recensione> GetRecensioneByLibro(int idUtente,string idLibro);
        Task<bool> AggiungiRecensione(Recensione recensione);
        Task<bool> EliminaRecensione(Recensione recensione);
        Task<bool> ModificaRecensione(Recensione recensione);

    }
}
