DROP DATABASE IF EXISTS sapj_web;
CREATE DATABASE sapj_web CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE sapj_web;
-- ESPACIO DE DECLARACIÓN DE LAS TABLAS Y SUS COLUMNAS:
CREATE TABLE rol (
  id_rol INT PRIMARY KEY,
  nombre_rol VARCHAR(25) NOT NULL
);

CREATE TABLE academia (
  id_academia VARCHAR(10) PRIMARY KEY,
  nombre_academia VARCHAR(90) NOT NULL
);

CREATE TABLE usuarios (
  curp VARCHAR(18) PRIMARY KEY,
  numero_empleado INT NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  primer_ap VARCHAR(50) NOT NULL,
  segundo_ap VARCHAR(50),
  contraseña VARCHAR(200),
  id_rol INT NOT NULL,
  FOREIGN KEY (id_rol) REFERENCES rol(id_rol) ON UPDATE CASCADE ON DELETE CASCADE 
);


CREATE TABLE jefes_academia (
  curp_jef VARCHAR(18) PRIMARY KEY,
  id_academia VARCHAR(10) NOT NULL,
  FOREIGN KEY (curp_jef) REFERENCES usuarios(curp) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (id_academia) REFERENCES academia(id_academia) ON UPDATE CASCADE ON DELETE CASCADE
);

/*CREATE TABLE capital_humano (
  curp_ch VARCHAR(18) PRIMARY KEY,
  FOREIGN KEY (curp_ch) REFERENCES usuarios(curp) ON UPDATE CASCADE ON DELETE CASCADE
);*/

CREATE TABLE docentes (
  curp_docente VARCHAR(18) PRIMARY KEY,
  id_academia VARCHAR(10) NOT NULL,
  curp_jef VARCHAR(18) NOT NULL,
  FOREIGN KEY (curp_docente) REFERENCES usuarios(curp) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (curp_jef) REFERENCES jefes_academia(curp_jef) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (id_academia) REFERENCES academia(id_academia) ON UPDATE CASCADE ON DELETE CASCADE
);


-- AGREGAMOS ALGUNAS COLUMNAS:
ALTER TABLE usuarios ADD COLUMN link_pdf VARCHAR(255) DEFAULT NULL;
ALTER TABLE docentes ADD COLUMN permisos_anuales INT DEFAULT 10; 
ALTER TABLE jefes_academia ADD COLUMN permisos_anuales INT DEFAULT 10;


-- VERIFICAMOS QUE CADA TABLA SE HA CREADO CORRECTAMENTE
SHOW TABLES;
DESCRIBE rol;
DESCRIBE academia;
DESCRIBE usuarios;
DESCRIBE jefes_academia;
DESCRIBE docentes;

-- APARTADO DE INSERCIÓN DE DATOS:

-- TABLA rol
INSERT INTO rol(id_rol, nombre_rol)
VALUES (1, 'Administrador'), 
(2, 'Capital Humano'),
(3, 'Jefe Academia'),
(4, 'Docente');


-- TABLA academia
INSERT INTO academia (id_academia, nombre_academia) 
VALUES ('ACB','Academia de Ciencia Básicas'), 
('ACC','Academia de Ciencias de la Comunicación'), 
('ACS','Academia de Ciencias Sociales'), 
('AFSE','Academia de Fundamentos de Sistemas Electrónicos'), 
('AIS','Academia de Ingeniería de Software'), 
('APETD','Academia de Proyectos Estratégicos y Toma de Decisiones'), 
('ASDIG','Academia de Sistemas Digitales'), 
('ASDIS','Academia de Sistemas Distribuidos'), 
('ACD','Academia de Ciencia de Datos'), 
('AIA','Academia de Inteligencia Artificial');

