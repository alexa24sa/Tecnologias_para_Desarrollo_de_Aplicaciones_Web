DROP DATABASE IF EXISTS sapj_web;
CREATE DATABASE sapj_web CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE sapj_web;
-- ESPACIO DE DECLARACIÓN DE LAS TABLAS Y SUS COLUMNAS:
CREATE TABLE academias
(
  id_academia VARCHAR(10) NOT NULL,
  nombre_academia VARCHAR(200) NOT NULL,
  PRIMARY KEY (id_academia)
);

CREATE TABLE jefes
(
  numero_empleado INT NOT NULL,
  curp_jef VARCHAR(18) NOT NULL,
  nombre VARCHAR(25) NOT NULL,
  primer_ap VARCHAR(25) NOT NULL,
  segundo_ap VARCHAR(25) NOT NULL,
  id_academia VARCHAR(10) NOT NULL,
  PRIMARY KEY (curp_jef),
  FOREIGN KEY (id_academia) REFERENCES academias(id_academia) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE jefes_academia
(
  academia VARCHAR(10) NOT NULL,
  curp VARCHAR(18) NOT NULL,
  PRIMARY KEY (academia, curp),
  FOREIGN KEY (curp) REFERENCES jefes(curp_jef)
);

CREATE TABLE docentes
(
  numero_empleado INT NOT NULL,
  nombre VARCHAR(25) NOT NULL,
  primer_ap VARCHAR(25) NOT NULL,
  segundo_ap VARCHAR(25) NOT NULL,
  curp VARCHAR(18) NOT NULL,
  id_academia VARCHAR(10) NOT NULL,
  curp_jef VARCHAR(18) NOT NULL,
  PRIMARY KEY (curp),
  FOREIGN KEY (id_academia) REFERENCES academias(id_academia) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (curp_jef) REFERENCES jefes(curp_jef) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE docentes_academia
(
  academia VARCHAR(200) NOT NULL,
  curp VARCHAR(18) NOT NULL,
  PRIMARY KEY (academia, curp),
  FOREIGN KEY (curp) REFERENCES docentes(curp) ON UPDATE CASCADE ON DELETE CASCADE
);


-- VERIFICAMOS QUE CADA TABLA SE HA CREADO CORRECTAMENTE
SHOW TABLES;
DESCRIBE academias;
DESCRIBE docentes;
DESCRIBE docentes_academia;
DESCRIBE jefes;
DESCRIBE jefes_academia;

-- APARTADO DE INSERCIÓN DE DATOS:

-- TABLA academias
INSERT INTO academias (id_academia, nombre_academia) 
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


-- TABLA jefes
INSERT INTO jefes (numero_empleado, curp_jef, nombre, primer_ap, segundo_ap, id_academia) 
VALUES
(2042, 'NNH648169LFXSMBTB', 'Fredericka', 'Daniel', 'Barlow', 'ACB'),
(2234, 'DGZ573367EIETJCHK', 'Roth', 'Weeks', 'Henderson', 'ACC'),
(2968, 'JTO380628SVTVAQKJ', 'Steel', 'Vargas', 'Dillon', 'ACS'),
(2335, 'SHX824210GNJSGXWY', 'Celeste', 'Wilkinson', 'Cotton', 'AFSE'),
(2167, 'YMP249172MRORWMWT', 'Neville', 'Fowler', 'Blackwell', 'AIS'),
(2686, 'PQD313688KIHKVHFB', 'Upton', 'Prince', 'Phelps', 'APETD'),
(2144, 'CJR625816GYWIKYXT', 'Allegra', 'Matthews', 'Atkinson', 'ASDIG'),
(2734, 'SEJ587364QPOMISDH', 'Hakeem', 'Bradshaw', 'Leonard', 'ASDIS'),
(2459, 'SAE778347CPYQVEEY', 'Roary', 'Tyson', 'Jacobs', 'ACD'),
(2797, 'UJI322843BRLSXPUJ', 'Vaughan', 'Stevenson', 'Boone', 'AIA');

-- TABLA jefes_academia
INSERT INTO jefes_academia (academia, curp) 
VALUES
('ACB', 'NNH648169LFXSMBTB'),
('ACC', 'DGZ573367EIETJCHK'),
('ACS', 'JTO380628SVTVAQKJ'),
('AFSE', 'SHX824210GNJSGXWY'),
('AIS', 'YMP249172MRORWMWT'),
('APETD', 'PQD313688KIHKVHFB'),
('ASDIG', 'CJR625816GYWIKYXT'),
('ASDIS', 'SEJ587364QPOMISDH'),
('ACD', 'SAE778347CPYQVEEY'),
('AIA', 'UJI322843BRLSXPUJ');

-- TABLA docentes

INSERT INTO docentes (numero_empleado, nombre, primer_ap, segundo_ap, curp, id_academia, curp_jef) 
VALUES 
(2567, 'Cara', 'Bowen', 'French', 'XTS538337FOSHGOWU', 'ACB', 'NNH648169LFXSMBTB'),
(2366, 'Kasper', 'Campbell', 'Houston', 'DMD958441ROCSYIUG', 'ACC', 'DGZ573367EIETJCHK'),
(2366, 'Whoopi', 'Bonner', 'Burris', 'AXO444791RQSMWPCT', 'ACS', 'JTO380628SVTVAQKJ'),
(2684, 'Bethany', 'Ewing', 'Robertson', 'QDJ313047AKLRIQBM', 'AFSE', 'SHX824210GNJSGXWY'),
(2409, 'Elmo', 'Gill', 'Luna', 'QDN622850LGYVUBTF', 'AIS', 'YMP249172MRORWMWT'),
(2720, 'Leigh', 'Knapp', 'Atkinson', 'BCX917412LNUHPVSJ', 'APETD', 'PQD313688KIHKVHFB'),
(2203, 'Cheyenne', 'Mclean', 'Dillon', 'YSG118758TOQEJGDG', 'ASDIG', 'CJR625816GYWIKYXT'),
(2032, 'Jacob', 'Anthony', 'Mckinney', 'IMK616646MEOXVLDQ', 'ASDIS', 'SEJ587364QPOMISDH'),
(2716, 'Damon', 'Sheppard', 'Wall', 'BAK556451SDNQTTFS', 'ACD', 'SAE778347CPYQVEEY'),
(2237, 'Cheryl', 'Fitzgerald', 'Yang', 'NOT404728NHYEGRRY', 'AIA', 'UJI322843BRLSXPUJ'),
(2359, 'Audrey', 'Reed', 'Blackburn', 'WNX564268PJWDWFDL', 'ACB', 'NNH648169LFXSMBTB'),
(2563, 'Melyssa', 'Duncan', 'Faulkner', 'KMU036928XSMFSYLF', 'ACC', 'DGZ573367EIETJCHK'),
(2194, 'Gay', 'Finley', 'Burt', 'UCK398163HLRQGIAR', 'ACS', 'JTO380628SVTVAQKJ'),
(2555, 'Raja', 'Woods', 'Callahan', 'LXE491474QRHGYURW', 'AFSE', 'SHX824210GNJSGXWY'),
(2541, 'Portia', 'Kidd', 'Vang', 'GQH055858MFWNFRNS', 'AIS', 'YMP249172MRORWMWT'),
(2375, 'Maite', 'Pierce', 'Wagner', 'VRU899723OKVGKIJI', 'APETD', 'PQD313688KIHKVHFB'),
(2729, 'Kristen', 'Robinson', 'Maxwell', 'CFV327284XDVXYTIN', 'ASDIG', 'CJR625816GYWIKYXT'),
(2681, 'Isaiah', 'Hunter', 'Vinson', 'SMX288340HJGNRHGB', 'ASDIS', 'SEJ587364QPOMISDH'),
(2687, 'Rylee', 'Valdez', 'Garcia', 'NKR663254FCBEDQDO', 'ACD', 'SAE778347CPYQVEEY'),
(2050, 'Jillian', 'Mcleod', 'Chang', 'FNT691485YEBQNGWX', 'AIA', 'UJI322843BRLSXPUJ'),
(2955, 'Dana', 'Porter', 'Bauer', 'WXU912368VIJCYZLV', 'ACB', 'NNH648169LFXSMBTB'),
(2006, 'Grant', 'Morton', 'Hays', 'MRN659174MPSMHQJO', 'ACC', 'DGZ573367EIETJCHK'),
(2680, 'Rinah', 'Hurst', 'Manning', 'ODS186808KRNVGLCH', 'ACS', 'JTO380628SVTVAQKJ'),
(2038, 'Barclay', 'Henson', 'Hughes', 'SZC677005MPPQCYEN', 'AFSE', 'SHX824210GNJSGXWY'),
(2528, 'Cooper', 'Clay', 'Montgomery', 'BNV906543HFTVONOS', 'AIS', 'YMP249172MRORWMWT'),
(2777, 'Talon', 'Valencia', 'Frazier', 'XQI182143MVNMGNEW', 'APETD', 'PQD313688KIHKVHFB'),
(2547, 'Elmo', 'Martinez', 'Dodson', 'RDS682338XATGMTRB', 'ASDIG', 'CJR625816GYWIKYXT'),
(2511, 'Ivory', 'Cain', 'Holder', 'EJK320307OYLDRFSM', 'ASDIS', 'SEJ587364QPOMISDH'),
(2914, 'Meghan', 'Nunez', 'Collins', 'YWK612803HEAVSSMP', 'ACD', 'SAE778347CPYQVEEY'),
(2381, 'Byron', 'Kim', 'Klein', 'NTV733464DJPIBBKE', 'AIA', 'UJI322843BRLSXPUJ'),
(2147, 'Amity', 'Hutchinson', 'O\'brien', 'KAF378491RMEFQAZW', 'ACB', 'NNH648169LFXSMBTB'),
(2924, 'Eugenia', 'Lane', 'Beach', 'GNE093791LBBOQEAQ', 'ACC', 'DGZ573367EIETJCHK'),
(2680, 'Tana', 'French', 'Jimenez', 'UNX602243XGQLNTTE', 'ACS', 'JTO380628SVTVAQKJ'),
(2343, 'Deborah', 'Glover', 'Donovan', 'WUK257446UDJFYEKD', 'AFSE', 'SHX824210GNJSGXWY'),
(2847, 'Kenneth', 'Hodges', 'Hensley', 'XHN180027NXVRIRWS', 'AIS', 'YMP249172MRORWMWT'),
(2274, 'Dominic', 'Cannon', 'Weeks', 'VNP267089JCPELICP', 'APETD', 'PQD313688KIHKVHFB'),
(2205, 'Anastasia', 'Glenn', 'Daugherty', 'ESJ612790PQUTSTUD', 'ASDIG', 'CJR625816GYWIKYXT'),
(2122, 'Malik', 'Neal', 'Landry', 'RCL613026GZCGWGIA', 'ASDIS', 'SEJ587364QPOMISDH'),
(2975, 'Michael', 'Crosby', 'Lara', 'BII333626KHVFLIME', 'ACD', 'SAE778347CPYQVEEY'),
(2591, 'Cain', 'Porter', 'Boyd', 'PLU576741BMDQQVCP', 'AIA', 'UJI322843BRLSXPUJ'),
(2583, 'Giacomo', 'Simmons', 'Gates', 'DOU344174FXEVULSS', 'ACB', 'NNH648169LFXSMBTB'),
(2398, 'Yvette', 'Peterson', 'George', 'HJU562874DPGOCFJS', 'ACC', 'DGZ573367EIETJCHK'),
(2462, 'Ashely', 'Jackson', 'Glenn', 'EOY359637HKCGFTPY', 'ACS', 'JTO380628SVTVAQKJ'),
(2879, 'Asher', 'Coffey', 'Fischer', 'GYH424225VKSLSLLH', 'AFSE', 'SHX824210GNJSGXWY'),
(2078, 'Tatum', 'Rasmussen', 'Silva', 'USB315032PBIFFGVE', 'AIS', 'YMP249172MRORWMWT'),
(2642, 'Isadora', 'Valenzuela', 'Lara', 'TJH518517UQVULBKS', 'APETD', 'PQD313688KIHKVHFB'),
(2131, 'Jesse', 'Kaufman', 'Hutchinson', 'FUJ488187PLQTFMWN', 'ASDIG', 'CJR625816GYWIKYXT'),
(2874, 'Minerva', 'Murray', 'Hunter', 'BKJ310134ALTPFHLG', 'ASDIS', 'SEJ587364QPOMISDH'),
(2710, 'Aretha', 'Schroeder', 'Irwin', 'DDQ673335SNTYIOPC', 'ACD', 'SAE778347CPYQVEEY'),
(2160, 'Clark', 'Winters', 'Whitfield', 'WRI513031IWLQROLD', 'AIA', 'UJI322843BRLSXPUJ');

-- TABLA docentes_academia:
INSERT INTO docentes_academia (academia, curp)
VALUES
('ACB', 'XTS538337FOSHGOWU'),
('ACC', 'DMD958441ROCSYIUG'),
('ACS', 'AXO444791RQSMWPCT'),
('AFSE', 'QDJ313047AKLRIQBM'),
('AIS', 'QDN622850LGYVUBTF'),
('APETD', 'BCX917412LNUHPVSJ'),
('ASDIG', 'YSG118758TOQEJGDG'),
('ASDIS', 'IMK616646MEOXVLDQ'),
('ACD', 'BAK556451SDNQTTFS'),
('AIA', 'NOT404728NHYEGRRY'),
('ACB', 'WNX564268PJWDWFDL'),
('ACC', 'KMU036928XSMFSYLF'),
('ACS', 'UCK398163HLRQGIAR'),
('AFSE', 'LXE491474QRHGYURW'),
('AIS', 'GQH055858MFWNFRNS'),
('APETD', 'VRU899723OKVGKIJI'),
('ASDIG', 'CFV327284XDVXYTIN'),
('ASDIS', 'SMX288340HJGNRHGB'),
('ACD', 'NKR663254FCBEDQDO'),
('AIA', 'FNT691485YEBQNGWX'),
('ACB', 'WXU912368VIJCYZLV'),
('ACC', 'MRN659174MPSMHQJO'),
('ACS', 'ODS186808KRNVGLCH'),
('AFSE', 'SZC677005MPPQCYEN'),
('AIS', 'BNV906543HFTVONOS'),
('APETD', 'XQI182143MVNMGNEW'),
('ASDIG', 'RDS682338XATGMTRB'),
('ASDIS', 'EJK320307OYLDRFSM'),
('ACD', 'YWK612803HEAVSSMP'),
('AIA', 'NTV733464DJPIBBKE'),
('ACB', 'KAF378491RMEFQAZW'),
('ACC', 'GNE093791LBBOQEAQ'),
('ACS', 'UNX602243XGQLNTTE'),
('AFSE', 'WUK257446UDJFYEKD'),
('AIS', 'XHN180027NXVRIRWS'),
('APETD', 'VNP267089JCPELICP'),
('ASDIG', 'ESJ612790PQUTSTUD'),
('ASDIS', 'RCL613026GZCGWGIA'),
('ACD', 'BII333626KHVFLIME'),
('AIA', 'PLU576741BMDQQVCP'),
('ACB', 'DOU344174FXEVULSS'),
('ACC', 'HJU562874DPGOCFJS'),
('ACS', 'EOY359637HKCGFTPY'),
('AFSE', 'GYH424225VKSLSLLH'),
('AIS', 'USB315032PBIFFGVE'),
('APETD', 'TJH518517UQVULBKS'),
('ASDIG', 'FUJ488187PLQTFMWN'),
('ASDIS', 'BKJ310134ALTPFHLG'),
('ACD', 'DDQ673335SNTYIOPC'),
('AIA', 'WRI513031IWLQROLD');

-- ESPACIO PARA COMPROBAR QUE YA SE HAN CREADO CON TODOS LOS DATOS CORRECTOS CADA UNA DE LAS TABLAS:
SELECT * FROM academias;
SELECT * FROM docentes;
SELECT * FROM docentes_academia;
SELECT * FROM jefes;
SELECT * FROM jefes_academia;


-- APARTADO DE CONSULTAS (SI SE REQUIEREN HACER MÁS PRUEBAS)