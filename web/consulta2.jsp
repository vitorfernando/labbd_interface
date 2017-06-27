<%-- 
    Document   : consulta2
    Created on : 25/06/2017, 22:58:12
    Author     : vitor
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Consulta 2</title>
        <script src="js/jquery-3.2.1.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">       
    </head>
    <body>
        <header>
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <a class="navbar-brand" href="index.jsp">Home</a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li class="active" id="consulta1buttom"><a href="index.jsp">Consulta1<span class="sr-only">(current)</span></a></li>
                            <li class="active"><a href="#">Consulta2<span class="sr-only">(current)</span></a></li>                           
                            <li class="active"><a href="teste.jsp">Testes<span class="sr-only">(current)</span></a></li> 
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
        </header>
        
        <form class="form-inline" id="consulta2" method="POST" action="Consulta2">
            <h3>Consulta 2</h3>
            
            <label class="mr-sm-2" for="actorSelect">Actor</label>
            <input type="text" class="form-control" id="actorSelect" name="actorSelect">
            
            <label class="mr-sm-2" for="directorSelect">Director</label>
            <input type="text" class="form-control" id="directorSelect" name="directorSelect">               

            <input type="submit" class="btn btn-primary"></button>
        </form>
    </body>
</html>
