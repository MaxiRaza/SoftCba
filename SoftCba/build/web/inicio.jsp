<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">                 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/darkly/bootstrap.min.css" integrity="sha384-nNK9n28pDUDDgIiIqZ/MiyO3F4/9vsMtReZK39klb/MtkZI3/LtjSjlmyVPS3KdN" crossorigin="anonymous">
        <link href="CSS/misEstilos.css" rel="stylesheet" type="text/css"/>
        <title>SoftCba - Inicio</title>

    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <a class="navbar-brand">SoftCba</a>       
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="inicio.jsp">Inicio <span class="sr-only">(current)</span></a>
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

        <div>
            <div class="jumbotron">
                <h1 class="display-4">Bienvenido a SoftCba !</h1>
                <p class="lead"> La academia de Software mas reconocida de la provincia y una de las mas importantes del pais. </p>
                <hr class="my-4">
                <p>Contamos con multiples cursos abocados al diseño de software en su maxima expresión.</p>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">"SoftWare" ? </button>
            </div>

            <div class="jumbotron jumbotron-fluid">
                <div class="container">
                    <h1 class="display-4">Programas OpenSource !</h1>
                    <p class="lead">Ofrecemos a su disposición los trabajos realizados por nuestros alumnos.</p>
                </div>
            </div>
        </div>

        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Software</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Se conoce como software o logicial al soporte lógico de un sistema informático, que comprende el conjunto de los componentes lógicos necesarios que hacen posible la realización de tareas específicas, en contraposición a los componentes físicos que son llamados hardware. La interacción entre el software y el hardware hace operativo un ordenador (u otro dispositivo), es decir, el software envía instrucciones que el hardware ejecuta, haciendo posible su funcionamiento.                    
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>    
    </body>
</html>