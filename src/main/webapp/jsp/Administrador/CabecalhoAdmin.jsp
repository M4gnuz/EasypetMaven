
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
            String nomeAdmin="";
            int idAdmin=0;
            if(session.getAttribute("login") != null&&session.getAttribute("idAdmin")!=null){
                nomeAdmin = session.getAttribute("login").toString();
                idAdmin= Integer.parseInt(session.getAttribute("idAdmin").toString());
            }          
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav id="nav-principal" class="navbar navbar-expand-lg  border border-dar rounded shadow p-3 mb-3">
            <div class="logo">
                <h3>EasyPet</h3>
                <img src="../../ResourcesIm/logoSite.png" width="88px">
            </div>
            <div class="btn-toolbar mb-3" role="toolbar" aria-label="Toolbar with button groups">
                <div class="btn-group mr-2" role="group" aria-label="First group">
                    <div class="dropdown">
                        <button id="menuCliente" class="btn btn-success dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-user-alt"></i>
                            <%= nomeAdmin %>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">  
                            <a class="dropdown-item" href="../../index.html">Sair</a> 
                        </div>
                    </div>
                </div>
            </div>
        </nav>
    </body>
</html>
