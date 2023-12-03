<%-- 
    Document   : index2
    Created on : 2 oct. 2023, 12:47:43
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MysteryBox PE</title>
        <%@include file="WEB-INF/jspf/lib.jspf"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <link rel="stylesheet" href="styles/carrito.css"/>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <main>
            <div class="Titulo"><h3>Mi Carrito</h3></div>
            <div id="carrito">
                <div id="productos">
                    <hr/>
                    <c:forEach var="a" items="${lista_carrito}">
                        <c:forEach var="i" begin="1" end="${a.cantidad}">
                            <div class="producto">
                                <img src="img-general/icono.png" alt="Producto 1">
                                <div class="producto-info">
                                    <h5>ID:${a.id_plantilla} ${a.nombre_plantilla}</h5>
                                    <p>Capacidad: ${a.capacidad_plantilla}</p>
                                    <p>Precio: S/.${a.precio_plantilla}</p>                               
                                </div>
                            </div>
                            <a href="#" onclick="mostrarPersonalizar(this)">Personalizar</a>



                            <div class="personalizar">
                                <textarea placeholder="Escribe hasta 50 caracteres" maxlength="50"></textarea>
                                <p>Seleccionar Skin (S/.5)</p>


                                <div class="skin-images">
                                    <div class="SkinBoton">
                                        <button  class="toggle-button selected" onclick="seleccionarSkin(this, 'Skin 1')">
                                            <img src="img-general/icono2.png" alt="Skin 1">
                                        </button>
                                        <span>Default</span>
                                    </div>

                                    <div class="SkinBoton">
                                        <button  class="toggle-button" onclick="seleccionarSkin(this, 'Skin 2')">
                                            <img src="img-general/icono2.png" alt="Skin 2">
                                        </button>
                                        <span>Titulo 2</span> 
                                    </div>
                                    <div class="SkinBoton">
                                        <button  class="toggle-button" onclick="seleccionarSkin(this, 'Skin 3')">
                                            <img src="img-general/icono2.png" alt="Skin 3">
                                        </button>
                                        <span>Titulo 3</span> 
                                    </div>

                                </div>
                            </div>
                            <hr/> 
                        </c:forEach>
                    </c:forEach>
                </div>
                <div id="resumen">
                    <div id="total">Total: S/.${Total}</div>
                    <p>Productos: ${cantidad_Productos}</p>
                    <p>Skins: ${cantidad_Skins}</p>
                    <a href="#" id="pagar-btn">Pagar</a>
                    <div>
                        <br>
                       <p>-Las Mystery Boxes seleccionadas se mostrarán como unidad.</p> 
                        <br>
                       <p>-Skin predeterminada (Default) no tiene cargos extra.</p> 
                    </div>
                </div>
            </div>
            <script>
                function mostrarPersonalizar(element) {
                    var personalizarDiv = element.parentNode.querySelector('.personalizar');
                    personalizarDiv.style.display = 'block';
                }

                function seleccionarSkin(element, nombreSkin) {
                    var buttons = document.querySelectorAll('.toggle-button');

                    // Deselecciona todos los botones
                    buttons.forEach(function (btn) {
                        btn.classList.remove('selected');
                    });

                    // Selecciona el botón actual
                    element.classList.add('selected');

                    // Aquí puedes realizar acciones adicionales al seleccionar un skin

                }
            </script>
        </main>
        <script src="js/index.js"></script>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
