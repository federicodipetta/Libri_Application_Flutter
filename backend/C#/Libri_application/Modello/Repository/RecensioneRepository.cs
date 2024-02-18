using Libri_application.Models.Context;
using Libri_application.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Libri_application.Models.Repository
{
    public class RecensioneRepository : GenericRepository<Recensione>
    {
        public RecensioneRepository(MyDbContext ctx) : base(ctx)
        {

        }


        public List<Recensione> GetRecensioneByUtente(int idUtente)
        {
            return _ctx.Set<Recensione>().Where(x => x.idUtente == idUtente).ToList();
        }

        public Recensione GetRecensioneByUtenteByLibro(int idUtente, string idLibro)
        {
            return _ctx.Set<Recensione>().Where(x => x.idUtente == idUtente && x.idLibro == idLibro).FirstOrDefault();
        }

    }

}