using Libri_application.Models.Entities;

namespace Libri_application.App.Abstractions.Services
{
    public interface ILibroService
    {
        bool AggiungiLibro(Libro libro);

        bool EliminaLibro(Libro libro);

        Libro GetLibro(int id);

        List<Libro> GetLibri();

        List<Libro> GetLibriByGenere(string genere);

        List<Libro> GetLibriByTitolo(string titolo);

    }
}
