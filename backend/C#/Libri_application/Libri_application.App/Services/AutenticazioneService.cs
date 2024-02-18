using Libri_application.App.Abstractions.Services;
using Libri_application.Models.Repository;
using System.Security.Cryptography;

namespace Libri_application.App.Services
{

    public class AutenticazioneService : IAutenticazioneService
    {
        private readonly UtenteRepository _repoU ;

        public AutenticazioneService(UtenteRepository repository)
        {
            _repoU = repository;
        }
        public string Login(string username, string password)
        {
            return "";
        }

        public bool Logout(string username)
        {
            throw new NotImplementedException();
        }

        public string Register(string username, string password)
        {
            var hash = new HMACSHA512();
        }
    }
}
