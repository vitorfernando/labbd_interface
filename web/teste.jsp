<%-- 
    Document   : teste
    Created on : 26/06/2017, 19:59:49
    Author     : vitor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teste</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <script src="js/jquery-3.2.1.min.js"></script>
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
                            <li class="active" id="consulta1buttom"><a href="#">Consulta1<span class="sr-only">(current)</span></a></li>
                            <li class="active"><a href="consulta2.jsp">Consulta2<span class="sr-only">(current)</span></a></li>                           
                            <li class="active"><a href="teste.jsp">Testes<span class="sr-only">(current)</span></a></li>                           
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
        </header>
        <form class="form-inline" autocomplete="on" method="POST" action="Teste">
            <h3>Teste</h3>
            
            <label for="query">Query:</label>
            <input type="text" class="form-control" id="query" name="query">
            <input type="submit" value="Submit" class="btn btn-primary"/>
        </form>
        <div id="div-result">
        </div>
    </body>
</html>
