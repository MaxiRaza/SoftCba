<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.util.*" %> 
<%@page import= "Modelo.DTO.DTO_Alumno" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">              
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/darkly/bootstrap.min.css" integrity="sha384-nNK9n28pDUDDgIiIqZ/MiyO3F4/9vsMtReZK39klb/MtkZI3/LtjSjlmyVPS3KdN" crossorigin="anonymous">
        <link href="CSS/misEstilos.css" rel="stylesheet" type="text/css"/>
        <title>SoftCba - Listado Alumnos</title>

    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <a class="navbar-brand">SoftCba</a>       
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="inicio.jsp">Inicio <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
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
                    <li class="nav-item">
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
            <h1>Listado de Alumnos</h1> 
            <a href="Alumnos?modo=alta" class="btn btn-info">Registrar Alumno</a>
        </div>

        <table class="table table-striped table-dark">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Legajo</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Apellido</th>
                    <th scope="col">Fecha Nacimiento</th>
                    <th scope="col">Barrio</th>
                    <th scope="col">Calle</th>
                    <th scope="col">Número</th>
                    <th scope="col">Teléfono</th>
                    <th scope="col">Mail</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listadoAlumnos}" var="a">
                    <tr>
                        <td> ${a.idAlumno}  </td>
                        <td> ${a.legajo}  </td>
                        <td> ${a.nombre}  </td>
                        <td> ${a.apellido}  </td>
                        <td> ${a.fechaNac}  </td>
                        <td> ${a.barrio}  </td>
                        <td> ${a.calle}  </td>
                        <td> ${a.numero}  </td>
                        <td> ${a.telefono}  </td>
                        <td> ${a.correo}  </td>
                        <td><a href="Alumnos?modo=editar&idAlumno=${a.idAlumno}" class="btn btn-warning">Editar</a></td>
                        <td><a href="Alumnos?modo=eliminar&idAlumno=${a.idAlumno}" class="btn btn-danger">Eliminar</a></td>
                    </tr>    
                </c:forEach>                
            </tbody>
        </table>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>    
    </body>
</html>
