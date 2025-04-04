﻿// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
function MostrarMasInfo(IdJ, IdPais, pegada)
{
    $.ajax(
        {
            
            url:'/Home/PaginaJugadorAjax',
            data:{ IdJugador: IdJ},
            type: 'GET',
            dataType: 'JSON',
            success:
                function(response)
                {
                    $("#ModalTitle").text(response.nombre);
                    $("#ModalBody").html("Nombre:"+ response.nombre + "<br>" +"Apellido: "+ response.apellido + "<br>"+ "Año de nacimiento: "+ response.fechaNacimiento.substr(0,10) +"<br>" +"Numero de camiseta: "+ response.numeroCamiseta +"<br>"+"Posicion: "+ response.posicionDeJuego+"<br>"+"Seleccion: ");
                    if (pegada!='True')
                    {
                        $("#BotonPegar").attr("href", "/Home/PegarFigus?IdJugador="+IdJ);
                    }
                    else
                    {
                        $("#BotonPegar").html("Ya Pegada");
                        $("#BotonPegar").attr("href", "#");
                    }

                    ActualizarConPais(IdPais)
                }
        }
    );
}
function ActualizarConPais(IdPais){
    
    $.ajax(
        {
            url:'/Home/DevolverPais',
            data:{ IdPais: IdPais},
            type: 'GET',
            dataType: 'JSON',
            success:
                function(response)
                {
                    document.getElementById("ModalBody").innerHTML += response.nombre
                }
        }
    );
}