<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>MysteryBox PE</title>
    <%@include file="WEB-INF/jspf/lib.jspf"%>
</head>
<body>
    
    <main>
        <div class="container">
            <h2>Datos de cuenta</h2>
            <form>
                <div class="form-group">
                    <label for="nombreUsuario">Nombre de usuario</label>
                    <input type="text" class="form-control" id="nombreUsuario" placeholder="Nombre de usuario" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" placeholder="Email" required>
                </div>
                <div class="form-group">
                    <label for="contrasena">Contraseña</label>
                    <input type="password" class="form-control" id="contrasena" placeholder="Contraseña" required>
                </div>
            </form>
        </div>

        <div class="container">
            <h2>Datos personales</h2>
            <form>
                <div class="form-group">
                    <label for="nombres">Nombres</label>
                    <input type="text" class="form-control" id="nombres" placeholder="Nombres" required>
                </div>
                <div class="form-group">
                    <label for="dni">DNI</label>
                    <input type="number" class="form-control" id="dni" placeholder="DNI" required>
                </div>
                <div class="form-group">
                    <label for="telefono">Teléfono</label>
                    <input type="tel" class="form-control" id="telefono" placeholder="Teléfono" required>
                </div>
            </form>
        </div>

        <div class="container">
            <h2>Datos de entrega</h2>
            <form>
                <div class="form-group">
                    <label for="direccion">Dirección</label>
                    <input type="text" class="form-control" id="direccion" placeholder="Dirección" required>
                </div>
            </form>
        </div>
        
        <!-- Botón de Guardar -->
        <div class="container text-center">
            <button type="button" class="btn btn-primary">Guardar</button>
        </div>
    </main>
    <%@include file="WEB-INF/jspf/footer.jspf" %>
</body>
</html>


