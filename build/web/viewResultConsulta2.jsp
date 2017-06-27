<%-- 
    Document   : viewResultConsulta1
    Created on : 26/06/2017, 01:00:35
    Author     : vitor
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    </head>
    <body><header>
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
        <%
        ArrayList<String> results = (ArrayList<String>)request.getAttribute("result_list");
        if(results != null){
        if(results.isEmpty()) {
      %>
        <h3>No movies were find. Please review your search terms.</h3>
      <%
        } else {
      %>
      
      <table>
          <thead>
            <th width="180">Movies Titles</th>
          </thead>
        <%
          for(int i = 0 ; i < results.size(); i++) {
            out.println("<tr>" + "<td>" + results.get(i)+ "</td>" 
              + "<tr>");
          }
        %>
        </table>
      <% 
        }}
      %>
    </body>
</html>
