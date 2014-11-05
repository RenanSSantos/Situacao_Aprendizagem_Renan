-- -----------------------------------------------------
-- Data for table `sitap`.`usuario`
-- -----------------------------------------------------
START TRANSACTION;
USE `sitap`;
INSERT INTO `sitap`.`usuario` (`idusuario`, `nome`, `email`, `senha`, `sexo`, `cidade`, `estado`, `endereco`, `cep`, `foto`) VALUES (2, 'Gilberson Silva dos Santos', 'gilber@hotmail.com', '1234', 'M', 'Brusque', 'SC', 'Rua do Gilberson, 47', '88356-890', 'http://goo.gl/M45CIp');
INSERT INTO `sitap`.`usuario` (`idusuario`, `nome`, `email`, `senha`, `sexo`, `cidade`, `estado`, `endereco`, `cep`, `foto`) VALUES (0, 'Anônimo', 'anonimo@anonimo.com.br', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sitap`.`usuario` (`idusuario`, `nome`, `email`, `senha`, `sexo`, `cidade`, `estado`, `endereco`, `cep`, `foto`) VALUES (1, 'Admin', 'admin@admin.com.br', '1234', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sitap`.`usuario` (`idusuario`, `nome`, `email`, `senha`, `sexo`, `cidade`, `estado`, `endereco`, `cep`, `foto`) VALUES (3, 'Cacilda Paris Hilton', 'cacilda@gmail.com', '1234', 'F', 'Guabiruba', 'SC', 'Rua na Guabiruba, 74', '88301-805', 'http://goo.gl/b2tcaz');

COMMIT;

-- -----------------------------------------------------
-- Data for table `sitap`.`artigo`
-- -----------------------------------------------------
START TRANSACTION;
USE `sitap`;
INSERT INTO `sitap`.`artigo` (`idartigo`, `titulo`, `corpo`, `data`, `idusuario`, `like`) VALUES (1, 'A Pizza nossa de cada dia no dai hoje', '<p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo. Manduma pindureta quium dia nois paga. Sapien in monti palavris qui num significa nadis i pareci latim. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.</p>', '2014-10-27 16:42:13', 2, 15);
INSERT INTO `sitap`.`artigo` (`idartigo`, `titulo`, `corpo`, `data`, `idusuario`, `like`) VALUES (2, 'O bacon faz mal pro porco', '<p>Bacon ipsum dolor amet pork loin rump sausage kielbasa shank doner kevin spare ribs sirloin pork chop tenderloin corned beef ham hock tongue meatloaf. Corned beef cow brisket rump jerky t-bone. Ribeye brisket jowl, tri-tip frankfurter cow short ribs shank pork spare ribs venison flank ham salami. Boudin t-bone kielbasa flank strip steak.</p>', '2014-10-27 16:50:35', 3, 10);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sitap`.`comentario`
-- -----------------------------------------------------
START TRANSACTION;
USE `sitap`;
INSERT INTO `sitap`.`comentario` (`idcomentario`, `idusuario`, `idartigo`, `corpo`, `data`) VALUES (1, 0, 1, 'Alo ha isso é um comentário do anônimo', '2014-10-27 16:48:15');
INSERT INTO `sitap`.`comentario` (`idcomentario`, `idusuario`, `idartigo`, `corpo`, `data`) VALUES (2, 3, 1, 'Alo ha Cacilda aqui', '2014-10-28 8:56:15');

COMMIT;

-- -----------------------------------------------------
-- Data for table `sitap`.`foto`
-- -----------------------------------------------------
START TRANSACTION;
USE `sitap`;
INSERT INTO `sitap`.`foto` (`idfoto`, `arquivo`, `idartigo`) VALUES (1, 'http://lorempizza.com/i/714/300', 1);
INSERT INTO `sitap`.`foto` (`idfoto`, `arquivo`, `idartigo`) VALUES (2, 'http://lorempizza.com/i/514/300', 1);
INSERT INTO `sitap`.`foto` (`idfoto`, `arquivo`, `idartigo`) VALUES (3, 'http://baconmockup.com/300/200', 2);
INSERT INTO `sitap`.`foto` (`idfoto`, `arquivo`, `idartigo`) VALUES (4, 'http://baconmockup.com/714/300', 2);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sitap`.`categoria`
-- -----------------------------------------------------
START TRANSACTION;
USE `sitap`;
INSERT INTO `sitap`.`categoria` (`idcategoria`, `nome`, `descricao`) VALUES (1, 'Pizza', 'Categora que fala sobre pizzas');
INSERT INTO `sitap`.`categoria` (`idcategoria`, `nome`, `descricao`) VALUES (2, 'Bacon', 'Categoria sobre bacon');

COMMIT;

-- -----------------------------------------------------
-- Data for table `sitap`.`categoria_has_artigo`
-- -----------------------------------------------------
START TRANSACTION;
USE `sitap`;
INSERT INTO `sitap`.`categoria_has_artigo` (`idcategoria`, `idartigo`) VALUES (1, 1);
INSERT INTO `sitap`.`categoria_has_artigo` (`idcategoria`, `idartigo`) VALUES (2, 2);

COMMIT;
