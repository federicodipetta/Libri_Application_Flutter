using Libri_application.Models.Entities;

namespace Libri_application.App.Abstractions.Services
{
    public interface ILibroService
    {
        bool AggiungiLibro(string isbn); //prima lo cerca nel database

        bool EliminaLibro(Libro libro);
        bool EliminaLibro(string id);

        Libro GetLibro(string id);

        List<Libro> GetLibri(); //ricerca nel database

        List<Libro> GetLibriByGenere(string genere);

        List<Libro> GetLibriByTitolo(string titolo);
        //sia ricerca da database che ricerca da web

    }
}
