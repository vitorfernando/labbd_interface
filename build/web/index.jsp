<%-- 
    Document   : index
    Created on : 21/06/2017, 04:18:29
    Author     : vitor
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Imdb</title>
        <script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script>
            $(document).ready(function () {
                var count_genres = 1;
                var count_languages = 1;
                
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
                    dataType: "html", //Response Type
                    data: {tle: $('#tle').val()},
                    success: function (data, textStatus, jqXHR) { //Response data
                        $('#languagesSelect1').html(data);
                    }
                });

                $('#addGenresButtom').click(function () {
                    count_genres = count_genres + 1;
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
                
                

                $('#consulta1buttom').click(function () {
                    alert("oi");
                });

                $('#consulta2buttom').click(function () {
                    alert("oi");
                });
            });
        </script>
    </head>
    <body>
        <header>
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <a class="navbar-brand" href="index.html">Home</a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li class="active" id="consulta1buttom"><a href="#">Consulta1<span class="sr-only">(current)</span></a></li>
                            <li class="active"><a href="#">Consulta2<span class="sr-only">(current)</span></a></li>                           
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
        </header>
        <div class="form-inline" id="consulta1">
            <h3>Consulta 1</h3>
            <label for="tle">Title:</label>
            <input type="text" class="form-control" id="tle" name="tle">

            <label class="mr-sm-2" for="genresSelect1">Gênero</label>
            <select class="form-control" id="genresSelect1" name="genresSelect1">
            </select>

            <button type="button" class="btn btn-secondary btn-sm" id="addGenresButtom">+</button>

            <label class="mr-sm-2" for="languagesSelect1">Languages</label>
            <select class="form-control" id="languagesSelect1">               
            </select>
            <button type="button" class="btn btn-secondary btn-sm" id="addLanguagesButtom">+</button>

            <button type="submit" class="btn btn-primary">Submit</button>
        </div>

        <div class="form-inline" id="consulta1">
            <h3>Consulta 2</h3>
            <label for="tle">Title:</label>
            <input type="text" class="form-control" id="tle" name="tle">
            <label class="mr-sm-2" for="genresSelect">Gênero</label>

            <select class="form-control" id="genresSelect" name="genresSelect">
            </select>

            <label class="mr-sm-2" for="languagesSelect">Languages</label>
            <select class="form-control" id="languagesSelect">               
            </select>

            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
    </body>
</html>

