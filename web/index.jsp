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
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <main>
            <div id="carouselExampleDark" class="carousel carousel-dark slide carrusel-banners">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active" data-bs-interval="10000">
                        <img src="img-banner/premio_laptop.jpg" class="d-block w-100" alt="laptop">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>¡Se de los primeros en ganar una Laptop Lenovo IdeaPad 1!</h5>
                            <p>Probabilidades de conseguirlo en todas las Mystery Box.</p> 
                        </div>
                    </div>
                    <div class="carousel-item" data-bs-interval="2000">
                        <img src="img-banner/premio_iphone.jpg" class="d-block w-100" alt="iphone">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>¡Se de los primeros en ganar un Iphone 14!</h5>
                            <p>Probabilidades de conseguirlo en todas las Mystery Box.</p> 
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>



            <div class="card text-center main-contenedor">
                <div class="card-header categoria-contenedor" id="categoria-contenedor">
                    <h4>Filtrar Categorias</h4>
                    <ul class="nav nav-pills card-header-pills categoria-lista">


                        <!--Codigo repeticion-->
                        <c:forEach var="a" items="${listaCategorias}">
                            <li class="nav-item categoria-item-contenedor btn-color btn${a.categoria}">
                                <!--cambiar icono-->
                                <img src="img-general/starico.png" alt="star"/>
                                <!--dar nombre de categoria-->
                                <a class="" href="javascript:mostrar${a.categoria}();">${a.categoria}</a>
                            </li>
                        </c:forEach>
                        <!--Codigo repeticion-->
                        <li class="nav-item categoria-item-contenedor btn-color btnMostratTodo">
                            <!--cambiar icono-->
                            <img src="img-general/starico.png" alt="star"/>
                            <!--dar nombre de categoria-->
                            <a href="javascript:mostrarTodo();">Ver todo</a>
                        </li>
                        <!-- MOSTRAR CATEGORIA // TODO -->
                        <script>
                            // Función para mostrar productos de una categoría específica
                            function mostrarCategoria(categoria) {
                                // Ocultar todos los productos
                                var productos = document.querySelectorAll('.producto-carta');
                                productos.forEach(function (producto) {
                                    producto.style.display = 'none';
                                });

                                // Mostrar productos de la categoría seleccionada
                                var productosCategoria = document.querySelectorAll('.producto-carta.' + categoria);
                                productosCategoria.forEach(function (producto) {
                                    producto.style.display = 'block';
                                });
                            }

                            // Asociar las funciones con los botones de categoría
                            <c:forEach var="a" items="${listaCategorias}">
                            document.addEventListener('DOMContentLoaded', function () {
                                var botonCategoria = document.querySelector('.btn${a.categoria}');
                                botonCategoria.addEventListener('click', function () {
                                    mostrarCategoria('${a.categoria}');
                                });
                            });
                            function mostrarTodo() {
                                var productos = document.querySelectorAll('.producto-carta');
                                productos.forEach(function (producto) {
                                    producto.style.display = 'block';
                                });
                            }
                            </c:forEach>
                        </script>

                    </ul>
                </div>

                <div class="card-body productos-contenedor-padre">

                    <div class="productos-contenedor-hijo" id="contenedor-prod">

                        <!--Codigo repeticion-->

                        <c:forEach var="a" items="${listaPlantillas}">

                            <form action="MysteryBox" method="POST" class="ContenedorlistaProductos">
                                <input type="hidden" name="id_plantilla" value="${a.id_plantilla}">

                                <div class="card producto-carta ${a.categoria}" style="width: 14rem;">

                                    <img src="img-general/icono.png" class="card-img-top" alt="...">

                                    <div class="card-body producto-carta-cuerpo">
                                        <h5 class="card-title">${a.nombre}</h5>
                                        <p class="card-text"><strong>${a.categoria}</strong></p>
                                        <p class="card-text"><strong>Capacidad: ${a.capacidad}</strong></p>
                                        <p class="card-text"><strong>$ ${a.precio}</strong></p>
                                        <button type="submit" class="btn btn-primary">Ver más</button>
                                        <p>Envio gratis</p>
                                    </div>
                                </div>
                            </form>
                        </c:forEach>

                        <!--Codigo repeticion-->
                    </div>
                </div>
            </div>
        </main>
        <script src="js/index.js"></script>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
