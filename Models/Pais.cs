using System;
namespace TP09.Models{

    public class Pais{

        private int _IdPais;
        private string _Nombre;
        private string _Abreviacion;
        private string _Bandera;

        public Pais() { }
        public Pais(int _IdPais, string _Nombre, string _Abreviacion,string _Bandera){ 
            _IdPais=idPais;
            _Nombre=nombre;
            _Abreviacion=abreviacion;
            _Bandera=bandera;
        }
        public int idPais
        {
            get { return _IdPais; }
            set { _IdPais = value; }
        }

        public string nombre
        {
            get { return _Nombre; }
            set { _Nombre = value; }
        }
        public string abreviacion
        {
            get { return _Abreviacion; }
            set { _Abreviacion = value; }
        }
        public string bandera
        {
            get { return _Bandera; }
            set { _Bandera = value; }
        }
    }
}