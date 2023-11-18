<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MysteryBox PE</title>
        <%@include file="WEB-INF/jspf/lib.jspf"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <main>
            
            <c:forEach var="a" items="${listaPlantillas}">
                <!-- 
                <form action="MysteryBox" method="POST" class="ContenedorlistaProductos">
                    <input type="hidden" name="id_plantilla" value="${a.id_plantilla}">

                    <div class="card producto-carta ${a.categoria}" style="width: 14rem;">

                        <img src="img-general/icono.png" class="card-img-top" alt="...">

                        <div class="card-body producto-carta-cuerpo">
                            <h5 class="card-title">${a.nombre}</h5>
                            <p class="card-text"><strong>${a.categoria}</strong></p>
                            <p class="card-text"><strong>Capacidad: ${a.capacidad}</strong></p>
                            <p class="card-text"><strong>$ ${a.precio}</strong></p>
                            <button type="submit" class="btn btn-primary">Añadir a Carrito</button>
                            <p>Envio gratis</p>
                        </div>
                    </div>
                </form>
                   -->
            </c:forEach>
            
        </main>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
