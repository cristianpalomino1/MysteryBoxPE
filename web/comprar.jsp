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
                    <form action="#" method="post">
                        <label for="cantidad">Cantidad:</label>
                        <input type="number" id="cantidad" name="cantidad" min="1" value="1">
                        <label for="metodoPago">Método de Pago:</label>
                        <select id="metodoPago" name="metodoPago">
                            <option value="Visa">Visa</option>
                            <option value="MasterCard">MasterCard</option>
                            <option value="PayPal">PayPal</option>
                            <option value="PagoEfectivo">PagoEfectivo</option>
                            <!-- Puedes agregar más opciones de método de pago según sea necesario -->
                        </select>
                        <input type="hidden" name="productoId" value="${id_plantilla}">
                        <input type="submit" value="Agregar al carrito">
                    </form>
                </div>
            </div>





            <div class="contenedor-login" id="contenedor-login">
                <div class="contenido-login row">
                    <button class="boton-aux-cerrar" id="login-close"></button>
                    <div class="col-6 lado-izquierdo">
                        <img class="imagen-login" src="img-general/icono.png" alt="alt"/>
                        <p>¡Bienvenido/a devuelta a <strong>MISTERY BOX PE!</strong></p>
                        <p>¿Aun no tienes una cuenta? Crea una haciendo <a href="#" id="crearCuenta">Click aquí</a><p>
                    </div>
                    <div class="col-6 lado-derecho">
                        <form action="Login" method="post">
                            <label>Nombre de cuenta</label>
                            <input type="text" name="username" required autocomplete="off">
                            <label>Contraseña</label>
                            <input type="password" name="password" required autocomplete="off">
                            <button type="submit" class="btn-iniciosesion">Iniciar Sesión</button>
                            <a href="#">¿Olvidaste tu contraseña?</a>
                        </form>              
                    </div>  
                    <label for="login-close" class="cerrar-modal"></label>
                </div>
            </div>
                        
            <!-- Aquí continúa el código para otros productos -->
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>