-- TABLA usuarios
INSERT INTO usuarios(curp, numero_empleado, nombre, primer_ap, segundo_ap, contraseña, id_rol)
VALUES ('ADMINISTRADOR1', 1000, 'Administrador', ' ', ' ',  NULL, 1), -- id admin
('ADMINISTRADOR2', 1001,  'Equipo', ' ', ' ',  NULL, 1), -- id admin
('NNH648169LFXSMBTB', 2042, 'Fredericka', 'Daniel', 'Barlow', NULL, 3), -- id 3 es para jefes de area
('DGZ573367EIETJCHK', 2234, 'Roth', 'Weeks', 'Henderson', NULL, 3),
('JTO380628SVTVAQKJ', 2968, 'Steel', 'Vargas', 'Dillon', NULL, 3),
('SHX824210GNJSGXWY', 2335, 'Celeste', 'Wilkinson', 'Cotton', NULL, 3),
('YMP249172MRORWMWT', 2167, 'Neville', 'Fowler', 'Blackwell', NULL, 3),
('PQD313688KIHKVHFB', 2686, 'Upton', 'Prince', 'Phelps', NULL, 3),
('CJR625816GYWIKYXT', 2144, 'Allegra', 'Matthews', 'Atkinson', NULL, 3),
('SEJ587364QPOMISDH', 2734, 'Hakeem', 'Bradshaw', 'Leonard', NULL, 3),
('SAE778347CPYQVEEY', 2459, 'Roary', 'Tyson', 'Jacobs', NULL, 3),
('UJI322843BRLSXPUJ', 2797, 'Vaughan', 'Stevenson', 'Boone', NULL, 3),
('XTS538337FOSHGOWU', 2567, 'Cara', 'Bowen', 'French', NULL, 4), -- id 4 es para los docentes
('DMD958441ROCSYIUG', 2366, 'Kasper', 'Campbell', 'Houston', NULL, 4),
('AXO444791RQSMWPCT', 2366, 'Whoopi', 'Bonner', 'Burris', NULL, 4),
('QDJ313047AKLRIQBM', 2684, 'Bethany', 'Ewing', 'Robertson', NULL, 4),
('QDN622850LGYVUBTF', 2409, 'Elmo', 'Gill', 'Luna', NULL, 4),
('BCX917412LNUHPVSJ', 2720, 'Leigh', 'Knapp', 'Atkinson', NULL, 4),
('YSG118758TOQEJGDG', 2203, 'Cheyenne', 'Mclean', 'Dillon', NULL, 4),
('IMK616646MEOXVLDQ', 2032, 'Jacob', 'Anthony', 'Mckinney', NULL, 4),
('BAK556451SDNQTTFS', 2716, 'Damon', 'Sheppard', 'Wall', NULL, 4),
('NOT404728NHYEGRRY', 2237, 'Cheryl', 'Fitzgerald', 'Yang', NULL, 4),
('WNX564268PJWDWFDL', 2359, 'Audrey', 'Reed', 'Blackburn', NULL, 4),
('KMU036928XSMFSYLF', 2563, 'Melyssa', 'Duncan', 'Faulkner', NULL, 4),
('UCK398163HLRQGIAR', 2194, 'Gay', 'Finley', 'Burt', NULL, 4),
('LXE491474QRHGYURW', 2555, 'Raja', 'Woods', 'Callahan', NULL, 4),
('GQH055858MFWNFRNS', 2541, 'Portia', 'Kidd', 'Vang', NULL, 4),
('VRU899723OKVGKIJI', 2375, 'Maite', 'Pierce', 'Wagner', NULL, 4),
('CFV327284XDVXYTIN', 2729, 'Kristen', 'Robinson', 'Maxwell', NULL, 4),
('SMX288340HJGNRHGB', 2681, 'Isaiah', 'Hunter', 'Vinson', NULL, 4),
('NKR663254FCBEDQDO', 2687, 'Rylee', 'Valdez', 'Garcia', NULL, 4),
('FNT691485YEBQNGWX', 2050, 'Jillian', 'Mcleod', 'Chang', NULL, 4),
('WXU912368VIJCYZLV', 2955, 'Dana', 'Porter', 'Bauer', NULL, 4),
('MRN659174MPSMHQJO', 2006, 'Grant', 'Morton', 'Hays', NULL, 4),
('ODS186808KRNVGLCH', 2680, 'Rinah', 'Hurst', 'Manning', NULL, 4),
('SZC677005MPPQCYEN', 2038, 'Barclay', 'Henson', 'Hughes', NULL, 4),
('BNV906543HFTVONOS', 2528, 'Cooper', 'Clay', 'Montgomery', NULL, 4),
('XQI182143MVNMGNEW', 2777, 'Talon', 'Valencia', 'Frazier', NULL, 4),
('RDS682338XATGMTRB', 2547, 'Elmo', 'Martinez', 'Dodson', NULL, 4),
('EJK320307OYLDRFSM', 2511, 'Ivory', 'Cain', 'Holder', NULL, 4),
('YWK612803HEAVSSMP', 2914, 'Meghan', 'Nunez', 'Collins', NULL, 4),
('NTV733464DJPIBBKE', 2381, 'Byron', 'Kim', 'Klein', NULL, 4),
('KAF378491RMEFQAZW', 2147, 'Amity', 'Hutchinson', 'O\'brien', NULL, 4),
('GNE093791LBBOQEAQ', 2924, 'Eugenia', 'Lane', 'Beach', NULL, 4),
('UNX602243XGQLNTTE', 2680, 'Tana', 'French', 'Jimenez', NULL, 4),
('WUK257446UDJFYEKD', 2343, 'Deborah', 'Glover', 'Donovan', NULL, 4),
('XHN180027NXVRIRWS', 2847, 'Kenneth', 'Hodges', 'Hensley', NULL, 4),
('VNP267089JCPELICP', 2274, 'Dominic', 'Cannon', 'Weeks', NULL, 4),
('ESJ612790PQUTSTUD', 2205, 'Anastasia', 'Glenn', 'Daugherty', NULL, 4),
('RCL613026GZCGWGIA', 2122, 'Malik', 'Neal', 'Landry', NULL, 4),
('BII333626KHVFLIME', 2975, 'Michael', 'Crosby', 'Lara', NULL, 4),
('PLU576741BMDQQVCP', 2591, 'Cain', 'Porter', 'Boyd', NULL, 4),
('DOU344174FXEVULSS', 2583, 'Giacomo', 'Simmons', 'Gates', NULL, 4),
('HJU562874DPGOCFJS', 2398, 'Yvette', 'Peterson', 'George', NULL, 4),
('EOY359637HKCGFTPY', 2462, 'Ashely', 'Jackson', 'Glenn', NULL, 4),
('GYH424225VKSLSLLH', 2879, 'Asher', 'Coffey', 'Fischer', NULL, 4),
('USB315032PBIFFGVE', 2078, 'Tatum', 'Rasmussen', 'Silva', NULL, 4),
('TJH518517UQVULBKS', 2642, 'Isadora', 'Valenzuela', 'Lara', NULL, 4),
('FUJ488187PLQTFMWN', 2131, 'Jesse', 'Kaufman', 'Hutchinson', NULL, 4),
('BKJ310134ALTPFHLG', 2874, 'Minerva', 'Murray', 'Hunter', NULL, 4),
('DDQ673335SNTYIOPC', 2710, 'Aretha', 'Schroeder', 'Irwin', NULL, 4),
('WRI513031IWLQROLD', 2160, 'Clark', 'Winters', 'Whitfield', NULL, 4);

