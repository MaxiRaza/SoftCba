<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.util.*" %> 
<%@page import= "Modelo.Alumno" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">              
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/darkly/bootstrap.min.css" integrity="sha384-nNK9n28pDUDDgIiIqZ/MiyO3F4/9vsMtReZK39klb/MtkZI3/LtjSjlmyVPS3KdN" crossorigin="anonymous">
        <link href="CSS/misEstilos.css" rel="stylesheet" type="text/css"/>
        <title>SoftCba - Editar Programa</title>

    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <a class="navbar-brand">SoftCba</a>       
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="inicio.jsp">Inicio <span class="sr-only">(current)</span></a>
                    </li>
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
            <h1>Editar un Programa</h1>         
        </div>

        <jsp:useBean id="programa" class="Modelo.Programa" scope="request"></jsp:useBean>

            <div class="tituloContenedor"> 
                <form method="Post" action="Programas">
                    <input type="hidden" name="txtIdPrograma" value="<jsp:getProperty name="programa" property="idPrograma"></jsp:getProperty>" />
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Nombre</label>
                        <input type="text" name="txtNombre" required="required" class="form-control" id="recipient-name" value="<jsp:getProperty name="programa" property="nombre"></jsp:getProperty>" >
                    </div>               
                    <input type="hidden" name="txtCantDescargas" value="<jsp:getProperty name="programa" property="cantDescargas"></jsp:getProperty>" />
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Alumno</label>
                        <select name="cmbAlumnos" required="required" class="form-control" id="recipient-name">
                        <c:forEach items="${listadoAlumnos}" var="a">
                            <option value="${a.idAlumno}" <c:if test="${a.idAlumno == programa.idAlumno}"> selected </c:if> > ${a.nombre} </option>
                        </c:forEach>             
                    </select>                                   
                </div>               
                <div class="form-group">    
                    <label for="exampleFormControlFile1">Programa</label>
                    <input type="file" class="form-control-file" id="exampleFormControlFile1">
                    </div>
                    <div class="form-check">
                        <input type="checkbox" name="chkEstaHabilitado" class="form-check-input" id="exampleCheck1" value="habilitado" checked="<jsp:getProperty name="programa" property="estaHabilitado"></jsp:getProperty>">
                    <label class="form-check-label" for="exampleCheck1">Habilitar para descargar</label>
                </div>
                <div class="moverA">
                    <a href="Programas" class="btn bg-primary">Volver al listado</a>
                    <button type="submit" class="btn btn-success moverI">Editar programa</button>             
                </div>    
            </form       
        </div>       

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    </body>
</html>
