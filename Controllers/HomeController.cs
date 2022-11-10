﻿using System.ComponentModel.Design;
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

    public IActionResult AgregarJugador(int IdEquipo)
    {
        ViewBag.IdEquipo = IdEquipo;
        return View();
    }
    [HttpPost]
    public ActionResult GuardarJugador(Jugador Jugador, IFormFile Foto)
    {
        if (Foto.Length > 0)
        {
            string wwwRootLocal = this.Enviroment.ContentRootPath + @"\wwwroot\Img\" + Foto.FileName;
            using (var stream = System.IO.File.Create(wwwRootLocal))
            {
                Foto.CopyTo(stream);
                Jugador.ImagenJugador = Foto.FileName;
            }
        }
        BD.AgregarJugador(Jugador);


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
