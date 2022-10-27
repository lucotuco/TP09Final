using System;
namespace TP09.Models
{

    public class Estadio
    {

        private int _idEstadio;
        private string _Nombre;
        private int _Capacidad;
        private int _M2;
        private string _FotoEstadio;

        public Estadio() { }
        public Estadio(int _idEstadio, string _Nombre, int _Capacidad, int _M2, string _FotoEstadio)
        {
            _idEstadio = IdEstadio;
            _Nombre = Nombre;
            _M2 = M2;
            _Capacidad = Capacidad;
            _FotoEstadio = FotoEstadio;
        }

        public int IdEstadio
        {
            get { return _idEstadio; }
            set { _idEstadio = value; }
        }
        public string Nombre
        {
            get { return _Nombre; }
            set { _Nombre = value; }
        }
        public int Capacidad
        {
            get { return _Capacidad; }
            set { _Capacidad = value; }
        }
        public int M2
        {
            get { return _M2; }
            set { _M2 = value; }
        }
        public string FotoEstadio
        {
            get { return _FotoEstadio; }
            set { FotoEstadio = value; }
        }
    }
}