using Libri_application.App.Abstractions.Services;
using Libri_application.App.Services;
using Libri_application.LibriService.models;
using Libri_application.Models.Context;
using Libri_application.Models.Repository;
using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Models;

namespace Libri_application.App
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            builder.Services.AddDbContext<MyDbContext>(options =>
            {
                options.UseSqlServer(builder.Configuration.GetConnectionString("MyDbContext"));
            });
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo
                {
                    Title = "LibriApplication",
                    Version = "v1"
                });
            });
            builder.Services.AddControllers();
            //adding services
            builder.Services.AddScoped<ILibroService, Services.LibroService>();
            builder.Services.AddScoped<IRecensioneService, RecensioneService>();
           // builder.Services.AddScoped<IUtenteService, UtenteService>();
           //repository
            builder.Services.AddScoped<LibroRepository>();
            builder.Services.AddScoped<RecensioneRepository>();
            builder.Services.AddScoped<UtenteRepository>();

            // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
           // builder.Services.AddEndpointsApiExplorer();
            //builder.Services.AddSwaggerGen();

            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
            }

            app.UseAuthorization();


            app.MapControllers();

            app.Run();
        }
    }
}