-- TABLA jefes
-- INSERT INTO jefes (numero_empleado, curp_jef, nombre, primer_ap, segundo_ap, id_academia) 
-- VALUES
-- (2042, 'NNH648169LFXSMBTB', 'Fredericka', 'Daniel', 'Barlow', 'ACB'),
-- (2234, 'DGZ573367EIETJCHK', 'Roth', 'Weeks', 'Henderson', 'ACC'),
-- (2968, 'JTO380628SVTVAQKJ', 'Steel', 'Vargas', 'Dillon', 'ACS'),
-- (2335, 'SHX824210GNJSGXWY', 'Celeste', 'Wilkinson', 'Cotton', 'AFSE'),
-- (2167, 'YMP249172MRORWMWT', 'Neville', 'Fowler', 'Blackwell', 'AIS'),
-- (2686, 'PQD313688KIHKVHFB', 'Upton', 'Prince', 'Phelps', 'APETD'),
-- (2144, 'CJR625816GYWIKYXT', 'Allegra', 'Matthews', 'Atkinson', 'ASDIG'),
-- (2734, 'SEJ587364QPOMISDH', 'Hakeem', 'Bradshaw', 'Leonard', 'ASDIS'),
-- (2459, 'SAE778347CPYQVEEY', 'Roary', 'Tyson', 'Jacobs', 'ACD'),
-- (2797, 'UJI322843BRLSXPUJ', 'Vaughan', 'Stevenson', 'Boone', 'AIA');

