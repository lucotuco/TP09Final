// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
function MostrarMasInfo(IdJ)
{
    $.ajax(
        {
            url:'/Home/VerMasInfo',
            data:{ IdJugador: IdJ },
            type: 'GET',
            dataType: 'JSON',
            success:
                function(response)
                {
                    $("#ModalTitle").text(response.nombre);
                    //$("#ModalBody").html("Año de estreno: "+ response.añoInicio + "<br>" + response.sinopsis);
                }
        }
    );
}