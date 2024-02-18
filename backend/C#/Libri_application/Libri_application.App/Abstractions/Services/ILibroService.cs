using Libri_application.LibriService.models;
using Libri_application.Models.Entities;

namespace Libri_application.App.Abstractions.Services
{
    public interface ILibroService
    {
        Task<bool> AggiungiLibro(string isbn);
        bool EliminaLibro(Libro libro);
        bool EliminaLibro(string id);
        Libro GetLibro(string id);
        List<Libro> GetLibri();
        List<Libro> GetLibriByGenere(string genere);
        List<LibroRidotto> GetLibriByTitolo(string titolo);

    }
}
