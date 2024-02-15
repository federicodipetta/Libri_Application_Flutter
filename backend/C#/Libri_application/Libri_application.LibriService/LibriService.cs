using Libri_application.LibriService.models.LibroDettagliato;
using Libri_application.Models.Entities;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.Threading.Tasks;
using static System.Net.WebRequestMethods;

namespace Libri_application.LibriService
{
    public class LibriService
    {
        string urlISBN = "https://www.googleapis.com/books/v1/volumes?q=isbn:";
        string urlId = "https://www.googleapis.com/books/v1/volumes/";
        public LibriService()
        {
        }
        public async Task<Libro> GetLibro(string isbn)
        {
            HttpClient client = new HttpClient();
            HttpResponseMessage response = await client.GetAsync(urlISBN + isbn);
            HttpContent content = response.Content;       
            string data = await content.ReadAsStringAsync();
            var libro = JsonSerializer.Deserialize<models.LibroService>(data);

            HttpResponseMessage httpResponseMessage = await client.GetAsync(urlId + libro.items[0].id);
            HttpContent httpContent = httpResponseMessage.Content;
            string data2 = await httpContent.ReadAsStringAsync();
            var libro2 = JsonSerializer.Deserialize<LibroDettagliato>(data2);
            var l = new Libro();
            l.id = libro2.id;
            l.autore = libro2.volumeInfo.authors[0];
            l.titolo = libro2.volumeInfo.title;
            l.editore = libro2.volumeInfo.publisher;
            l.dataPubblicazione = DateTime.Now;//TODO rimuovere
            l.descrizione = libro2.volumeInfo.description;

            return l;
                    
                
               
            
        }

    }
}
