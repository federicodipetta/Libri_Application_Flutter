using Libri_application.Models.Entities;

namespace Libri_application.App.Models.Requests
{
    public class RecensioneRequest
    {
        public int IdUtente { get; set; }
        public string isbn { get; set; }
        public string Testo { get; set; }
        public int Voto { get; set; }

        public StatoRecensione Stato { get; set; }

        public string periodo { get; set; }

        public RecensioneRequest() { }  

        public Recensione ToRecensione()
        {
            Recensione recensione = new Recensione();
            recensione.idUtente= IdUtente;
            recensione.idLibro = String.Empty;
            recensione.recensione= Testo;
            recensione.voto = Voto;
            recensione.stato = Stato;
            recensione.periodo = periodo;
            return recensione;
        }
    }
}
