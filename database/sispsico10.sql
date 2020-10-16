-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 16-10-2020 a las 03:56:39
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `sispsico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE IF NOT EXISTS `alumno` (
  `codalumno` varchar(10) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `paterno` varchar(100) DEFAULT NULL,
  `materno` varchar(100) NOT NULL,
  `escuela` varchar(150) DEFAULT NULL,
  `aula` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `telefono` int(9) NOT NULL,
  `fechanac` date NOT NULL,
  `sexo` char(10) NOT NULL,
  PRIMARY KEY (`codalumno`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`codalumno`, `nombre`, `paterno`, `materno`, `escuela`, `aula`, `correo`, `direccion`, `telefono`, `fechanac`, `sexo`) VALUES
('123123', 'Josecito', 'Armedas', 'Salcra', 'Ing.Sistemas', '505', 'josefatubebesitamasna@gamil.co', '2322 urb HUacho ', 9654612, '2020-10-01', 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `l-escala`
--

CREATE TABLE IF NOT EXISTS `l-escala` (
  `idEscala` int(11) NOT NULL AUTO_INCREMENT,
  `NombreEscala` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idEscala`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `l-escala`
--

INSERT INTO `l-escala` (`idEscala`, `NombreEscala`) VALUES
(1, 'ACTITUD'),
(2, 'MOTIVACION'),
(3, 'ADMINISTRACION DEL TIEMPO'),
(4, 'ANSIEDAD'),
(5, 'CONCENTRACION'),
(6, 'PROCESAMIENTO DE INFORMACION'),
(7, 'SELECCION DE IDEAS PRINCIPALES'),
(8, 'AYUDAS PARA EL ESTUDIO'),
(9, 'AUTOEVALUACION'),
(10, 'ESTRATEGIAS PARA EL EXAMEN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `l-pregunta`
--

CREATE TABLE IF NOT EXISTS `l-pregunta` (
  `idPregunta` int(11) NOT NULL AUTO_INCREMENT,
  `EstadoPregunta` varchar(20) DEFAULT NULL,
  `idEscala` int(11) NOT NULL,
  `ContPregunta` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idPregunta`),
  KEY `RefL-ESCALA14` (`idEscala`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=78 ;

--
-- Volcado de datos para la tabla `l-pregunta`
--

INSERT INTO `l-pregunta` (`idPregunta`, `EstadoPregunta`, `idEscala`, `ContPregunta`) VALUES
(1, 'NN', 1, 'Pienso que casarme es más importante que terminar la carrera.'),
(2, 'NN', 1, 'Estoy confundido/a, no sé qué quiero conseguir estudiando.'),
(3, 'NN', 1, 'Sería mejor que no estudiara.'),
(4, 'NN', 1, 'Tengo la sensación de tener poco control sobre mis estudios.'),
(5, 'NN', 1, 'Me interesa poco tener cultura general, solo deseo conseguir un buen trabajo.'),
(6, 'NN', 1, 'Solo estudio las materias que me gustan.'),
(7, 'NN', 1, 'Me desagradan la mayoría de las actividades que se hacen en clase.'),
(8, 'NN', 1, 'Creo que no vale la pena estudiar lo que se enseña en la mayoría de las clases.'),
(9, 'N', 2, 'Estoy al día con mis estudios.'),
(10, 'N', 2, 'Aun cuando lo que tenga que estudiar sea aburrido, me las arreglo para seguir trabajando hasta terminar.'),
(11, 'NN', 2, 'Voy a las clases sin haber estudiado o leído.'),
(12, 'N', 2, 'Me esfuerzo en obtener buenas notas aunque no me guste la materia.'),
(13, 'NN', 2, 'Cuando no estudio, trato de buscar excusas.'),
(14, 'N', 2, 'Estudiando, trato de alcanzar metas altas.'),
(15, 'NN', 2, 'Cuando la tarea es difícil, la abandono o sólo hago partes fáciles'),
(16, 'N', 2, 'Leo los textos que me dan en las clases.'),
(17, 'NN', 3, 'Me resulta difícil ajustarme a un plan de estudio.'),
(18, 'NN', 3, 'Solamente estudio cuando tengo un examen.'),
(19, 'NN', 3, 'Cuando me pongo a estudiar, las demoras y las interrupciones me causan problemas.'),
(20, 'NN', 3, 'En casi todos los exámenes, me falta tiempo para terminarlos.'),
(21, 'NN', 3, 'Uso bien las horas que dedico a estudiar.'),
(22, 'N', 3, 'Cuando decido estudiar, dispongo de un tiempo determinado y me ajusto a él.'),
(23, 'NN', 3, 'Dejo de lado el estudio más de lo debido.'),
(24, 'NN', 3, 'Paso demasiado tiempo con amigos y ello afecta a mis estudios.'),
(25, 'NN', 4, 'Me preocupa salir jalado en un examen.'),
(26, 'NN', 4, 'Una mala ya me desanima.'),
(27, 'NN', 4, 'Cuando estudio me pongo muy tenso/a.'),
(28, 'NN', 4, 'Aunque esté muy bien preparado/a, me siento ansioso/a al dar un examen.'),
(29, 'N', 4, 'Cuando comienzo a rendir un examen, confío en que me irá bien.'),
(30, 'NN', 4, 'La preocupación porque me pueda ir mal, dificulta mi concentración al dar un examen.'),
(31, 'NN', 4, 'Siento pánico cuando tengo que dar examen importante.'),
(32, 'N', 4, 'Me pongo tan nervioso/a al dar un examen que al contestar las preguntas no lo hago con todas mis capacidades.'),
(33, 'NN', 5, 'Durante las clases pienso en otras cosas, no presto atención.'),
(34, 'NN', 5, 'Problemas ajenos a mis estudios (afectivos, laborales) me impiden estudiar bien.'),
(35, 'NN', 5, 'Me resulta imposible concentrarme cuando estoy de mal humor o me falta descanso.'),
(36, 'NN', 5, 'Me es difícil prestar atención durante las clases.'),
(37, 'NN', 5, 'Me distraigo de mis estudios con mucha facilidad.'),
(38, 'NN', 5, 'Me cuesta entender ciertos temas porque no presto atención.'),
(39, 'N', 5, 'Cuando me pongo a estudiar, me concentro totalmente.'),
(40, 'NN', 5, 'Mi mente divaga mucho cuando trato de estudiar.'),
(41, 'N', 6, 'Al ponerme a estudiar algo, pienso en lo que debería saber sobre el tema.'),
(42, 'N', 6, 'Comprendo mejo las ideas o palabras si imagino una situación real en la que se dan.'),
(43, 'N', 6, 'Trato de decir con mis propias palabras lo que estoy estudiando.'),
(44, 'N', 6, 'Cuando estoy estudiando un tema, trato de entenderlo en su totalidad.'),
(45, 'N', 6, 'Trato de relacionar lo que estoy estudiando con lo que ya sé.'),
(46, 'N', 6, 'Trato de relacionar lo que estudio con mis experiencias personales.'),
(47, 'N', 6, 'Trato de ver de qué manera podría aplicar lo que estoy estudiando en mi vida cotidiana.'),
(48, 'N', 6, 'Trato de buscar relaciones entre los distintos temas que estoy estudiando.'),
(49, 'N', 7, 'Durante una clase, puedo distinguir entre una información importante y otra poco importante.'),
(50, 'N', 7, 'Trato de identificar los temas principales de la clase que se está dando.'),
(51, 'NN', 7, 'Me resulta difícil decidir qué es lo importante a subrayar en un texto.'),
(52, 'NN', 7, 'Cuando estudio, me pierdo en detalles y no encuentro las ideas centrales.'),
(53, 'NN', 7, 'Tengo dificultades para identificar los puntos importantes en lo que leo'),
(54, 'N', 8, 'Utilizo los títulos y letras en cursiva que figuran en los libros como ayuda en mis estudios.'),
(55, 'N', 8, 'Me es útil subrayar cuando releo los textos.'),
(56, 'N', 8, 'Comparo mis apuntes con los de otros compañeros para asegurarme de que están completos.'),
(57, 'N', 8, 'Cuando leo, señalo de alguna manera las partes que me interesan.'),
(58, 'N', 8, 'Hago croquis o dibujos que me ayudan a entender lo que estudio.'),
(59, 'N', 8, 'Hago esquemas o gráficos para resumir los contenidos de una materia.'),
(60, 'N', 8, 'Uso los títulos de los capítulos como guías para identificar puntos importantes de lo que estoy leyendo.'),
(61, 'N', 8, 'Cuando es posible, me encuentro con compañeros para repasar en grupo.'),
(62, 'N', 9, 'Después de clase releo mis apuntes para comprender mejor la información.'),
(63, 'N', 9, 'Cuando me preparo para un examen, invento preguntas que imagino me formularán'),
(64, 'N', 9, 'Trato de imaginar preguntas de los exámenes al releer el material de las clases.'),
(65, 'N', 9, 'Releo mis apuntes antes de ir a la clase siguiente.'),
(66, 'N', 9, 'Me detengo periódicamente a leer y reviso mentalmente si entendí lo que leí.'),
(67, 'N', 9, 'Trato de verificar si comprendo lo que el profesor dice durante las clases.'),
(68, 'N', 9, 'Me tomo examen a mí mismo/a para estar seguro/a de que conozco el material que estudié.'),
(69, 'N', 9, 'Mientras reviso los materiales de una clase, voy haciendo las tareas asignadas.'),
(70, 'NN', 10, 'Me va mal en las pruebas porque me es difícil organizar un trabajo en poco tiempo.'),
(71, 'NN', 10, 'Estoy poco capacitado/a para resumir lo que leo o escucho.'),
(72, 'NN', 10, 'Me cuesta trabajo imaginar qué tengo que hacer para aprender el material, cuando estoy estudiando.'),
(73, 'NN', 10, 'Tengo dificultades para comprender las preguntas de los exámenes.'),
(74, 'NN', 10, 'Al dar un examen, me doy cuenta de que estudie un tema equivocado.'),
(75, 'NN', 10, 'Memorizo reglas, términos técnicos y fórmulas sin entenderlos.'),
(76, 'NN', 10, 'Tengo dificultades para adecuar mi forma de estudiar a las distintas materias.'),
(77, 'NN', 10, 'En los exámenes escritos descubro que no entendí lo que me preguntan y debido a ello saco bajas notas.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `l-pregunta-resultado`
--

CREATE TABLE IF NOT EXISTS `l-pregunta-resultado` (
  `idPreguntaResult` int(11) NOT NULL AUTO_INCREMENT,
  `Alternativa` int(11) NOT NULL,
  `idPregunta` int(11) DEFAULT NULL,
  `idDetalleTest` int(11) NOT NULL,
  PRIMARY KEY (`idPreguntaResult`),
  KEY `RefL-PREGUNTA17` (`idPregunta`),
  KEY `RefL-TEST-DETALLE20` (`idDetalleTest`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=309 ;

--
-- Volcado de datos para la tabla `l-pregunta-resultado`
--

INSERT INTO `l-pregunta-resultado` (`idPreguntaResult`, `Alternativa`, `idPregunta`, `idDetalleTest`) VALUES
(232, 4, 1, 3),
(233, 4, 2, 3),
(234, 4, 3, 3),
(235, 4, 4, 3),
(236, 4, 5, 3),
(237, 4, 6, 3),
(238, 4, 7, 3),
(239, 4, 8, 3),
(240, 4, 9, 3),
(241, 4, 10, 3),
(242, 4, 11, 3),
(243, 4, 12, 3),
(244, 4, 13, 3),
(245, 4, 14, 3),
(246, 4, 15, 3),
(247, 4, 16, 3),
(248, 4, 17, 3),
(249, 4, 18, 3),
(250, 4, 19, 3),
(251, 4, 20, 3),
(252, 4, 21, 3),
(253, 4, 22, 3),
(254, 4, 23, 3),
(255, 4, 24, 3),
(256, 4, 25, 3),
(257, 4, 26, 3),
(258, 4, 27, 3),
(259, 4, 28, 3),
(260, 4, 29, 3),
(261, 4, 30, 3),
(262, 4, 31, 3),
(263, 4, 32, 3),
(264, 4, 33, 3),
(265, 4, 34, 3),
(266, 4, 35, 3),
(267, 4, 36, 3),
(268, 4, 37, 3),
(269, 4, 38, 3),
(270, 4, 39, 3),
(271, 4, 40, 3),
(272, 4, 41, 3),
(273, 4, 42, 3),
(274, 4, 43, 3),
(275, 4, 44, 3),
(276, 4, 45, 3),
(277, 4, 46, 3),
(278, 4, 47, 3),
(279, 4, 48, 3),
(280, 4, 49, 3),
(281, 4, 50, 3),
(282, 4, 51, 3),
(283, 4, 52, 3),
(284, 4, 53, 3),
(285, 4, 54, 3),
(286, 4, 55, 3),
(287, 4, 56, 3),
(288, 4, 57, 3),
(289, 4, 58, 3),
(290, 4, 59, 3),
(291, 4, 60, 3),
(292, 4, 61, 3),
(293, 4, 62, 3),
(294, 4, 63, 3),
(295, 4, 64, 3),
(296, 4, 65, 3),
(297, 4, 66, 3),
(298, 4, 67, 3),
(299, 4, 68, 3),
(300, 4, 69, 3),
(301, 4, 70, 3),
(302, 4, 71, 3),
(303, 4, 72, 3),
(304, 4, 73, 3),
(305, 4, 74, 3),
(306, 4, 75, 3),
(307, 4, 76, 3),
(308, 4, 77, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `l-resultado-escala`
--

CREATE TABLE IF NOT EXISTS `l-resultado-escala` (
  `idResultadoEscala` int(11) NOT NULL AUTO_INCREMENT,
  `totalResultado` int(11) NOT NULL,
  `idDetalleTest` int(11) NOT NULL,
  `idEscala` int(11) NOT NULL,
  PRIMARY KEY (`idResultadoEscala`),
  KEY `RefL-TEST-DETALLE25` (`idDetalleTest`),
  KEY `RefL-ESCALA26` (`idEscala`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `l-test`
--

CREATE TABLE IF NOT EXISTS `l-test` (
  `idTest` int(11) NOT NULL AUTO_INCREMENT,
  `EstadoTest` varchar(15) DEFAULT NULL,
  `RestriccionTest` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idTest`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `l-test`
--

INSERT INTO `l-test` (`idTest`, `EstadoTest`, `RestriccionTest`) VALUES
(3, 'Habilitado', 'General');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `l-test-detalle`
--

CREATE TABLE IF NOT EXISTS `l-test-detalle` (
  `idDetalleTest` int(11) NOT NULL AUTO_INCREMENT,
  `FechaRealizada` datetime DEFAULT NULL,
  `Estado` varchar(30) DEFAULT NULL,
  `codusuario` varchar(10) NOT NULL,
  `idTest` int(11) NOT NULL,
  PRIMARY KEY (`idDetalleTest`),
  KEY `RefUSUARIO7` (`codusuario`),
  KEY `RefL-TEST23` (`idTest`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `l-test-detalle`
--

INSERT INTO `l-test-detalle` (`idDetalleTest`, `FechaRealizada`, `Estado`, `codusuario`, `idTest`) VALUES
(3, '2020-10-15 00:00:00', 'deshabilitado', '123123', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `l-tipo_usuario`
--

CREATE TABLE IF NOT EXISTS `l-tipo_usuario` (
  `idTipoUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nameTipoUsuario` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idTipoUsuario`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `l-tipo_usuario`
--

INSERT INTO `l-tipo_usuario` (`idTipoUsuario`, `nameTipoUsuario`) VALUES
(1, 'Alumno'),
(2, 'Profesor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `codusuario` varchar(10) NOT NULL,
  `password` varchar(40) NOT NULL,
  `idTipoUsuario` int(11) NOT NULL,
  PRIMARY KEY (`codusuario`),
  KEY `RefL-TIPO_USUARIO2` (`idTipoUsuario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`codusuario`, `password`, `idTipoUsuario`) VALUES
('123123', '321312', 1),
('111111', '123123', 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
