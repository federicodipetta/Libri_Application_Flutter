using Libri_application.Models.Entities;

namespace Libri_application.App.Abstractions.Services
{
    public interface ILibroService
    {
        bool AggiungiLibro(string isbn);

        bool EliminaLibro(Libro libro);

        Libro GetLibro(string id);

        List<Libro> GetLibriByGenere(string genere);

        List<Libro> GetLibriByTitolo(string titolo);

    }
}
