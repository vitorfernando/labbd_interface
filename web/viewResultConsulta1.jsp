<%-- 
    Document   : viewResultConsulta1
    Created on : 27/06/2017, 02:39:24
    Author     : vitor
--%>


<%@page import="Model.Director"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="js/jquery-3.2.1.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Consulta1 Result</title>
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
                            <li class="active"><a href="index.jsp">Consulta1<span class="sr-only">(current)</span></a></li>
                            <li class="active"><a href="consulta2.jsp">Consulta2<span class="sr-only">(current)</span></a></li>                           
                            <li class="active"><a href="teste.jsp">Testes<span class="sr-only">(current)</span></a></li>                           
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
        </header>
        <section>
    <article>
      <%
        ArrayList<Director> directors = (ArrayList<Director>)request.getAttribute("directors_list");
        if(directors.isEmpty()) {
      %>
        <p>No directors were find. Please review your search terms.</p>
      <%
        } else {
      %>
        <table width="100" class="table table-hover">
          <thead>
            <th>ID</th>
            <th>DirectorName</th>
          </thead>
        <%
          for(Director u : directors) {
            out.println("<tr>" + "<td>" + u.getDirectorid()+ "</td>" + "<td>" 
              + u.getDname()+ "</td>" + "<tr>");
          }
        %>
        </table>
      <% 
        }
      %>
    </article>
  </section>
    </body>
</html>
