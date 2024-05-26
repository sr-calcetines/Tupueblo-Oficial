-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-05-2024 a las 15:25:05
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tupueblo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades`
--

CREATE TABLE `actividades` (
  `id` int(11) NOT NULL,
  `pueblo_id` int(11) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `actividades`
--

INSERT INTO `actividades` (`id`, `pueblo_id`, `nombre`, `descripcion`, `imagen`) VALUES
(1, 1, 'Caminito del Rey', 'Sumérgete en una aventura única mientras caminas por pasarelas suspendidas entre desfiladeros y admiras impresionantes vistas naturales que te dejarán sin aliento. ¡Una experiencia inolvidable para los amantes de la naturaleza y la aventura!', 'https://images.ecestaticos.com/Rmzh9lQlePu4lDYv8Kq6hmXXrNs=/0x0:2125x1410/1200x900/filters:fill(white):format(jpg)/f.elconfidencial.com%2Foriginal%2F6a9%2Fc05%2F9d4%2F6a9c059d4bc3a78916df57a2ebf6a5de.jpg'),
(2, 1, 'El torcal', 'Un paisaje único de rocas calizas esculpidas por la naturaleza a lo largo de milenios. ¡Déjate sorprender por su belleza ancestral!', 'https://www.torcaldeantequera.com/wp-content/uploads/2022/12/Rutas-por-libre-scaled.jpg'),
(3, 1, 'Dólmenes', 'Adentrate en la historia ancestral de los dolmenes. Monumentos megalíticos que cuentan la historia de antiguas civilizaciones. ¡Explora estos misteriosos lugares y conéctate con el pasado como nunca antes!', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Dolmen_de_Menga_Antequera.JPG/1280px-Dolmen_de_Menga_Antequera.JPG'),
(4, 1, 'Alcazaba', 'Explora la majestuosidad de la Alcazaba. Una fortaleza milenaria que domina el paisaje con su imponente presencia. Descubre sus intrincados pasillos, jardines exuberantes y vistas panorámicas que te transportarán a épocas pasadas. ¡Una experiencia inolvidable en el corazón de la historia!', 'https://fotografias.lasexta.com/clipping/cmsimages02/2023/03/25/C6498447-EA54-49DE-93C4-046120A66CE6/antequera_58.jpg?crop=960,544,x0,y46&width=1000&height=567&optimize=high&format=webply'),
(5, 1, 'Villa Romana', 'Descubre el legado romano de Antequera. Explora la esplendorosa Villa Romana, donde los vestigios arqueológicos narran la vida cotidiana de una antigua civilización. ¡Sumérgete en sus ruinas y déjate cautivar por la grandeza del pasado!', 'https://www.antequera.es/export/shared/.galleries/IMAGENES-Noticias/2023/03/mbaron_villaromana-27032023-6.jpg'),
(6, 2, 'Orquidario', 'Una parada obligatoria para los amantes de las plantas. Una infraestructura impresionante  donde se acoge a diferentes especies de orquídeas que harán que tu visita a Estepona sea inolvidable.', 'https://static.costadelsolmalaga.org/malaga/subidas/imagenes/0/2/arc_306720_g.jpg'),
(7, 2, 'Senda Litoral', 'Un sendero que no solo te permitirá recorrer la costa a pie o en bici, sino que además de las espectaculares vistas al mar que tiene, podrás disfrutar de valiosos espacios naturales.\r\n', 'https://turismo.estepona.es/wp-content/uploads/2020/05/2773_19-Punta-Plata-77.jpg'),
(8, 2, 'Murales', 'Si una actividad es icónica para este pueblo, además de su famoso tobogán, son los murales de diferentes artistas que lo decoran. Sumérgete en este recorrido para ver verdaderas pinceladas de arte. \r\n', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/84/cd/cf/fabulous-mural.jpg?w=1200&h=-1&s=1'),
(9, 2, 'Selwo Aventura', 'Si te gustan los animales este es tu sitio, haz un recorrido por las instalaciones donde podrás ver numerosas especies, además de tener diferentes actividades tales como tirolina o sus famosos puentes colgantes. \r\n', 'https://www.transfersandexperiences.com/blog/wp-content/uploads/2019/12/Selwo-Aventura.png'),
(10, 2, 'Mirador del Carmen', 'Que no os engañe el nombre, pues este mirador esconde mucho más, se trata de una gran zona cultural donde encontramos, una biblioteca, un conservatorio de música, un auditorio para eventos, una sala expositiva,  y por supuesto, una torre-mirador desde la que podrás disfrutar de unas impresionantes vistas de todo el pueblo y del mar Mediterraneo.\r\n', 'https://s2.abcstatics.com/abc/www/multimedia/espana/2023/03/30/mirador-carmen-paseo-RwF5JbxuztTbKzvEwnZ9VPO-1200x840@abc.jpg'),
(13, 5, 'Ruta de las brujas', 'Si vienes a Soportújar no puedes perderte su increíble ruta de las brujas que rodea el pueblo, encontrarás diferentes cuevas, fuentes, casas y figuras que te fascinarán.', 'https://lavidanoessolotrabajar.com/wp-content/uploads/2022/01/Soportujar-Granada-51.webp'),
(14, 5, 'Feria del embrujo', 'Durante la segunda semana de agosto, Soportújar te trasladará a un ambiente místico y festivo. Esta semana el municipio se llena de vida y da lugar a diferentes pasacalles, representaciones teatrales, conciertos, degustaciones y su famosa “Noche de las brujas” que te dejará boquiabierto.', 'https://i0.wp.com/lacosmopolilla.com/wp-content/uploads/2020/02/Ambiente-durante-la-Feria-del-Embrujo-en-Soport%C3%BAjar-e1582132827727.jpg?ssl=1'),
(15, 5, 'O Sel Ling', 'No todo iba a ser brujería, Soportújar cuenta con O Sel Ling, traducido como “lugar de luz clara”, un centro budista situado a 1600 metros de altitud dentro del municipio, ideal para aquellos que busquen un lugar tranquilo que invite a la meditación.', 'https://www.bungalowsclub.com/info/wp-content/uploads/2014/10/flickr-fuera-jesus-abizanda.jpg'),
(16, 6, 'Alcázar de la puerta de Sevilla', 'Si vienes a Carmona no te puedes perder esta imponente fortaleza medieval que ha sido testigo de siglos de historia y ofrece vistas panorámicas impresionantes del municipio y sus alrededores.', 'https://www.turismosevilla.org/sites/default/files/2023-02/Carmona_0.jpg'),
(17, 6, 'Iglesia de San Bartolomé', 'Magnífico ejemplo de la arquitectura mudéjar, destacada por su espléndido retablo barroco y su torre campanario que domina el paisaje urbano.', 'https://www.turismosevilla.org/sites/default/files/styles/grande_800x600_/public/2020-03/Carmona-Iglesia%20de%20San%20Bartolom%C3%A9%20%283%29.jpg?h=0f70274f&itok=_HOwl8g0'),
(18, 6, 'Museo de la ciudad', 'Ofrece una fascinante mirada a la rica historia y el patrimonio cultural de la ciudad, albergando valiosas colecciones arqueológicas y etnográficas.', 'https://www.turismosevilla.org/sites/default/files/2020-03/Carmona-Museo%20de%20la%20Ciudad%20de%20Carmona%20%281%29.jpg'),
(19, 6, 'Teatro cerezo', 'Emblemático espacio cultural de los años 30, que combina elegancia arquitectónica con una variada programación de artes escénicas.', 'https://www.turismosevilla.org/sites/default/files/2020-03/Carmona.Teatro%20Cerezo.jpg'),
(20, 7, 'Iglesia de San Mateo', 'Magnífico ejemplo del Renacimiento andaluz, destacada por su impresionante retablo mayor y su elegante arquitectura que domina el casco histórico de la ciudad.', 'https://backsubbetica.novacreative.es/images/items/CxDaBo3LP3z5ElX4lc9rr2znG2k3ijsSLrMiGUyG.jpg'),
(21, 7, 'Castillo del Moral', 'Adéntrate en esta fortaleza medieval que alberga el Museo Arqueológico y Etnológico.', 'https://www.artencordoba.com//fotos/blog-viejo/wp-content/uploads/2014/12/3585614147_0bff9d5683_z.jpg'),
(22, 7, 'Palacio de los condes de Santa Ana', 'Este palacio es una joya del barroco andaluz, conocido por su majestuosa arquitectura y sus exquisitos salones decorados con frescos y azulejos.', 'https://www.turismoyvino.es/wp-content/uploads/2017/01/Palacio-de-los-Condes-de-Santa-Ana%C2%A9Delegacio%CC%81n-de-Turismo-Excmo.-Ayuntamiento-de-Lucena.jpg'),
(23, 7, 'Museo Bodega El Alfolí', 'Este museo transportará a sus visitantes a través de la historia del vino en Andalucía, ofreciendo una experiencia única donde la tradición vitivinícola se encuentra con la innovación en un entorno encantador.', 'https://pbs.twimg.com/media/Db-I3XXXUAcpEVX.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pueblos`
--

