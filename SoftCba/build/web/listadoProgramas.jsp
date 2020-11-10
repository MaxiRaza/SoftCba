<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.util.*" %> 
<%@page import= "Modelo.Programa" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">              
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/darkly/bootstrap.min.css" integrity="sha384-nNK9n28pDUDDgIiIqZ/MiyO3F4/9vsMtReZK39klb/MtkZI3/LtjSjlmyVPS3KdN" crossorigin="anonymous">
        <title>SoftCba - Listado Programas</title>

    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <a class="navbar-brand">SoftCba</a>       
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="inicio.jsp">Inicio <span class="sr-only">(current)</span></a>
                    </li>
                    <c:if test="${admin == 1}">
                        <li class="nav-item">
                            <a class="nav-link" href="Alumnos">Alumnos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Cursos">Cursos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Inscripciones">Inscripciones</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Reportes">Reportes</a>
                        </li>
                    </c:if>
                    <li class="nav-item active">
                        <a class="nav-link" href="Programas">Programas</a>
                    </li>                
                </ul>               
            </div>
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="Login?modo=logearse">${mostrar}</a>
                </li>
            </ul>
        </nav>

        <div class="tituloContenedor">
            <h1>Listado de Programas</h1>
            <c:if test="${admin == 1}"><a href="Programas?modo=alta" class="btn btn-info">Registrar Programa</a></c:if>
            </div>

            <table class="table table-striped table-dark">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Cantidad de Descargas</th>
                        <th scope="col">Alumno</th>
                        <c:if test="${admin == 1}">
                        <th scope="col">Habilitado</th>
                        </c:if>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listadoProgramas}" var="p">
                    <tr>
                        <c:if test="${p.estaHabilitado != false || admin == 1}">
                            <td> ${p.idPrograma}  </td>
                            <td> ${p.nombre}  </td>
                            <td> ${p.cantDescargas} </td>
                            <td> ${p.alumno}  </td>
                            <c:if test="${admin == 1}">
                                <td> ${p.estaHabilitado}  </td>
                                <td><a href="Programas?modo=editar&idPrograma=${p.idPrograma}" class="btn btn-warning">Editar</a></td>
                                <td><a href="Programas?modo=eliminar&idPrograma=${p.idPrograma}" class="btn btn-danger">Eliminar</a></td>
                            </c:if>
                            <td><a href="Programas?modo=descargar&idPrograma=${p.idPrograma}" download="${p.nombre}.txt" class="btn btn-success">Descargar</a></td>
                        </c:if>
                    </tr>    
                </c:forEach>                
            </tbody>
        </table>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    </body>       
</html>