-- TABLA jefes_academia
INSERT INTO jefes_academia (curp_jef, id_academia) 
VALUES
('NNH648169LFXSMBTB', 'ACB'),
('DGZ573367EIETJCHK', 'ACC'),
('JTO380628SVTVAQKJ', 'ACS'),
('SHX824210GNJSGXWY', 'AFSE'),
('YMP249172MRORWMWT', 'AIS'),
('PQD313688KIHKVHFB', 'APETD'),
('CJR625816GYWIKYXT', 'ASDIG'),
('SEJ587364QPOMISDH', 'ASDIS'),
('SAE778347CPYQVEEY', 'ACD'),
('UJI322843BRLSXPUJ', 'AIA');




-- TABLA docentes
INSERT INTO docentes (curp_docente, id_academia, curp_jef)
VALUES
('XTS538337FOSHGOWU', 'ACB', 'NNH648169LFXSMBTB'),
('DMD958441ROCSYIUG', 'ACC', 'DGZ573367EIETJCHK'),
('AXO444791RQSMWPCT', 'ACS', 'JTO380628SVTVAQKJ'),
('QDJ313047AKLRIQBM', 'AFSE', 'SHX824210GNJSGXWY'),
('QDN622850LGYVUBTF', 'AIS', 'YMP249172MRORWMWT'),
('BCX917412LNUHPVSJ', 'APETD', 'PQD313688KIHKVHFB'),
('YSG118758TOQEJGDG', 'ASDIG', 'CJR625816GYWIKYXT'),
('IMK616646MEOXVLDQ', 'ASDIS', 'SEJ587364QPOMISDH'),
('BAK556451SDNQTTFS', 'ACD', 'SAE778347CPYQVEEY'),
('NOT404728NHYEGRRY', 'AIA', 'UJI322843BRLSXPUJ'),
('WNX564268PJWDWFDL', 'ACB', 'NNH648169LFXSMBTB'),
('KMU036928XSMFSYLF', 'ACC', 'DGZ573367EIETJCHK'),
('UCK398163HLRQGIAR', 'ACS', 'JTO380628SVTVAQKJ'),
('LXE491474QRHGYURW', 'AFSE', 'SHX824210GNJSGXWY'),
('GQH055858MFWNFRNS', 'AIS', 'YMP249172MRORWMWT'),
('VRU899723OKVGKIJI', 'APETD', 'PQD313688KIHKVHFB'),
('CFV327284XDVXYTIN', 'ASDIG', 'CJR625816GYWIKYXT'),
('SMX288340HJGNRHGB', 'ASDIS', 'SEJ587364QPOMISDH'),
('NKR663254FCBEDQDO', 'ACD', 'SAE778347CPYQVEEY'),
('FNT691485YEBQNGWX', 'AIA', 'UJI322843BRLSXPUJ'),
('WXU912368VIJCYZLV', 'ACB', 'NNH648169LFXSMBTB'),
('MRN659174MPSMHQJO', 'ACC', 'DGZ573367EIETJCHK'),
('ODS186808KRNVGLCH', 'ACS', 'JTO380628SVTVAQKJ'),
('SZC677005MPPQCYEN', 'AFSE', 'SHX824210GNJSGXWY'),
('BNV906543HFTVONOS', 'AIS', 'YMP249172MRORWMWT'),
('XQI182143MVNMGNEW', 'APETD', 'PQD313688KIHKVHFB'),
('RDS682338XATGMTRB', 'ASDIG', 'CJR625816GYWIKYXT'),
('EJK320307OYLDRFSM', 'ASDIS', 'SEJ587364QPOMISDH'),
('YWK612803HEAVSSMP', 'ACD', 'SAE778347CPYQVEEY'),
('NTV733464DJPIBBKE', 'AIA', 'UJI322843BRLSXPUJ'),
('KAF378491RMEFQAZW', 'ACB', 'NNH648169LFXSMBTB'),
('GNE093791LBBOQEAQ', 'ACC', 'DGZ573367EIETJCHK'),
('UNX602243XGQLNTTE', 'ACS', 'JTO380628SVTVAQKJ'),
('WUK257446UDJFYEKD', 'AFSE', 'SHX824210GNJSGXWY'),
('XHN180027NXVRIRWS', 'AIS', 'YMP249172MRORWMWT'),
('VNP267089JCPELICP', 'APETD', 'PQD313688KIHKVHFB'),
('ESJ612790PQUTSTUD', 'ASDIG', 'CJR625816GYWIKYXT'),
('RCL613026GZCGWGIA', 'ASDIS', 'SEJ587364QPOMISDH'),
('BII333626KHVFLIME', 'ACD', 'SAE778347CPYQVEEY'),
('PLU576741BMDQQVCP', 'AIA', 'UJI322843BRLSXPUJ'),
('DOU344174FXEVULSS', 'ACB', 'NNH648169LFXSMBTB'),
('HJU562874DPGOCFJS', 'ACC', 'DGZ573367EIETJCHK'),
('EOY359637HKCGFTPY', 'ACS', 'JTO380628SVTVAQKJ'),
('GYH424225VKSLSLLH', 'AFSE', 'SHX824210GNJSGXWY'),
('USB315032PBIFFGVE', 'AIS', 'YMP249172MRORWMWT'),
('TJH518517UQVULBKS', 'APETD', 'PQD313688KIHKVHFB'),
('FUJ488187PLQTFMWN', 'ASDIG', 'CJR625816GYWIKYXT'),
('BKJ310134ALTPFHLG', 'ASDIS', 'SEJ587364QPOMISDH'),
('DDQ673335SNTYIOPC', 'ACD', 'SAE778347CPYQVEEY'),
('WRI513031IWLQROLD', 'AIA', 'UJI322843BRLSXPUJ');




