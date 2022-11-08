using System.ComponentModel.Design;
using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP09.Models;

namespace TP09.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }

    public IActionResult Paises()
    {
        ViewBag.Pais = BD.ListarPaises();
        return View();
    }

    public Jugador PaginaJugadorAjax(int IdJugador)
    {
        Jugador MiJugador = BD.TraerJugador(IdJugador);
        return MiJugador;
    }
    public IActionResult PaginaAlbum(int idPais)
    {
        ViewBag.Jugadores = BD.JugadoresEquipo(idPais);
        ViewBag.Pais = BD.PaisSeleccionado(idPais);
        return View();
    }
    public IActionResult FigusPaquete()
    {
        ViewBag.Jugadores = BD.PaqueteFigus();
        return View("Paquete");
    }
    public IActionResult MisFigus(){
        ViewBag.TodosJugadores=BD.TodosJugadores();
        return View("MisFigus");
    }
    public IActionResult PegarFigus(int idJugador){
        BD.PegarFigus(idJugador);
        return View("Index");
    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
