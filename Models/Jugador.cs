using System;
namespace TP09.Models
{

    public class Jugador
    {

        private int _idJugador;
        private int _IdPais;
        private string _Nombre;
        private string _Apellido;
        private int _NumeroCamiseta;

        private DateTime _FechaNacimiento;

        private string _PosicionDeJuego;

        private bool _Repetida;

        private string _ImagenJugador;

        public Jugador() { }
        public Jugador(int _idJugador, int _IdPais, string _Nombre, string _Apellido, int _NumeroCamiseta, DateTime _FechaNacimiento, string _PosicionDeJuego, bool _Repetida, string _ImagenJugador)
        {
            _idJugador = IdJugador;
            _IdPais = IdPais;
            _Nombre = Nombre;
            _Apellido = Apellido;
            _NumeroCamiseta = NumeroCamiseta;
            _FechaNacimiento = FechaNacimiento;
            _PosicionDeJuego = PosicionDeJuego;
            _Repetida = Repetida;
            _ImagenJugador = ImagenJugador;
        }

        public int IdJugador
        {
            get { return _idJugador; }
            set { IdJugador = value; }
        }
        public int IdPais
        {
            get { return _IdPais; }
            set { IdPais = value; }
        }
        public string Nombre
        {
            get { return _Nombre; }
            set { Nombre = value; }
        }
        public string Apellido
        {
            get { return _Apellido; }
            set { Apellido = value; }
        }
        public int NumeroCamiseta
        {
            get { return _NumeroCamiseta; }
            set { NumeroCamiseta = value; }
        }
        public DateTime FechaNacimiento
        {
            get { return _FechaNacimiento; }
            set { FechaNacimiento = value; }
        }
        public string PosicionDeJuego
        {
            get { return _PosicionDeJuego; }
            set { PosicionDeJuego = value; }
        }
        public bool Repetida
        {
            get { return _Repetida; }
            set { Repetida = value; }
        }
        public string ImagenJugador
        {
            get { return _ImagenJugador; }
            set { ImagenJugador = value; }
        }
    }
}