using Libri_application.Models.Entities;

namespace Libri_application.App.Models.Requests
{
    public class RecensioneDelete
    {
        public int idUtente { get; set; }
        public string idLibro { get; set; }

        public RecensioneDelete() { }

        public Recensione ToRecensione()
        {
            Recensione recensione = new Recensione();
            recensione.idUtente = idUtente;
            recensione.idLibro = idLibro;
            return recensione;
        }
    }
}
