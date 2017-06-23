/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {
    
    $.ajax({
        type: "POST", //Method
        url: "GetGenres", //Servlet
        dataType: "html", //Response Typ
        data:{},
        success: function (data,textStatus, jqXHR) { //Response data
            $('#genresSelect').html();
        }
    });
});


