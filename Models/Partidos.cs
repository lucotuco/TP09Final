using System;
namespace TP09.Models
{

    public class Partidos
    {

        private int _idPartidos;
        private int _IdEstadio;

        private int _IdPais1;
        private DateTime _FechaJugar;
        private int _IdPais2;
        
        public Partidos() { }
        public Partidos(int _idPartidos, int _IdEstadio, int _IdPais1, DateTime _FechaJugar, int _IdPais2)
        {
            _idPartidos = idPartidos;
            _IdEstadio = IdEstadio;
            _IdPais1 = IdPais1;
            _FechaJugar = FechaJugar;
            _IdPais2 = IdPais2;
        }

        public int idPartidos
        {
            get { return _idPartidos; }
            set { _idPartidos = value; }
        }
        public int IdEstadio
        {
            get { return _IdEstadio; }
            set { _IdEstadio = value; }
        }
        public int IdPais1
        {
            get { return _IdPais1; }
            set { _IdPais1 = value; }
        }
        public DateTime FechaJugar
        {
            get { return _FechaJugar; }
            set { _FechaJugar = value; }
        }
       public int IdPais2
        {
            get { return _IdPais2; }
            set { _IdPais2 = value; }
        }
       
    }
}