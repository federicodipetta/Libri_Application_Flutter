using Libri_application.Models.Context;
using Libri_application.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Libri_application.Models.Repository
{
    public class LibroRepository : GenericRepository<Libro>
    {
        public LibroRepository(MyDbContext ctx) : base(ctx)
        {
        }


        public Libro GetLibroByIsbn(string isbn)
        {
            return _ctx.Libro.First(l => l.isbn == isbn);
        }
    }
    
}
