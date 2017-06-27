<%-- 
    Document   : index
    Created on : 21/06/2017, 04:18:29
    Author     : vitor
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Consulta 1</title>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/getSelectsConsulta1.js"></script>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
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
                            <li class="active"><a href="index.jsp">Consulta1<span class="sr-only">(current)</span></a></li>
                            <li class="active"><a href="consulta2.jsp">Consulta2<span class="sr-only">(current)</span></a></li>                           
                            <li class="active"><a href="teste.jsp">Testes<span class="sr-only">(current)</span></a></li>                           
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
        </header>
        <form class="form-inline" id="consulta1" method="POST" action="Consulta1">
            <h3>Consulta 1</h3>

            <label for="tle">Title:</label>
            <input type="text" class="form-control" id="tle" name="tle">

            <label class="mr-sm-2" for="genresSelect1">Gênero</label>
            <select class="form-control" id="genresSelect1" name="genresSelect1">
            </select>

            <button type="button" class="btn btn-secondary btn-sm" id="addGenresButtom">+</button>

            <label class="mr-sm-2" for="languagesSelect1">Languages</label>
            <select class="form-control" id="languagesSelect1" name="languagesSelect1">               
            </select>

            <button type="button" class="btn btn-secondary btn-sm" id="addLanguagesButtom">+</button>
            <input type="number" style="display:none" id="count_genres">
            <input type="number" style="display:none" id="count_languages">
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>


    </body>
</html>

