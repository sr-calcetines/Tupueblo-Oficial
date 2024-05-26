document.addEventListener('DOMContentLoaded', function () {
    const params = new URLSearchParams(window.location.search);
    const puebloId = params.get('id');

    if (puebloId) {
        fetchActividades(puebloId);
    } else {
        console.error('ID de pueblo no proporcionado en la URL');
    }

    document.getElementById('addActividadForm').addEventListener('submit', function (event) {
        event.preventDefault();
        addActividad(puebloId);
    });

    document.getElementById('editActividadForm').addEventListener('submit', function (event) {
        event.preventDefault();
        updateActividad(puebloId);
    });
});

function fetchActividades(puebloId) {
    axios.post('fetchActividades.php', new URLSearchParams({ pueblo_id: puebloId }))
        .then(response => {
            console.log('Actividades recibidas:', response.data);
            const actividades = response.data;

            if (!Array.isArray(actividades)) {
                console.error('Respuesta no es un array:', actividades);
                return;
            }

            const actividadesContainer = document.getElementById('actividades');
            actividadesContainer.innerHTML = '';
            actividades.forEach(actividad => {
                const actividadElement = document.createElement('div');
                actividadElement.classList.add('actividad');
                actividadElement.innerHTML = `
                    <h3>${actividad.nombre}</h3>
                    <p>${actividad.descripcion}</p>
                    <img src="${actividad.imagen}" alt="${actividad.nombre}">
                    <button onclick="populateEditForm(${actividad.id}, '${actividad.nombre}', '${actividad.descripcion}', '${actividad.imagen}')">Editar</button>
                    <button onclick="deleteActividad(${actividad.id}, ${puebloId})">Eliminar</button>
                `;
                actividadesContainer.appendChild(actividadElement);
            });
        })
        .catch(error => console.error('Error fetching actividades:', error));
}

function addActividad(puebloId) {
    const nombre = document.getElementById('nombre').value;
    const descripcion = document.getElementById('descripcion').value;
    const imagen = document.getElementById('imagen').value;

    axios.post('addActividad.php', new URLSearchParams({
        pueblo_id: puebloId,
        nombre: nombre,
        descripcion: descripcion,
        imagen: imagen
    }))
        .then(response => {
            console.log('Actividad añadida:', response.data);
            fetchActividades(puebloId);
        })
        .catch(error => console.error('Error añadiendo actividad:', error));
}

function populateEditForm(id, nombre, descripcion, imagen) {
    document.getElementById('edit-id').value = id;
    document.getElementById('edit-nombre').value = nombre;
    document.getElementById('edit-descripcion').value = descripcion;
    document.getElementById('edit-imagen').value = imagen;
    document.getElementById('editFormContainer').style.display = 'block';
}

function updateActividad(puebloId) {
    const id = document.getElementById('edit-id').value;
    const nombre = document.getElementById('edit-nombre').value;
    const descripcion = document.getElementById('edit-descripcion').value;
    const imagen = document.getElementById('edit-imagen').value;

    axios.post('updateActividad.php', new URLSearchParams({
        id: id,
        nombre: nombre,
        descripcion: descripcion,
        imagen: imagen
    }))
        .then(response => {
            console.log('Actividad actualizada:', response.data);
            fetchActividades(puebloId);
            document.getElementById('editFormContainer').style.display = 'none';
        })
        .catch(error => console.error('Error actualizando actividad:', error));
}

function deleteActividad(id, puebloId) {
    if (confirm('¿Estás seguro de que deseas eliminar esta actividad?')) {
        axios.post('deleteActividad.php', new URLSearchParams({ id: id }))
            .then(response => {
                console.log('Actividad eliminada:', response.data);
                fetchActividades(puebloId);
            })
            .catch(error => console.error('Error eliminando actividad:', error));
    }
}