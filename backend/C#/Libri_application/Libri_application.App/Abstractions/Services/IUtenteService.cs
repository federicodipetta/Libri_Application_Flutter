using Libri_application.Models.Entities;

namespace Libri_application.App.Abstractions.Services
{
    public interface IUtenteService
    {
        bool AggiungiUtente(Utente utente);

        bool EliminaUtente(Utente utente);

        Utente GetUtente(int id);

        Utente GetByLogin(string login);

        Utente GetByEmail(string email);
    }
}
