﻿namespace Libri_application.App.Abstractions.Services
{
    public interface IAutenticazioneService
    {
        public string Login(string username, string password);

        public bool Logout(string username);

        public string Register(string username, string password,string mail);
    }
}
