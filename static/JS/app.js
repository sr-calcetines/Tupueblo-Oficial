// MAPA
const map = L.map("map").setView([37.5, -4.5], 7);

L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
    attribution: '© OpenStreetMap contributors'
}).addTo(map);

axios.get("pueblos.php")
    .then(response => {
        const pueblos = response.data;

        pueblos.forEach(pueblo => {
            const lng = pueblo.lon;
            const lat = pueblo.lat;

            const marker = L.marker([lat, lng]).addTo(map);
            const actividadesList = pueblo.actividades.map(act => `<li>${act.nombre}: ${act.descripcion} <img src="${act.imagen}" width="10%"></li>`).join("");
            marker.bindPopup(`<b>${pueblo.nombre}</b><br>${pueblo.descripcion}<ul>${actividadesList}</ul>`);

            marker.on('click', () => {
                window.location.href = `pueblo.html?id=${pueblo.id}`;
            });
        });
    })
    .catch(error => {
        console.error("Error cargando los datos:", error);
    });