-- ESPACIO PARA COMPROBAR QUE YA SE HAN CREADO CON TODOS LOS DATOS CORRECTOS CADA UNA DE LAS TABLAS:
SELECT * FROM rol;
SELECT * FROM academia;
SELECT * FROM usuarios;
/*SELECT * FROM capital_humano;*/
SELECT * FROM jefes_academia;
SELECT * FROM docentes;


-- APARTADO DE CONSULTAS (SI SE REQUIEREN HACER MÁS PRUEBAS)

-- CONSULTAMOS PARA VER SI LAS TABLAS ESTAN RELACIONADAS CORRECTAMENTE 
SELECT nombre as "NOMBRE", curp as "CURP" FROM usuarios u
INNER JOIN docentes d ON u.curp = d.curp_docente;

-- CONTAMOS LOS PROFESORES QUE HAY POR ACADEMIA
SELECT a.nombre_academia as "NOMBRE ACADEMIA", count(d.curp_docente) as "NÚMERO DE PROFESORES" FROM docentes d
INNER JOIN academia a ON a.id_academia = d.id_academia GROUP BY a.nombre_academia;



-- APARTADO DE ACTUALIZACIONES:
-- hacemos una prueba de actualizar datos 
UPDATE usuarios
SET link_pdf = 'https://example.com/memorandum/docente1.pdf'
WHERE curp = 'ADMINISTRADOR1';

-- revisamos como quedo
SELECT * FROM usuarios;

