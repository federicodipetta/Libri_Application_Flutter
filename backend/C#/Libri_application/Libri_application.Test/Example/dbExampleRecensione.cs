﻿using Libri_application.Models.Context;
using Libri_application.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Libri_application.Test.Example
{
    public class dbExampleRecensione
    {
        public void Run()
        {
            var ctx = new MyDbContext();
            var libro = ctx.Libro.First();
            var utente = ctx.Utente.First();
            var recensione = new Recensione();
            recensione.libro = libro;
            recensione.utente = utente;
            recensione.recensione = "recensione";
            ctx.Set<Recensione>().Add(recensione);
            ctx.SaveChanges();
        }
    }
}
