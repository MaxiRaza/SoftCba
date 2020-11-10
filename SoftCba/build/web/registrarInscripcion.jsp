<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.util.*" %> 
<%@page import= "Modelo.DTO.DTO_Curso" %>
<%@page import= "Modelo.DTO.DTO_Alumno" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">              
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/darkly/bootstrap.min.css" integrity="sha384-nNK9n28pDUDDgIiIqZ/MiyO3F4/9vsMtReZK39klb/MtkZI3/LtjSjlmyVPS3KdN" crossorigin="anonymous">
        <link href="CSS/misEstilos.css" rel="stylesheet" type="text/css"/>
        <title>SoftCba - Registrar Inscripción</title>

    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <a class="navbar-brand">SoftCba</a>       
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="inicio.jsp">Inicio <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="Alumnos">Alumnos</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="Cursos">Cursos</a>
                    </li>
                    <li class="nav-item active">
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
            <h1>Registrar una Inscripción</h1>         
        </div>

        <div class="tituloContenedor"> 
            <form method="Post" action="Inscripciones">
                <input type="hidden" name="txtIdCurso" value="0" />               
                <div class="form-group">
                    <label for="recipient-name" class="col-form-label">Alumno</label>
                    <select name="cmbAlumnos" required="required" class="form-control" id="recipient-name" >
                        <c:forEach items="${listadoAlumnos}" var="a">
                            <option value="${a.idAlumno}" > ${a.nombre} </option>
                        </c:forEach>             
                    </select>                                   
                </div>
                <div class="form-group">
                    <label for="recipient-name" class="col-form-label">Curso</label>
                    <select name="cmbCursos" required="required" class="form-control" id="recipient-name" >
                        <c:forEach items="${listadoCursos}" var="c">
                            <option value="${c.idCurso}" > ${c.nombre} </option>
                        </c:forEach>             
                    </select>                                   
                </div>
                <div class="form-group">
                    <label class="col-form-label">Monto</label>
                    <input type="number" name="txtMonto" required="required" class="form-control" id="recipient-name" >
                </div>
                <div class="form-group">
                    <label class="col-form-label">Descuento</label>
                    <input type="number" name="txtDescuento" required="required" class="form-control" id="recipient-name" >
                </div>
                <div>
                    <a href="Inscripciones" class="btn bg-primary">Volver al listado</a>
                    <button type="submit" class="btn btn-success moverI">Registrar inscripción</button>             
                </div>    
            </form       
        </div>

    </body>
</html>