CREATE TABLE `pueblos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `imagenes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`imagenes`)),
  `lat` decimal(10,8) NOT NULL,
  `lon` decimal(10,8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pueblos`
--

INSERT INTO `pueblos` (`id`, `nombre`, `descripcion`, `imagenes`, `lat`, `lon`) VALUES
(1, 'Antequera', 'Sumérgete en la rica historia de Antequera, una joya que se remonta a más de 6000 años atrás, cuando sus primeros habitantes dejaron su huella en esta tierra fértil. Su nombre evoca antiguas civilizaciones: Anticaria para los romanos, Antaquira en tiempos árabes, pero su legado trasciende épocas y culturas. El corazón arqueológico de Antequera late fuerte, con sus impresionantes dólmenes de Menga, Viera y El Romeral, que se alzan como guardianes silenciosos de un pasado misterioso. Pero la ciudad no se detiene en el pasado; sus calles empedradas y plazas soleadas están salpicadas de iglesias centenarias, conventos serenos y palacetes que narran historias de esplendor y tradición. Además de su fascinante legado humano, Antequera cautiva con su entorno natural sobrecogedor. El Torcal, un paraje de rocas calizas esculpidas por el viento y el tiempo, ofrece un espectáculo único en Europa. Sumérgete en este paisaje kárstico, donde la naturaleza parece haber esculpido caprichosas formas para deleitar a los visitantes. Ven y descubre Antequera, donde pasado y presente se entrelazan en un baile fascinante de cultura, historia y naturaleza. Un destino que te invita a perderte en sus callejuelas y a maravillarte con sus tesoros escondidos en cada esquina. ¡Te esperamos para vivir una experiencia inolvidable!', '[\n        \"https://static.costadelsolmalaga.org/visita/subidas/imagenes/0/3/arc_30430_g.jpg\",\n        \"https://cloud.inspain.org/imgwbp/sitios/4/9/5/5yy2j2xkfktfu5dtvdn3s3jmfy_2000.webp\",\n        \"https://www.revistaoxigeno.es/uploads/s1/82/64/08/2/torcal-2.jpeg\",\n        \"https://static.costadelsolmalaga.org/visita/subidas/imagenes/0/6/arc_25060_g.jpg\"\n    ]', 37.01940000, -4.56100000),
(2, 'Estepona', 'Adéntrate en los encantos de este pueblo costero que cada vez se hace más sonar. Desde hace un tiempo, Estepona ha pasado de ser un pueblo más de la provincia de Málaga a convertirse en uno de los pueblecitos costeros más demandados por el turismo. Si bien es cierto, que el turismo, la construcción y la oferta inmobiliaria han sido más latentes durante estos últimos años, no debemos olvidar que las viejas tradiciones siguen persistiendo, la pesca y la agricultura siguen sosteniendo una parte de la economía local. Este pueblo no solo es conocido por sus playas, para aquellos que prefieren disfrutar de la naturaleza en su mayor esplendor, Estepona cuenta con Sierra Bermeja, lugar donde su particular geoquímica contribuye decisivamente al mantenimiento de uno de los ecosistemas más singulares de Andalucía, el pinsapar. Estás son solo algunas de las características que hacen de Estepona un lugar con encanto, adéntrate por sus pintorescas calles y déjate sorprender por un pueblo que sin duda te hará querer volver.\r\n', '[\r\n        \"https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcRamBnSIzGI0CGaIhq9eYQjEzw6GTEYKP-ZstpaBIvyS-UWAT7nefBiTvaBJ2QNTim_QhexTMxXBpN0mngAWSxKLSGRVjZdaVfjLdJUwg\",\r\n        \"https://marinasdeandalucia.com/files/gallery/image/1511354671-puerto-deportivo-estepona-torre.jpg\",\r\n        \"https://www.villasfincas.com/wp-content/uploads/2013/10/n-chaplow-8-scaled.jpg\",\r\n        \"https://www.turismomarinero.com/wp-content/uploads/2015/06/casco-hist%C3%B3rico-de-Estepona-e1433428102568.jpg\"\r\n    ]\r\n', 36.43305600, -5.13305600),
(5, 'Soportújar', 'Soportújar o más bien conocido como “el pueblo de las brujas” es uno de los municipios que pertenece a la Alpujarra de Granada, sin embargo, este peculiar pueblecito destaca por su originalidad. Pero, ¿Por qué es considerado “el pueblo de las brujas” y sus habitantes son llamados “los brujos”? Esta historia se remonta a la Revolución de las Alpujarras que terminó con la expulsión de los moriscos del territorio, esto provocó, en la época de Felipe II, que hubiera que hacer una repoblación con nuevos habitantes, de los cuales la mayoría eran familias gallegas. Se dice que las nuevas familias del norte trajeron sus costumbres y leyendas paganas que hablaban de brujería. A raíz de esto, sus vecinos no tardaron en denominar a los habitantes de Soportújar, “brujos”. Adéntrate en los encantos de Soportújar y conoce toda la “magia” que rodea este pintoresco pueblo granadino, no te decepcionará.', '[\"https://lacasadebeorn.com/wp-content/uploads/2021/12/20180513_121745-1200.jpg\", \"https://imagenes.20minutos.es/files/image_1920_1080/uploads/imagenes/2022/02/24/soportujar.jpeg\", \"https://media.traveler.es/photos/63d25f28d4b484c3bc219eb3/3:2/w_1851,h_1234,c_limit/soportu%CC%81jar.jpg\", \"https://evasionrural.com/wp-content/uploads/2022/11/3ETY5SGSLFFDPFP5PT55Z3FTC4.jpg\"]', 36.93360000, -3.42120000),
(6, 'Carmona', 'Carmona, un encantador pueblo situado en el corazón de Andalucía, a solo 30 kilómetros de Sevilla. Con una historia que se remonta a más de 5.000 años, Carmona es un destino fascinante donde cada rincón cuenta una historia. Sus calles empedradas, monumentos imponentes y rica herencia cultural invitan a los visitantes a un viaje en el tiempo. Desde la majestuosa Necrópolis Romana hasta el impresionante Alcázar del Rey Don Pedro, Carmona es un lugar donde el pasado y el presente se encuentran, ofreciendo una experiencia inolvidable para todos los que la visitan. Ven y descubre por qué Carmona es conocida como uno de los tesoros más preciados de Andalucía.', '[\"https://conocersevilla.com/wp/wp-content/uploads/2020/06/Vista-panoramica-de-Carmona.jpg\", \"https://www.diariodesevilla.es/2019/09/25/provincia/Carmona-pueblos-bonitos-Espana_1394870678_110226756_667x375.jpg\", \"https://www.holyweekeurope.com/wp-content/uploads/2023/06/Alcazar-Puerta-de-Sevilla-3600x2400.jpg\", \"https://audioguidesapp.com/wp-content/uploads/2021/01/carmona.jpg\"]', 37.47130000, -5.64410000),
(7, 'Lucena', 'Descubre Lucena, una joya situada en la provincia de Córdoba, en pleno corazón de Andalucía. Conocida como la Perla de Sefarad, se destaca por su rico patrimonio histórico, su vibrante cultura y su cálida hospitalidad. Lucena ofrece a sus visitantes una experiencia única, con sus impresionantes monumentos, hermosas plazas y calles llenas de vida. Desde la majestuosa Parroquia de San Mateo hasta los vestigios de su pasado judío y musulmán, Lucena es un destino que captura el espíritu de Andalucía y promete una estancia inolvidable. Ven y explora Lucena, donde cada rincón te invita a un viaje a través del tiempo y la tradición.', '[\"https://backsubbetica.novacreative.es/images/municipios/aY1BxTj0xj24Mxck4C80K3wNnApbpG8brlC7ISSZ.jpg\", \"https://static.eldiario.es/clip/3b383fcd-3d97-41c0-a84b-fa61367b33fb_16-9-discover-aspect-ratio_default_0.jpg\", \"https://backsubbetica.novacreative.es/images/municipios/GvaJMjci6g5xrTDgpH6HO7BNQ8fxtdunp2q071LH.jpg\", \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2DUbcmiXRcXDb01DokBTwwiDxGLzUXHRFrMSQ92CfRbSJQzQboIrH7ZyaYypiyIMUmY8&usqp=CAU\"]', 37.40880000, -4.48500000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre_usuario` varchar(100) NOT NULL,
  `contrasena` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre_usuario`, `contrasena`) VALUES
(1, 'tupueblo@admin.com', '1234'),
(16, 'pepe', '$2y$10$m2Y7Z275QWxE94yCHtIISenJfwZw2DNtcuBVflXRZvSbQlH5bkBfm');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pueblo_id` (`pueblo_id`);

--
-- Indices de la tabla `pueblos`
--
ALTER TABLE `pueblos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividades`
--
ALTER TABLE `actividades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `pueblos`
--
ALTER TABLE `pueblos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD CONSTRAINT `actividades_ibfk_1` FOREIGN KEY (`pueblo_id`) REFERENCES `pueblos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
