﻿using Libri_application.Models.Context;
using Libri_application.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Libri_application.Test.Example
{
    internal class DbExampleUtente
    {
        public DbExampleUtente() { }

        public void Run()
        {
            var ctx = new MyDbContext();
            Utente utente = new Utente();
            utente.id = 1;
            utente.nome = "nome";
            utente.email = "email";
            utente.password = "password";
            utente.secretRiga = "secret";
            ctx.Set<Utente>().Add(utente);
            ctx.SaveChanges();
        }

    }
}
