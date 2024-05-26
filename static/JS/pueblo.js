document.addEventListener('DOMContentLoaded', function () {
    const params = new URLSearchParams(window.location.search);
    const puebloId = params.get('id');

    if (puebloId) {
        cargarPueblo(puebloId);
    } else {
        console.error('ID de pueblo no proporcionado en la URL');
    }
});

function cargarPueblo(id) {
    axios.get(`pueblo.php?id=${id}`)
        .then(response => {
            const pueblo = response.data;
            console.log('Datos recibidos del servidor:', pueblo);

            // Verificar que el objeto pueblo tiene las propiedades esperadas
            if (!pueblo || typeof pueblo !== 'object' || pueblo.id === null) {
                throw new Error('Datos del pueblo no válidos');
            }

            document.getElementById('pueblo-nombre').innerText = pueblo.nombre || 'Sin nombre';
            document.getElementById('pueblo-descripcion').innerText = pueblo.descripcion || 'Sin descripción';
            document.getElementById('pueblo-nombre-actividades').innerText = pueblo.nombre || 'Sin nombre';

            const imagenesContainer = document.getElementById('pueblo-imagenes');
            imagenesContainer.innerHTML = ''; // Limpiar el contenedor de imágenes
            if (Array.isArray(pueblo.imagenes)) {
                pueblo.imagenes.forEach(imagen => {
                    const li = document.createElement('li');
                    li.innerHTML = `<img src="${imagen}" alt="${pueblo.nombre}" style="width: 100%;">`;
                    imagenesContainer.appendChild(li);
                });
            }

            const actividadesContainer = document.getElementById('pueblo-actividades');
            actividadesContainer.innerHTML = ''; // Limpiar el contenedor de actividades
            if (Array.isArray(pueblo.actividades)) {
                pueblo.actividades.forEach(actividad => {
                    const li = document.createElement('li');
                    li.innerHTML = `${actividad.nombre}: ${actividad.descripcion} <img src="${actividad.imagen}" width="10%">`;
                    actividadesContainer.appendChild(li);
                });
            }
        })
        .catch(error => {
            console.error('Error cargando los datos del pueblo:', error);
        });
}
