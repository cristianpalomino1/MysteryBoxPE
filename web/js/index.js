var clientHeight = document.getElementById('contenedor-prod').clientHeight;
if (clientHeight <= 400) {
    alert(clientHeight);
}

function mostrarTodo() {
    const cards = [...document.querySelectorAll('.producto-carta')];
    cards.forEach(card => {
        card.classList.remove('ocultar');
    });
}
function mostrarAnime() {
    const btnAnime = document.querySelector('.btnAnime');
    btnAnime.classList.toggle('btn-color-clicked');
    const cards = [...document.querySelectorAll('.Anime')];
    cards.forEach(card => {
        card.classList.toggle('ocultar');
    });
}
function mostrarTecnologia() {
    const btnTecnologia = document.querySelector('.btnTecnologia');
    btnTecnologia.classList.toggle('btn-color-clicked');
    const cards = [...document.querySelectorAll('.Tecnologia')];
    cards.forEach(card => {
        card.classList.toggle('ocultar');
    });
}
function mostrarModa() {
    const btnModa = document.querySelector('.btnModa');
    btnModa.classList.toggle('btn-color-clicked');
    const cards = [...document.querySelectorAll('.Moda')];
    cards.forEach(card => {
        card.classList.toggle('ocultar');
    });
}
