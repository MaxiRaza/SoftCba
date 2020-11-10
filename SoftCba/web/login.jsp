<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.util.*" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/Login.css" rel="stylesheet" type="text/css"/>
        <title>SoftCba - Inicio Sesion</title>
    </head>  
    <body>             
        <div class="body"></div>
        <div class="grad"></div>       
        <div class="header">
            <div>Soft<span>Cba</span></div>
        </div>
        <div class="login">   
            <% if (request.getAttribute("mensajeError") != null && !request.getAttribute("mensajeError").equals("")) { %>
            <h2>${mensajeError}</h2>
            <% }%> 
            <form method="Post" action="Login" >               
                <input type="text" name="txtUsuario" placeholder="Usuario" required="required" />
                <input type="password" name="txtContrasenia" placeholder="Contraseña" required="required" />
                <button type="submit" class="btn btn-primary btn-block btn-large">Ingresar</button><br>             
            </form>
            <a href="Login?modo=deslogeado" class="btn btn-primary btn-block btn-large">Continuar sin registrarse</a>
        </div>

    </body>
</html>
