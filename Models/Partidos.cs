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
            set { idPartidos = value; }
        }
        public int IdEstadio
        {
            get { return _IdEstadio; }
            set { IdEstadio = value; }
        }
        public int IdPais1
        {
            get { return _IdPais1; }
            set { IdPais1 = value; }
        }
        public DateTime FechaJugar
        {
            get { return _FechaJugar; }
            set { FechaJugar = value; }
        }
       public int IdPais2
        {
            get { return _IdPais2; }
            set { IdPais2 = value; }
        }
       
    }
}