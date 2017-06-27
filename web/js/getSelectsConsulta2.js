/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    $.ajax({
        type: "POST", //Method
        url: "GetDirectors", //Servlet
        dataType: "html", //Response Typ
        data: {tle: $('#tle').val()},
        success: function (data, textStatus, jqXHR) { //Response data
            $('#directorSelect').html(data);
        }

    });
    

    $.ajax({
        type: "POST", //Method
        url: "GetActors", //Servlet
        dataType: "html", //Response Typ
        data: {tle: $('#tle').val()},
        success: function (data, textStatus, jqXHR) { //Response data
            $('#actorSelect').html(data);
        }
    });
    return false;
});