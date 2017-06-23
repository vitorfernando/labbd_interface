<%-- 
    Document   : index
    Created on : 21/06/2017, 04:18:29
    Author     : vitor
--%>

<%@page import="java.util.List"%>
<%@page import="Model.Genre"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Imdb</title>
        <script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script>
            $(document).ready(function () {
                $.ajax({
                    type: "POST", //Method
                    url: "GetGenres", //Servlet
                    dataType: "html", //Response Typ
                    data: {tle : $('#tle').val()},
                    success: function (data, textStatus, jqXHR) { //Response data
                        $('#genresSelect').html(data);
                    }
                });

                $.ajax({
                    type: "POST", //Method
                    url: "GetLanguages", //Servlet
                    dataType: "html", //Response Type
                    data:{tle : $('#tle').val()},
                    success: function (data,textStatus, jqXHR) { //Response data
                        $('#languagesSelect').html(data);
                    }
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
                            <li class="active"><a href="#">Consulta1<span class="sr-only">(current)</span></a></li>
                            <li class="active"><a href="#">Consulta2<span class="sr-only">(current)</span></a></li>                           
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
        </header>
        <div class="form-inline" id="consulta1">
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

