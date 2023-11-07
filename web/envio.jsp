<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>MysteryBox PE</title>
    <%@include file="WEB-INF/jspf/lib.jspf"%>
</head>
<body>
    <%@include file="WEB-INF/jspf/header.jspf" %>
    <main>
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h2>Datos de entrega</h2>
                    <form>
                        <div class="form-group">
                            <label for="direccionGuardada">Seleccionar dirección guardada</label>
                            <select class="form-control" id="direccionGuardada">
                                <option>Seleccionar dirección guardada</option>
                                <option>Dirección 1</option>
                                <option>Dirección 2</option>
                                <option>Dirección 3</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="departamento">Departamento</label>
                            <input type="text" class="form-control" id="departamento" placeholder="Departamento" required>
                        </div>
                        <div class="form-group">
                            <label for="distrito">Distrito</label>
                            <input type="text" class="form-control" id="distrito" placeholder="Distrito" required>
                        </div>
                        <div class="form-group">
                            <label for="direccionTexto">Dirección (Av / Calle / Jirón)</label>
                            <input type="text" class="form-control" id="direccionTexto" placeholder="Dirección" required>
                        </div>
                        <div class="form-group">
                            <label for="piso">Piso</label>
                            <input type="text" class="form-control" id="piso" placeholder="Piso">
                        </div>
                        <div class="form-group">
                            <label for="referencias">Referencias</label>
                            <input type="text" class="form-control" id="referencias" placeholder="Referencias">
                        </div>

                        <!-- Botón de Confirmar -->
                        <div class="mt-4 text-center">
                            <button type="button" class="btn btn-primary">CONFIRMAR</button>
                        </div>
                    </form>
                </div>
                <div class="col-md-6">
                    <!-- Recomendación -->
                    <h3>Recomendación</h3>
                    <p>Aquí puedes agregar un mensaje de recomendación.</p>
                    
                    <!-- Imagen aleatoria -->
                    <img src="https://via.placeholder.com/150" alt="Imagen Aleatoria">
                </div>
            </div>
        </div>
    </main>
    <%@include file="WEB-INF/jspf/footer.jspf" %>
</body>
</html>

