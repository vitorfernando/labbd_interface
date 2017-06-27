/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {
    var count_genres = 1;
    var count_languages = 1;
    $('#count_genres').val("1");
    $('#count_languages').val("1");
    
    $.ajax({
        type: "POST", //Method
        url: "GetGenres", //Servlet
        dataType: "html", //Response Typ
        data: {tle: $('#tle').val()},
        success: function (data, textStatus, jqXHR) { //Response data
            $('#genresSelect1').html(data);
        }
    });

    $.ajax({
        type: "POST", //Method
        url: "GetLanguages", //Servlet
        dataType: "html", //Response Typ
        data: {tle: $('#tle').val()},
        success: function (data, textStatus, jqXHR) { //Response data
            $('#languagesSelect1').html(data);
        }
    });

    $('#addGenresButtom').click(function () {
        count_genres = count_genres + 1;
        var x = $('#count_genres');
        x.val(count_genres);
        
        $.ajax({
            type: "POST", //Method
            url: "AddGenres", //Servlet
            dataType: "html", //Response Type
            data: {count_genres: count_genres},
            success: function (data, textStatus, jqXHR) { //Response data
                $('#addGenresButtom').before(data);
                var select = '#genresSelect' + count_genres;

                $.ajax({
                    type: "POST", //Method
                    url: "GetGenres", //Servlet
                    dataType: "html", //Response Typ
                    data: {tle: $('#tle').val()},
                    success: function (data, textStatus, jqXHR) { //Response data
                        $(select).html(data);
                    }
                });

            }
        });
    });



    $('#addLanguagesButtom').click(function () {
        count_languages = count_languages + 1;
        var y = $('#count_languages');
        y.val(count_languages);
        
        $.ajax({
            type: "POST", //Method
            url: "AddLanguages", //Servlet
            dataType: "html", //Response Type
            data: {count_languages: count_languages},
            success: function (data, textStatus, jqXHR) { //Response data
                $('#addLanguagesButtom').before(data);
                var select_languages = '#languagesSelect' + count_languages;                

                $.ajax({
                    type: "POST", //Method
                    url: "GetLanguages", //Servlet
                    dataType: "html", //Response Typ
                    data: {tle: $('#tle').val()},
                    success: function (data, textStatus, jqXHR) { //Response data
                        $(select_languages).html(data);
                    }
                });
            }
        });
    });
});

