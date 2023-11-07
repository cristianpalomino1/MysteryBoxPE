const login_open = document.getElementById('login-open');
const login_open_byregistro = document.getElementById('login-open-byregistro');


const contenedor_login = document.getElementById('contenedor-login');
const contenedor_registro = document.getElementById('contenedor-registro');

const login_close = document.getElementById('login-close');
const registro_close = document.getElementById('registro-close');

const crearCuenta = document.getElementById('crearCuenta');

//Abre la ventana login
login_open.addEventListener('click', () => {
    contenedor_login.classList.add('show');
});


//cierra ventana registro y abre ventana login
login_open_byregistro.addEventListener('click', () => {
    contenedor_registro.classList.remove('show');
    contenedor_login.classList.add('show');
});
//cierra la ventana login y abre la ventana registro
crearCuenta.addEventListener('click', () => {
    contenedor_login.classList.remove('show');
    contenedor_registro.classList.add('show');
});



//cierra la ventana login
login_close.addEventListener('click', () => {
    contenedor_login.classList.remove('show');
});
//cierra la ventana registro
registro_close.addEventListener('click', () => {
    contenedor_registro.classList.remove('show');
});