-- INSERTAMOS USUARIOS CON EL ROL DE CAPITAL HUMANO
INSERT INTO usuarios(curp, numero_empleado, nombre, primer_ap, segundo_ap, contraseña, id_rol)
VALUES 
('CURP123456HGTYSD1', 3001, 'Sofía', 'López', 'Martínez', NULL, 2), 
('CURP987654KJHGFDS2', 3002, 'Andrés', 'Hernández', 'García', NULL, 2),
('CURP456789HGFRTES3', 3003, 'Camila', 'Torres', 'Pérez', NULL, 2);

SELECT * FROM usuarios;
SELECT * FROM docentes;
SELECT * FROM jefes_academia;

-- CREAMOS UNA TABLA LLAMADA PETICIONES Y TIPO DE PETICIÓN
-- CREAMOS UNA TABLA PARA DEFINIR LAS ETAPAS DEL TRÁMITE
CREATE TABLE etapas (
    id_etapa INT PRIMARY KEY AUTO_INCREMENT,
    nombre_etapa VARCHAR(30) NOT NULL
);

-- CREAMOS UNA TABLA PARA DEFINIR LOS TIPOS DE TRÁMITES
CREATE TABLE tramite (
    id_tramite INT PRIMARY KEY AUTO_INCREMENT,
    nombre_tramite VARCHAR(100) NOT NULL
);

-- INSERTAMOS DATOS DE PRUEBA EN LAS TABLAS DE ETAPAS Y TRÁMITES
INSERT INTO etapas(nombre_etapa) 
VALUES ('Enviado para revisión.'),
       ('Pendiente.'),
       ('Aprobado por Jefe Academia.'),
       ('Rechazado por Jefe Academia.'),
       ('Aprobado por Capital Humano.'),
       ('Rechazado por Capital Humano.');

INSERT INTO tramite(nombre_tramite)
VALUES ('Pago de tiempo adicional'),
       ('Día económico'),
       ('Permiso especial');

-- CREAMOS UNA TABLA PARA LAS PETICIONES
CREATE TABLE peticiones (
    id_peticion INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único de la petición
    curp_peticion VARCHAR(18) NOT NULL,         -- Usuario que hace la petición
    rol_origen INT NOT NULL,                    -- Rol del usuario que hace la petición
    rol_destino INT NOT NULL,                   -- Rol del destinatario de la petición
    id_tramite INT NOT NULL,                    -- Tipo de trámite
    link_pdf VARCHAR(255) NOT NULL,            -- Archivo relacionado con la petición
    id_etapa INT NOT NULL DEFAULT 1,           -- Etapa inicial de la petición
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha de creación de la petición
    FOREIGN KEY (curp_peticion) REFERENCES usuarios(curp) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (rol_origen) REFERENCES rol(id_rol) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (rol_destino) REFERENCES rol(id_rol) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_tramite) REFERENCES tramite(id_tramite) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_etapa) REFERENCES etapas(id_etapa) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO peticiones(curp_peticion, rol_origen, rol_destino, id_tramite, link_pdf, id_etapa)
VALUES 
('CURP123456HGTYSD1', 4, 3, 1, 'https://example.com/document1.pdf', 1),
('CURP987654KJHGFDS2', 4, 3, 2, 'https://example.com/document2.pdf', 1),
('CURP456789HGFRTES3', 4, 3, 3, 'https://example.com/document3.pdf', 2);


-- realizamos pruebas:
UPDATE peticiones
SET rol_origen = 4, rol_destino=3
WHERE curp_peticion = 'CURP123456HGTYSD1' or curp_peticion = 'CURP987654KJHGFDS2' or curp_peticion = 'CURP456789HGFRTES3';


SELECT * FROM peticiones;

ALTER TABLE usuarios ADD COLUMN avatar VARCHAR(255) DEFAULT NULL;

SELECT * FROM usuarios;

INSERT INTO usuarios (curp, numero_empleado, nombre, primer_ap, segundo_ap, id_rol, avatar)
VALUES('1', 2, 'Rata', 'Raton', 'Ramirez', 2, 'asadas');

SELECT COUNT(curp) AS 'NO. EMPLEADOS' FROM usuarios;


