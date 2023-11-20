<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PRODUCTOS DE MYSTERY BOX</title>
        <%@include file="WEB-INF/jspf/lib.jspf"%>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <link rel="stylesheet" href="styles/comprar.css"/>

    </head>

    <body>
        <% boolean added = (Boolean) request.getAttribute("added"); %>


        <%if (added) {%>

        <div class="contenedor-login" id="miModal">
            <div class="contenido-login">
                <button class="boton-aux-cerrar" id="cerrar"></button>
                <p>¡Producto agregado al carrito!</p>
                <button onclick="seguirComprando()">Seguir comprando</button>
                <button onclick="irAlCarrito()">Ir a carrito</button>
                <label for="cerrar" class="cerrar-modal"></label>
            </div>
        </div>
        <script>
            // Mostrar la ventana modal
            const contenedor_modal = document.getElementById('miModal');
            const cerrar = document.getElementById('cerrar');

            contenedor_modal.classList.add('show');

            function seguirComprando() {
                contenedor_modal.classList.remove('show');

            }
            function irAlCarrito() {
                window.location.href = "/MysteryBoxPE"; 
            }
            cerrar.addEventListener('click', () => {
                contenedor_modal.classList.remove('show');
            });
        </script>

        <%    }%>

        <div class="container">
            <div class="product-card">
                <figure>
                    <img src="img-general/icono.png">
                </figure>
                <div class="product-info">
                    <h2 class="product-title">Nombre: ${nombre_plantilla}</h2>
                    <p><strong>Categoria: ${categoria_plantilla}</strong></p>
                    <p><strong>Capacidad: ${capacidad_plantilla}</strong></p>
                    <p class="product-price">Precio: ${precio_plantilla}</p>
                </div>
                <div class="purchase-form">


                    <form action="AddProduct" method="post">
                        <label for="cantidad">Cantidad:</label>
                        <input type="number" id="cantidad" name="cantidad" min="1" value="1">
                        <input type="hidden" name="id_plantilla" value="${id_plantilla}">
                        <input type="submit" value="Agregar al carrito">
                    </form>


                </div>
            </div>


            <!-- Aquí continúa el código para otros productos -->
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>

</html>