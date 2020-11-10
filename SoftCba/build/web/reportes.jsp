<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "Modelo.DTO.DTO_RecaudacionPorCurso" %> 
<%@page import= "Modelo.DTO.DTO_Inscripcion" %> 
<%@page import= "Modelo.Curso" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">              
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/darkly/bootstrap.min.css" integrity="sha384-nNK9n28pDUDDgIiIqZ/MiyO3F4/9vsMtReZK39klb/MtkZI3/LtjSjlmyVPS3KdN" crossorigin="anonymous">
        <link href="CSS/misEstilos.css" rel="stylesheet" type="text/css"/>
        <title>SoftCba - Reportes</title>

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
                    <li class="nav-item active">
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
            <h1>Reportes</h1> 
        </div>  

        <div class="tituloContenedor">
            <h4>Listado de alumnos de algún curso seleccionado </h4>
        </div>
        <div>
            <label for="recipient-name" class="col-form-label moverI2">Selecione el Curso</label>
            <form method="Post" action="Reportes">
                <select name="cmbCursos" required="required"  class="ancho"   id="recipient-name" >
                    <c:forEach items="${listadoCursos}" var="c">
                        <option value="${c.idCurso}" <c:if test="${combo == c.idCurso}">selected</c:if> > ${c.nombre} </option>
                    </c:forEach>             
                </select>
                <button type="submit" class="btn btn-info">Filtrar</button>
            </form>  
        </div>
        <div class="tituloContenedor">
            <table class="table table-striped table-dark">
                <thead>
                    <tr>
                        <th scope="col">Alumno</th>
                        <th scope="col">Curso</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <c:forEach items="${listaAlumnosCurso}" var="i">
                        <tr>
                            <td> ${i.alumno}  </td>
                            <td> ${i.curso}  </td>
                        </tr>    
                    </c:forEach>   
                    </tr>               
                </tbody>
            </table>
        </div>


        <div class="tituloContenedor">
            <h4>Total facturado por cada curso</h4>
        </div>
        <div class="tituloContenedor">
            <table class="table table-striped table-dark">
                <thead>
                    <tr>
                        <th scope="col">Curso</th>
                        <th scope="col">Total Facturado</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${recaudacionTotal}" var="i">
                        <tr>
                            <td> ${i.curso}  </td>
                            <td>$ ${i.importe}  </td>
                        </tr>    
                    </c:forEach>                
                </tbody>
            </table>
        </div>


        <div class="tituloContenedor">
            <h4>Sumatoria total de los descuentos realizados</h4>
        </div>
        <div class="tituloContenedor">
            <table class="table table-striped table-dark">
                <thead>
                    <tr>
                        <th scope="col">Total</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>$  ${descuentosTotal}  </td>
                    </tr>               
                </tbody>
            </table>
        </div>    

        <div class="tituloContenedor">
            <h4>Listado de los 5 programas más descargados</h4>
        </div>     
        <div class="tituloContenedor">
            <table class="table table-striped table-dark">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Programa</th>
                        <th scope="col">Cantiad de Descargas</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <c:forEach items="${top5Programas}" var="i">
                        <tr>
                            <td> ${i.idPrograma}  </td>
                            <td> ${i.nombre}  </td>
                            <td> ${i.cantDescargas}  </td>
                        </tr>    
                    </c:forEach>   
                    </tr>               
                </tbody>
            </table>
        </div> 


        <div class="tituloContenedor">
            <h4>Listado de todos los alumnos que accedieron a algún descuento</h4>
        </div>
        <div class="tituloContenedor">
            <table class="table table-striped table-dark">
                <thead>
                    <tr>
                        <th scope="col">Alumno</th>
                        <th scope="col">Suma de Descuentos</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <c:forEach items="${alumnosDescuento}" var="i">
                        <tr>
                            <td> ${i.alumno}  </td>
                            <td> ${i.descuento}  </td>
                        </tr>    
                    </c:forEach>   
                    </tr>               
                </tbody>
            </table>
        </div>                


        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    </body>
</html>
