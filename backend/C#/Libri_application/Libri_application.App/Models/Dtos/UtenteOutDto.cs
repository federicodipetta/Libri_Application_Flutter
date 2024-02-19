using Libri_application.Models.Entities;

namespace Libri_application.App.Models.Dtos
{
    public class UtenteOutDto
    {
        public int id { get; set; }
        public string email { get; set; }
        public string login { get; set; }

        public UtenteOutDto(Utente u)
        {
            id = u.id;
            email = u.email;
            login = u.login;
        }
    }
}
