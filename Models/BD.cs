using System;
using System.Data.SqlClient;
using Dapper;
using System.Linq;
using System.Collections.Generic;
namespace TP09.Models{

    public static class BD{
    private static string _connectionString =@"Server=A-PHZ2-CIDI-052; DataBase=TP09 ; Trusted_Connection=True";
    private static List<Pais> _ListaPais= new List<Pais>();
    private static List<Estadio> _ListaEstadio= new List<Estadio>();
    private static List<Jugador> _JugadorePais= new List<Jugador>();

    public static List<Pais> ListarPaises(){

        using (SqlConnection db =new SqlConnection(_connectionString)){
        string SQL="Select* From Pais";
            _ListaPais=db.Query<Pais>(SQL).ToList();
        }
        return _ListaPais;
    }
    public static List<Estadio> ListarEstadios(){

        using (SqlConnection db =new SqlConnection(_connectionString)){
        string SQL="Select* From Estadios";
            _ListaEstadio=db.Query<Estadio>(SQL).ToList();
        }
        return _ListaEstadio;
    }

    public static List<Jugador> JugadoresEquipo(int idPais){
        using (SqlConnection db =new SqlConnection(_connectionString)){
        string SQL="Select* From Jugadores where idPais = @id";
            _JugadorePais=db.Query<Jugador>(SQL, new {id = idPais}).ToList();
        }
        return _JugadorePais;
    } 
        public static Pais PaisSeleccionado(int idPais){
            Pais paisSeleccionado;
        using (SqlConnection db =new SqlConnection(_connectionString)){
        string SQL="Select* From Pais where idPais = @id";
            paisSeleccionado=db.QueryFirstOrDefault<Pais>(SQL, new {id = idPais});
        }
        return paisSeleccionado ;
    } 
    }
}
