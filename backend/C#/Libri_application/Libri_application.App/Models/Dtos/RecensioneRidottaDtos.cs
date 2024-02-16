using Libri_application.LibriService.models;
using Libri_application.Models.Entities;

namespace Libri_application.App.Models.Dtos
{
    public class RecensioneRidottaDtos
    {

        public string idLibro { get; set; }
        public int idUtente { get; set; }
        public LibroRidotto libro { get; set; }
        public int voto { get; set; }

        public RecensioneRidottaDtos()
        {

        }

        public RecensioneRidottaDtos(Recensione recensione)
        {
            idLibro = recensione.idLibro;
            idUtente = recensione.idUtente;
            libro = recensione.libro;
            voto = recensione.voto;
        }

    }
}
