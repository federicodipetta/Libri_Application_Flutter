using Libri_application.Models.Context;
using Libri_application.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Libri_application.Test.Example
{
    internal class dbExample
    {
        public void Run()
        {
            var ctx = new MyDbContext();
            Libro libro = new Libro();
            libro.id = "1";
            libro.autore = "autore";
            libro.titolo = "titolo";
            libro.editore = "editore";
            libro.dataPubblicazione = DateTime.Now;
            libro.descrizione = "descrizione";
            ctx.Set<Libro>().Add(libro);
            ctx.SaveChanges();
        }
    }
}
