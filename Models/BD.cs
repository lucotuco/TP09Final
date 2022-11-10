using System;
using System.Data.SqlClient;
using Dapper;
using System.Linq;
using System.Collections.Generic;
namespace TP09.Models
{

    public static class BD
    {
        private static string _connectionString = @"Server=A-PHZ2-CIDI-048; DataBase=TP09; Trusted_Connection=True";
        private static List<Pais> _ListaPais = new List<Pais>();
        private static List<Estadio> _ListaEstadio = new List<Estadio>();
        private static List<Jugador> _JugadorePais = new List<Jugador>();
        private static List<Jugador> _JugadoresPaquete = new List<Jugador>();
        private static List<Jugador> _Jugadores = new List<Jugador>();



        public static List<Pais> ListarPaises()
        {

            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string SQL = "SELECT * FROM Pais";
                _ListaPais = db.Query<Pais>(SQL).ToList();
            }
            return _ListaPais;
        }
        public static List<Estadio> ListarEstadios()
        {

            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string SQL = "Select * From Estadios";
                _ListaEstadio = db.Query<Estadio>(SQL).ToList();
            }
            return _ListaEstadio;
        }

        public static List<Jugador> JugadoresEquipo(int idPais)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string SQL = "Select * From Jugador where idPais = @id ";
                _JugadorePais = db.Query<Jugador>(SQL, new { id = idPais }).ToList();
            }
            return _JugadorePais;
        }

        public static Jugador TraerJugador(int idJugador)
        {
            Jugador jugadorSeleccionado = null;
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string SQL = "Select * From Jugador where idjugador = @id";
                jugadorSeleccionado = db.QueryFirstOrDefault<Jugador>(SQL, new { id = idJugador });
            }
            return jugadorSeleccionado;
        }

        public static Pais PaisSeleccionado(int idPais)
        {
            Pais paisSeleccionado;
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string SQL = "Select* From Pais where idPais = @id";
                paisSeleccionado = db.QueryFirstOrDefault<Pais>(SQL, new { id = idPais });
            }
            return paisSeleccionado;
        }

        public static List<Jugador> PaqueteFigus()
        {

            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string SQL = "SELECT TOP 5 * FROM Jugador ORDER BY NewID()";
                _JugadoresPaquete = db.Query<Jugador>(SQL).ToList();
            }
            return _JugadoresPaquete;
        }

        public static List<Jugador> TodosJugadores()
        {

            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string SQL = "Select * From Jugador where Repetida=1";
                _Jugadores = db.Query<Jugador>(SQL).ToList();
            }
            return _Jugadores;
        }

        public static void PegarFigus(int idJugador)
        {
            string SQL = "UPDATE Jugador SET Pegadas=1 WHERE idJugador=@pIdjugador";
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                db.Execute(SQL, new { pIdJugador = idJugador });
            }
        }
        public static void FigusRepetidas(int idJugador)
        {
            string SQL = "UPDATE Jugador SET Repetida=1 WHERE idJugador=@pIdjugador";
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                db.Execute(SQL, new { pIdJugador = idJugador });
            }
        }
        public static void AgregarJugador(Jugador Jug)
        {
            string SQL = "INSERT INTO Jugadores (IdPais,Nombre,Apellido,NumeroCamiseta,FechaNacimiento,PosicionDeJuego,ImagenJugador) VALUES(@pidPais,@pNombre,@pApellido,@pNumeroCamiseta,@pFechaNacimiento,@pPosicionDeJuego,1,@pImagenJugadro,0)";
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                db.Execute(SQL, new { pidPais = Jug.IdPais, pNombre = Jug.Nombre,pApellido = Jug.Apellido,pNumeroCamiseta=Jug.NumeroCamiseta, pFechaNacimiento = Jug.FechaNacimiento, pPosicionDeJuego = Jug.PosicionDeJuego,pImagenJugador=Jug.ImagenJugador });
            }
        }
    }
}
