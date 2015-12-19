-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2015 at 06:58 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `vatsav`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `online_status` datetime DEFAULT NULL,
  `last_active` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=104 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `password`, `email`, `first_name`, `last_name`, `phone`, `gender`, `online_status`, `last_active`) VALUES
(1, 'rama', 'rama', 'ramkey.sam@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'rama1', 'rama', 'ramkey1.sam@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'rama12', 'rama', 'aa', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'QTD47TYB0XJ', 'CKY53KFK5JD', 'turpis.Nulla.aliquet@euismodetcommodo.edu', 'Salvador', 'Lambert', 2147483647, 'Female', NULL, NULL),
(5, 'OAZ44KRK2KM', 'QMV85QEG3RU', 'mi@magnaSuspendisse.co.uk', 'Amos', 'Oneil', 2147483647, 'Male', NULL, NULL),
(6, 'VAJ21YXL6GV', 'UIV28NFY5GV', 'quis.tristique@tincidunt.edu', 'Kiara', 'Contreras', 2147483647, 'Female', NULL, NULL),
(7, 'NBX26LGV0JD', 'TCK09DER1VJ', 'nulla.ante.iaculis@etlaciniavitae.co.uk', 'Tanner', 'Wall', 2147483647, 'Female', NULL, NULL),
(8, 'KJP87PVM1IE', 'ALT15ODJ7UQ', 'mollis.Duis@nuncnullavulputate.com', 'Wade', 'Kim', 2147483647, 'Female', NULL, NULL),
(9, 'ZRI71XPP2BC', 'JDZ98UUE3QP', 'diam.eu.dolor@euelit.net', 'Madeson', 'Sanders', 2147483647, 'Female', NULL, NULL),
(10, 'GHX95QNA3TW', 'KMA09LXE5LO', 'dolor.elit.pellentesque@est.ca', 'Emerald', 'Kent', 2147483647, 'Male', NULL, NULL),
(11, 'KKR82THJ4BL', 'AYL94VRM3DN', 'primis.in.faucibus@metuseu.co.uk', 'Marvin', 'Mcclain', 2147483647, 'Male', NULL, NULL),
(12, 'MAB65MTA9IV', 'XHU18UCP7OE', 'a.dui@feugiatnec.net', 'Rashad', 'Schroeder', 2147483647, 'Male', NULL, NULL),
(13, 'KTO53CFM5CM', 'KBO94YSU7PK', 'ornare.elit@egestas.net', 'Patience', 'Mccarty', 2147483647, 'Female', NULL, NULL),
(14, 'DVK72QYX9XM', 'AFF81VVS6RW', 'tincidunt@mollisduiin.org', 'Shelby', 'Moss', 2147483647, 'Male', NULL, NULL),
(15, 'EIZ48HFX7EH', 'XLO81BWH5XD', 'sapien@fringillamilacinia.edu', 'Oprah', 'Salazar', 2147483647, 'Male', NULL, NULL),
(16, 'LTV20QWI9GI', 'RAM92XBE5EF', 'Quisque.varius.Nam@odiosagittis.edu', 'Tatiana', 'Santana', 2147483647, 'Female', NULL, NULL),
(17, 'YIF01KFK5CS', 'MAP17PWK9PW', 'elit.Nulla.facilisi@mus.net', 'Erich', 'Mccarty', 2147483647, 'Male', NULL, NULL),
(18, 'EUK42OVA2JI', 'GAJ04KFX0HH', 'augue@velpede.edu', 'Nigel', 'Weber', 2147483647, 'Male', NULL, NULL),
(19, 'ITN00JCY3WE', 'TAK52FWU9HE', 'Aliquam@netus.edu', 'Mariko', 'Nieves', 2147483647, 'Female', NULL, NULL),
(20, 'ZWL86APF3GJ', 'DXY19AGU5YM', 'lorem@Namconsequatdolor.com', 'Kevin', 'Noel', 2147483647, 'Male', NULL, NULL),
(21, 'IMP86QVQ3EF', 'JKU99RYI6HU', 'Sed.neque@egestasblanditNam.com', 'Eagan', 'Hartman', 2147483647, 'Male', NULL, NULL),
(22, 'NBU97ZOI2KR', 'YJN04JUD0BS', 'dignissim.magna.a@vehiculaaliquet.co.uk', 'Felix', 'Griffin', 2147483647, 'Male', NULL, NULL),
(23, 'FVT09RFY7IN', 'BMY54EWB8NM', 'In@feugiat.ca', 'Taylor', 'Mcintosh', 2147483647, 'Female', NULL, NULL),
(24, 'AGM78CPB9NK', 'TFO95OQB9QT', 'Donec.porttitor.tellus@anteMaecenas.net', 'Constance', 'Vazquez', 2147483647, 'Male', NULL, NULL),
(25, 'DZE75NFE9OV', 'UHE73IPC6NV', 'aliquet@nisinibhlacinia.co.uk', 'Amir', 'Madden', 2147483647, 'Female', NULL, NULL),
(26, 'AWV49SDX5LJ', 'GOZ44PQW1LG', 'amet.dapibus@natoquepenatibus.org', 'Addison', 'Massey', 2147483647, 'Female', NULL, NULL),
(27, 'AGK28CHB2NM', 'YQH73UFM9XS', 'Nullam.ut.nisi@cursus.org', 'Kadeem', 'Fuentes', 2147483647, 'Female', NULL, NULL),
(28, 'YYX25QTU7PW', 'SGG74MLD6LA', 'Ut@Maecenaslibero.ca', 'Emma', 'Delgado', 2147483647, 'Female', NULL, NULL),
(29, 'VTY46JRD2PY', 'TXQ80LEV5KB', 'accumsan.neque@feugiatnon.co.uk', 'Hayfa', 'Callahan', 2147483647, 'Male', NULL, NULL),
(30, 'PEC11FSX3UJ', 'DHM31CVP3DZ', 'et.nunc@egetmollislectus.com', 'Geoffrey', 'Rasmussen', 2147483647, 'Female', NULL, NULL),
(31, 'PDH22QMD7JS', 'YUX62XXM0WA', 'eu.accumsan.sed@magnis.edu', 'Perry', 'Frye', 2147483647, 'Female', NULL, NULL),
(32, 'RJD98HHH3LU', 'CFK61ISD0JW', 'erat.eget.ipsum@eu.com', 'Aurora', 'Spencer', 2147483647, 'Male', NULL, NULL),
(33, 'AEK09SCM7GK', 'TZJ13LJI2RV', 'in.tempus.eu@velit.org', 'Mona', 'Wilkinson', 2147483647, 'Female', NULL, NULL),
(34, 'OWQ28OMQ1HC', 'UGT37VQN5ES', 'massa@Vivamuseuismod.com', 'Lawrence', 'Ortega', 2147483647, 'Female', NULL, NULL),
(35, 'ZKH89RWD4EQ', 'VXV18MNR0TH', 'vel.convallis@Donec.com', 'Armando', 'Shaw', 2147483647, 'Male', NULL, NULL),
(36, 'LFL21THK1TA', 'ZUK86XWJ2WS', 'semper.rutrum@luctus.ca', 'Lysandra', 'Frye', 2147483647, 'Male', NULL, NULL),
(37, 'HRF78PIQ3HG', 'YKD27SKU2XE', 'eget.varius@maurisSuspendisse.org', 'Stewart', 'Hester', 2147483647, 'Female', NULL, NULL),
(38, 'TCB77CVV0HN', 'LSZ55VCM1PZ', 'adipiscing.lobortis.risus@Seddiam.co.uk', 'Nayda', 'Hooper', 2147483647, 'Female', NULL, NULL),
(39, 'INN37GBP0OA', 'MIL58IHW9MT', 'tellus@Donec.edu', 'Bevis', 'Vega', 2147483647, 'Female', NULL, NULL),
(40, 'PIJ70OJF8LU', 'OMH70JWI6LE', 'urna.Vivamus@eueratsemper.edu', 'Michael', 'Fuller', 2147483647, 'Male', NULL, NULL),
(41, 'OJR17NJR6EJ', 'YJQ26XUS8JC', 'vel@iaculisquis.edu', 'Willa', 'Carney', 2147483647, 'Male', NULL, NULL),
(42, 'VRU61VUW4CP', 'JXW86KAR3IV', 'eu.odio.tristique@etipsum.com', 'Macy', 'Chavez', 2147483647, 'Male', NULL, NULL),
(43, 'PRN15DBE7HJ', 'ARP60FKY6RS', 'a@nuncsed.edu', 'Vincent', 'Guerrero', 2147483647, 'Male', NULL, NULL),
(44, 'TCE51HQR8AU', 'RVW48OVT8EU', 'egestas.hendrerit.neque@aneque.edu', 'Quon', 'Carroll', 2147483647, 'Female', NULL, NULL),
(45, 'HJD85WTN1QZ', 'RRT02EQN7XQ', 'sit@Nulla.ca', 'Zenia', 'Santana', 2147483647, 'Male', NULL, NULL),
(46, 'USL76RDE4GK', 'MFN08OGB3OM', 'mi.fringilla@dictummi.co.uk', 'Jessica', 'Moore', 2147483647, 'Female', NULL, NULL),
(47, 'EIF52UJC2TW', 'FAC92SMP6SV', 'aliquet.sem@magnaDuisdignissim.ca', 'Regina', 'Collins', 2147483647, 'Female', NULL, NULL),
(48, 'JPB48XRJ7RT', 'DZX22LMG5UN', 'mi.Duis@arcu.edu', 'Alea', 'Brown', 2147483647, 'Female', NULL, NULL),
(49, 'WIP99HOV6BU', 'EFY73CCR9YD', 'nisl@egetdictumplacerat.net', 'Althea', 'Ball', 2147483647, 'Female', NULL, NULL),
(50, 'WYB63LEW2BW', 'PZU56BPT5JA', 'orci.luctus.et@ullamcorperDuis.co.uk', 'Lenore', 'Sullivan', 2147483647, 'Male', NULL, NULL),
(51, 'NHH80KVK9JU', 'CNN61YAI1GA', 'Integer@massaQuisqueporttitor.org', 'Elvis', 'Gonzales', 2147483647, 'Male', NULL, NULL),
(52, 'IJF28BNM1QV', 'ZGE28ESN7NM', 'Nam.consequat.dolor@ut.ca', 'Chandler', 'Mack', 2147483647, 'Male', NULL, NULL),
(53, 'HJC84WUR7IJ', 'EVK20MOW2BV', 'ornare.Fusce.mollis@erat.com', 'Dustin', 'Roth', 2147483647, 'Male', NULL, NULL),
(54, 'AAR31BBP9WY', 'YJA23QJC6BA', 'Praesent@euismodac.net', 'Keely', 'Mays', 2147483647, 'Male', NULL, NULL),
(55, 'TAE31GNY9TS', 'UDJ56ROI7VR', 'Nullam.vitae.diam@sit.net', 'Vernon', 'Thornton', 2147483647, 'Male', NULL, NULL),
(56, 'YRE25HNV9BG', 'UXW33MLT1JN', 'vel.pede.blandit@dictumultriciesligula.co.uk', 'Signe', 'Carney', 2147483647, 'Male', NULL, NULL),
(57, 'VQG74ZCP7LG', 'OXQ88LBG5OI', 'nec@vulputateullamcorper.org', 'Josiah', 'Mann', 2147483647, 'Female', NULL, NULL),
(58, 'GTZ90ZHH2PD', 'TXI61LVQ4VU', 'Curabitur@idblanditat.ca', 'Luke', 'Pena', 2147483647, 'Female', NULL, NULL),
(59, 'PGD27KOI5RV', 'QZH01LHK8WI', 'Aenean.massa@ante.co.uk', 'Britanni', 'Olsen', 2147483647, 'Male', NULL, NULL),
(60, 'WNO54ZLX7XA', 'EKT98KYQ6VN', 'et.commodo.at@lacus.com', 'Xandra', 'Daniel', 2147483647, 'Male', NULL, NULL),
(61, 'QTQ89DWE7SQ', 'ZHH77YSU7EY', 'Vestibulum.accumsan@turpis.org', 'Karyn', 'Mcconnell', 2147483647, 'Female', NULL, NULL),
(62, 'ZPV53NRU3GM', 'PTH57CLM1HY', 'montes.nascetur@Inornaresagittis.ca', 'Eric', 'House', 2147483647, 'Female', NULL, NULL),
(63, 'MNL79EYN9MX', 'RXS31OBZ3EE', 'in.dolor.Fusce@telluslorem.com', 'Wayne', 'Crosby', 2147483647, 'Female', NULL, NULL),
(64, 'LZC14CWO0OU', 'KAN09WHD2HM', 'ac@massaQuisque.com', 'Kiona', 'Stone', 2147483647, 'Male', NULL, NULL),
(65, 'PQL85HMU9XS', 'OVB79RRH3PZ', 'eros.non.enim@loremDonecelementum.co.uk', 'Inez', 'Aguirre', 2147483647, 'Female', NULL, NULL),
(66, 'EVF46GNO6QH', 'YBE70NZB7FG', 'tortor.Integer.aliquam@duiCras.org', 'Jocelyn', 'Bennett', 2147483647, 'Female', NULL, NULL),
(67, 'GNK78GBN8GQ', 'QIM60OXK4KT', 'ultrices@massalobortis.net', 'Adena', 'Stafford', 2147483647, 'Male', NULL, NULL),
(68, 'KMC71IHH0HD', 'ABI10OPW8PN', 'dignissim@nonummyipsumnon.edu', 'Zelenia', 'Nelson', 2147483647, 'Male', NULL, NULL),
(69, 'GDR75OIZ5CH', 'OJY02USZ2GW', 'blandit.at.nisi@diamvel.com', 'Madonna', 'Jimenez', 2147483647, 'Male', NULL, NULL),
(70, 'JTS73DUI2VD', 'PBC34DLB2UE', 'eleifend.non.dapibus@auctor.net', 'Myra', 'Peterson', 2147483647, 'Male', NULL, NULL),
(71, 'KIN00WYV9WG', 'QVJ68WWZ3NR', 'leo.Morbi@Aliquam.co.uk', 'Rudyard', 'Livingston', 2147483647, 'Male', NULL, NULL),
(72, 'ZDX81VAH9IU', 'TTK14DDO0DE', 'libero@purusDuis.ca', 'Laura', 'Holt', 2147483647, 'Female', NULL, NULL),
(73, 'RXR99CXI2QT', 'GVT38SFC4UG', 'ultrices.a.auctor@esttemporbibendum.net', 'Desiree', 'Snyder', 2147483647, 'Male', NULL, NULL),
(74, 'UGN16YMR4PI', 'KNM64CQD0HR', 'Aliquam.nec.enim@lectus.co.uk', 'Reagan', 'Walker', 2147483647, 'Female', NULL, NULL),
(75, 'MEN39OYA1FC', 'IEA98TRA9VV', 'amet@semperauctorMauris.co.uk', 'Candice', 'Wallace', 2147483647, 'Female', NULL, NULL),
(76, 'DHT46CYN1PL', 'ZBQ86TDD4PV', 'dolor.nonummy@Pellentesquehabitantmorbi.edu', 'Minerva', 'Sosa', 2147483647, 'Female', NULL, NULL),
(77, 'OKP98AEU2HO', 'HAE54ONY9VB', 'pede@Phasellus.com', 'Leslie', 'Dickerson', 2147483647, 'Male', NULL, NULL),
(78, 'ORR75XGN6UO', 'JNS62LNI6MM', 'quis.pede@elit.co.uk', 'Fulton', 'Fernandez', 2147483647, 'Male', NULL, NULL),
(79, 'BFI62IEB7WT', 'TFE31PMJ6MA', 'ipsum.Donec@Curabiturut.net', 'Phelan', 'Anthony', 2147483647, 'Female', NULL, NULL),
(80, 'FVV53CGT1OB', 'KYL42QKO9MH', 'nulla.Integer.urna@eunibh.org', 'Richard', 'Henry', 2147483647, 'Female', NULL, NULL),
(81, 'HIQ94UIQ5AN', 'YLE73ROH6GE', 'nisi.Aenean.eget@felis.com', 'Kimberley', 'Vance', 2147483647, 'Female', NULL, NULL),
(82, 'CHC92CDT8LO', 'EPB21ZAB8HZ', 'Proin@odio.com', 'Briar', 'Church', 2147483647, 'Female', NULL, NULL),
(83, 'FYZ51EYX7LZ', 'GAU11SGA2NE', 'quis@massanonante.co.uk', 'Zane', 'Combs', 2147483647, 'Female', NULL, NULL),
(84, 'YVD84PRP6WF', 'SEG78JRD1IV', 'In.nec.orci@urnaet.edu', 'Nell', 'Bishop', 2147483647, 'Male', NULL, NULL),
(85, 'NVH27LFS3RD', 'MBV00MLW9ML', 'vel.vulputate.eu@aclibero.org', 'Brendan', 'Eaton', 2147483647, 'Male', NULL, NULL),
(86, 'VHA60OWA4PL', 'MHH75KCB3FA', 'molestie.sodales@vitaeposuere.edu', 'Ethan', 'William', 2147483647, 'Male', NULL, NULL),
(87, 'WWB62BTS5SJ', 'AJY95PGE9OP', 'quam.elementum@Aenean.edu', 'Alma', 'Delacruz', 2147483647, 'Male', NULL, NULL),
(88, 'VBA58EIY5IC', 'PNM16LTA6BN', 'lobortis.risus@erat.org', 'Myra', 'Herring', 2147483647, 'Male', NULL, NULL),
(89, 'RSC68BFP9AU', 'SMP81XCL3OM', 'Integer.in.magna@magnisdis.net', 'Charissa', 'Holder', 2147483647, 'Female', NULL, NULL),
(90, 'LNZ96JQN9GA', 'UYO22XSX0GA', 'pellentesque.massa.lobortis@accumsanneque.edu', 'Sade', 'Calderon', 2147483647, 'Male', NULL, NULL),
(91, 'DLC81EIY7IG', 'BXN21MBV9OB', 'Integer.in.magna@In.ca', 'Ingrid', 'Hayes', 2147483647, 'Male', NULL, NULL),
(92, 'OYH51KOF6ZO', 'PWO77BQS1ML', 'mi@sit.edu', 'Julian', 'Mcmahon', 2147483647, 'Male', NULL, NULL),
(93, 'GUF22PAA1QY', 'YVQ12JFF3ST', 'Nunc.sollicitudin@tortoratrisus.org', 'Chava', 'Newman', 2147483647, 'Male', NULL, NULL),
(94, 'IJQ50NZJ8BP', 'ODP31BCM1GY', 'magna.Phasellus@fermentum.org', 'Alden', 'Mckenzie', 2147483647, 'Female', NULL, NULL),
(95, 'SUF95WBV1MF', 'BXZ94UIH5AA', 'tellus@accumsan.edu', 'Denton', 'Kennedy', 2147483647, 'Female', NULL, NULL),
(96, 'XQF50IIJ7BN', 'SVI92CUZ6XN', 'Nam.nulla.magna@velarcueu.com', 'Martina', 'Castillo', 2147483647, 'Female', NULL, NULL),
(97, 'LCM54ATB0OW', 'BUM03ZYX8OB', 'bibendum.Donec@estcongue.net', 'Isadora', 'Carrillo', 2147483647, 'Male', NULL, NULL),
(98, 'EJE95RFS4DH', 'GVY00NFJ2FT', 'sem@risus.com', 'Jackson', 'Hughes', 2147483647, 'Female', NULL, NULL),
(99, 'OAI97CWF1JI', 'FIX41IRW4KV', 'neque@morbi.edu', 'Tucker', 'Macias', 2147483647, 'Female', NULL, NULL),
(100, 'WHB18NXT3TW', 'URP16BYZ5BS', 'orci@estNuncullamcorper.edu', 'Denton', 'Bartlett', 2147483647, 'Female', NULL, NULL),
(101, 'TZE84GRM1EA', 'NIG47TOQ9IF', 'felis@CuraePhasellus.co.uk', 'Armando', 'Harrison', 2147483647, 'Female', NULL, NULL),
(102, 'ROV00DBO7FE', 'ECM89ELE6JZ', 'eros@ametnullaDonec.net', 'Kameko', 'Gray', 2147483647, 'Female', NULL, NULL),
(103, 'FFM40GGF7ZV', 'SXB70HBT5PM', 'hendrerit.id.ante@luctussitamet.net', 'Clio', 'Clements', 2147483647, 'Male', NULL, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
