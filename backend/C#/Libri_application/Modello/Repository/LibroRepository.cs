using Libri_application.Models.Context;
using Libri_application.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace Libri_application.Models.Repository
{
    public class LibroRepository : GenericRepository<Libro>
    {
        public LibroRepository(MyDbContext ctx) : base(ctx)
        {

        }
        public bool Contains(string isbn)
        {
            return _ctx.Set<Libro>().Any(c => c.isbn == isbn);
        }
        public List<Libro> GetLibriByGenere(string genere)
        {
            throw new NotImplementedException();
        }
        public List<Libro> GetLibriByAutore(string autori)
        {
            return _ctx.Set<Libro>().Where(x => x.autori == autori).ToList();
        }
        public List<Libro> GetLibriByTitolo(string titolo)
        {
            return _ctx.Set<Libro>().Where(x => x.titolo == titolo).ToList();
        }
    }
    
}
