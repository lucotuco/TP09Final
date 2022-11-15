using System.ComponentModel.Design;
using System.IO.Compression;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using System.IO;
using TP09.Models;

namespace TP09.Controllers;

public class HomeController : Controller
{
    private IWebHostEnvironment Enviroment;
    private readonly ILogger<HomeController> _logger;

    public HomeController(IWebHostEnvironment enviroment){
        Enviroment=enviroment;
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
        Pais MiPais = BD.PaisSeleccionado(MiJugador.IdPais);
        return MiJugador;
    }
    public Pais DevolverPais(int IdPais){
        Pais pais = BD.PaisSeleccionado(IdPais);
        return pais;
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
        foreach (var item in ViewBag.Jugadores)
        {
            BD.FigusRepetidas(item.IdJugador);
        }
        return View("Paquete");
    }
    public IActionResult MisFigus()
    {
        ViewBag.TodosJugadores = BD.TodosJugadores();
        return View("MisFigus");
    }
    public IActionResult PegarFigus(int idJugador)
    {
        BD.PegarFigus(idJugador);
        return View("Index");
    }

    public IActionResult CrearJugador(){

        return View();
    }
    public IActionResult AgregarJugador(int IdEquipo)
    {
        ViewBag.IdEquipo = IdEquipo;
        return View();
    }
    [HttpPost]
    public ActionResult GuardarJugador(Jugador Jug, IFormFile ImagenJugador)
    {
        if (ImagenJugador.Length > 0)
        {
            string wwwRootLocal = this.Enviroment.ContentRootPath + @"\wwwroot\Img\" + ImagenJugador.FileName;
            using (var stream = System.IO.File.Create(wwwRootLocal))
            {
                ImagenJugador.CopyTo(stream);
                Jug.ImagenJugador = ImagenJugador.FileName;
            }
        }
        BD.AgregarJugador(Jug);


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
