<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.util.*" %> 
<%@page import= "Modelo.Barrio" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">              
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/darkly/bootstrap.min.css" integrity="sha384-nNK9n28pDUDDgIiIqZ/MiyO3F4/9vsMtReZK39klb/MtkZI3/LtjSjlmyVPS3KdN" crossorigin="anonymous">
        <link href="CSS/misEstilos.css" rel="stylesheet" type="text/css"/>
        <title>SoftCba - Registrar Alumno</title>

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
            <h1>Registrar un Alumno</h1>         
        </div>

        <div class="tituloContenedor"> 
            <form method="Post" action="Alumnos">
                <input type="hidden" name="txtIdAlumno" value="0" />
                <div class="form-group">
                    <label for="recipient-name" class="col-form-label">Legajo</label>
                    <input type="number" name="txtLegajo" required="required" class="form-control" id="recipient-name" >
                </div>
                <div class="form-group">
                    <label for="recipient-name" class="col-form-label">Nombre</label>
                    <input type="text" name="txtNombre" required="required" class="form-control" id="recipient-name" >
                </div>
                <div class="form-group">
                    <label for="recipient-name" class="col-form-label">Apellido</label>
                    <input type="text" name="txtApellido" required="required" class="form-control" id="recipient-name" >
                </div>
                <div class="form-group">
                    <label for="recipient-name" class="col-form-label">Fecha de Nacimiento</label>
                    <input type="date" name="txtFechaNac" required="required" class="form-control" id="recipient-name" >
                </div>
                <div class="form-group">
                    <label for="recipient-name" class="col-form-label">Barrio</label>
                    <select name="cmbBarrio" required="required" class="form-control" id="recipient-name" >
                        <c:forEach items="${listadoBarrios}" var="b">
                            <option value="${b.idBarrio}" > ${b.descripcion} </option>
                        </c:forEach>             
                    </select>                                   
                </div>
                <div class="form-group">
                    <label for="recipient-name" class="col-form-label">Calle</label>
                    <input type="text" name="txtCalle" required="required" class="form-control" id="recipient-name" >
                </div>
                <div class="form-group">
                    <label class="col-form-label">Número</label>
                    <input type="number" name="txtNumero" required="required" class="form-control" id="recipient-name" >
                </div>
                <div class="form-group">
                    <label class="col-form-label">Teléfono</label>
                    <input type="number" name="txtTelefono" required="required" class="form-control" id="recipient-name" >
                </div>
                <div class="form-group">
                    <label class="col-form-label">Correo</label>
                    <input type="text" name="txtCorreo" required="required" class="form-control" id="recipient-name" >
                </div>
                <div>
                    <a href="Alumnos" class="btn bg-primary">Volver al listado</a>
                    <button type="submit" class="btn btn-success moverI">Registrar alumno</button>             
                </div>    
            </form       
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    </body>
</html>
