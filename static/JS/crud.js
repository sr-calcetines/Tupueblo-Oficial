document.addEventListener('DOMContentLoaded', function () {
    fetchPueblos();
});

function fetchPueblos() {
    axios.get('fetchPueblos.php')
        .then(response => {
            console.log('Datos recibidos:', response.data);
            const pueblos = response.data;

            // Verificación de que pueblos es un array
            if (!Array.isArray(pueblos)) {
                console.error('Respuesta no es un array:', pueblos);
                return;
            }

            const tableBody = document.querySelector('#pueblos-table tbody');
            tableBody.innerHTML = '';
            pueblos.forEach(pueblo => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${pueblo.id}</td>
                    <td>${pueblo.nombre}</td>
                    <td>${pueblo.descripcion}</td>
                    <td>${pueblo.lat}</td>
                    <td>${pueblo.lon}</td>
                    <td>${pueblo.imagenes}</td>
                    <td>
                        <button onclick="editPueblo(${pueblo.id})">Editar</button>
                        <button onclick="deletePueblo(${pueblo.id})">Eliminar</button>
                        <button onclick="verActividades(${pueblo.id})">Ver Actividades</button>
                    </td>
                `;
                tableBody.appendChild(row);
            });
        })
        .catch(error => console.error('Error fetching pueblos:', error));
}

function createOrUpdate() {
    const id = document.getElementById('id').value;
    const nombre = document.getElementById('nombre').value;
    const descripcion = document.getElementById('descripcion').value;
    const lat = document.getElementById('lat').value;
    const lon = document.getElementById('lon').value;
    const imagenes = document.getElementById('imagenes').value;

    const data = {
        nombre: nombre,
        descripcion: descripcion,
        lat: lat,
        lon: lon,
        imagenes: imagenes
    };

    console.log('Datos a enviar:', data);

    if (id) {
        data.id = id;
        axios.post('updatePueblo.php', data, {
            headers: {
                'Content-Type': 'application/json'
            }
        })
            .then(response => {
                console.log('Respuesta de actualización:', response.data);
                fetchPueblos();
                clearForm();
            })
            .catch(error => console.error('Error updating pueblo:', error));
    } else {
        axios.post('createPueblo.php', data, {
            headers: {
                'Content-Type': 'application/json'
            }
        })
            .then(response => {
                console.log('Respuesta de creación:', response.data);
                fetchPueblos();
                clearForm();
            })
            .catch(error => console.error('Error creating pueblo:', error));
    }
}

function editPueblo(id) {
    axios.get(`getPueblo.php?id=${id}`)
        .then(response => {
            console.log('Datos de pueblo:', response.data);
            const pueblo = response.data;
            document.getElementById('id').value = pueblo.id;
            document.getElementById('nombre').value = pueblo.nombre;
            document.getElementById('descripcion').value = pueblo.descripcion;
            document.getElementById('lat').value = pueblo.lat;
            document.getElementById('lon').value = pueblo.lon;
            document.getElementById('imagenes').value = pueblo.imagenes;
        })
        .catch(error => console.error('Error fetching pueblo:', error));
}

function deletePueblo(id) {
    if (confirm('¿Estás seguro de que deseas eliminar este pueblo?')) {
        const params = new URLSearchParams();
        params.append('id', id);

        axios.post('deletePueblo.php', params)
            .then(response => {
                console.log('Respuesta de eliminación:', response.data);
                fetchPueblos();
            })
            .catch(error => console.error('Error al eliminar el pueblo:', error));
    }
}

function verActividades(id) {
    if (confirm('¿Estás seguro de que deseas ver las actividades de este pueblo?')) {
        window.location.href = `actividades.html?id=${id}`;
    }
}

function clearForm() {
    document.getElementById('id').value = '';
    document.getElementById('nombre').value = '';
    document.getElementById('descripcion').value = '';
    document.getElementById('lat').value = '';
    document.getElementById('lon').value = '';
    document.getElementById('imagenes').value = '';
}
