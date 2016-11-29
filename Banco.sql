
DROP DATABASE politica;


-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema politica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema politica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `politica` DEFAULT CHARACTER SET utf8 ;
USE `politica` ;

-- -----------------------------------------------------
-- Table `politica`.`area`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `politica`.`area` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `version` BIGINT(20) NOT NULL,
  `icone` VARCHAR(255) NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `politica`.`partido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `politica`.`partido` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `version` BIGINT(20) NOT NULL,
  `bandeira` VARCHAR(255) NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `numero` INT(11) NOT NULL,
  `sigla` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `politica`.`pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `politica`.`pessoa` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `version` BIGINT(20) NOT NULL,
  `data_nascimento` DATETIME NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `is_ativada` BIT(1) NOT NULL,
  `nome` VARCHAR(300) NOT NULL,
  `senha` VARCHAR(200) NOT NULL,
  `sexo` VARCHAR(255) NOT NULL,
  `tipo` VARCHAR(255) NOT NULL,
  `foto` VARCHAR(255) NULL DEFAULT NULL,
  `is_candidato` BIT(1) NULL DEFAULT NULL,
  `numero` INT(11) NULL DEFAULT NULL,
  `partido_id` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email` (`email` ASC),
  INDEX `FKC4E40FA7D7D9AE5B` (`partido_id` ASC),
  CONSTRAINT `FKC4E40FA7D7D9AE5B`
    FOREIGN KEY (`partido_id`)
    REFERENCES `politica`.`partido` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `politica`.`proposta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `politica`.`proposta` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `version` BIGINT(20) NOT NULL,
  `area_id` BIGINT(20) NOT NULL,
  `descricao` VARCHAR(7500) NOT NULL,
  `politico_id` BIGINT(20) NOT NULL,
  `resumo` VARCHAR(1500) NOT NULL,
  `titulo` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKC4D26D346D0A45F9` (`area_id` ASC),
  INDEX `FKC4D26D34B6A7CC79` (`politico_id` ASC),
  CONSTRAINT `FKC4D26D346D0A45F9`
    FOREIGN KEY (`area_id`)
    REFERENCES `politica`.`area` (`id`),
  CONSTRAINT `FKC4D26D34B6A7CC79`
    FOREIGN KEY (`politico_id`)
    REFERENCES `politica`.`pessoa` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `politica`.`nota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `politica`.`nota` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `version` BIGINT(20) NOT NULL,
  `eleitor_id` BIGINT(20) NOT NULL,
  `proposta_id` BIGINT(20) NOT NULL,
  `valor` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK33AFEED525E919` (`proposta_id` ASC),
  INDEX `FK33AFEEAD52E7B` (`eleitor_id` ASC),
  CONSTRAINT `FK33AFEEAD52E7B`
    FOREIGN KEY (`eleitor_id`)
    REFERENCES `politica`.`pessoa` (`id`),
  CONSTRAINT `FK33AFEED525E919`
    FOREIGN KEY (`proposta_id`)
    REFERENCES `politica`.`proposta` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `politica`.`resposta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `politica`.`resposta` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `version` BIGINT(20) NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  `is_ativada` BIT(1) NOT NULL,
  `politico_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKEBB72721B6A7CC79` (`politico_id` ASC),
  CONSTRAINT `FKEBB72721B6A7CC79`
    FOREIGN KEY (`politico_id`)
    REFERENCES `politica`.`pessoa` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `politica`.`pergunta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `politica`.`pergunta` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `version` BIGINT(20) NOT NULL,
  `data` DATETIME NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  `is_ativada` BIT(1) NOT NULL,
  `is_respondida` BIT(1) NOT NULL,
  `pessoa_id` BIGINT(20) NOT NULL,
  `proposta_id` BIGINT(20) NOT NULL,
  `resposta_id` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK19C3C8B0DA385BF9` (`pessoa_id` ASC),
  INDEX `FK19C3C8B0F2B05F9` (`resposta_id` ASC),
  INDEX `FK19C3C8B0D525E919` (`proposta_id` ASC),
  CONSTRAINT `FK19C3C8B0D525E919`
    FOREIGN KEY (`proposta_id`)
    REFERENCES `politica`.`proposta` (`id`),
  CONSTRAINT `FK19C3C8B0DA385BF9`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `politica`.`pessoa` (`id`),
  CONSTRAINT `FK19C3C8B0F2B05F9`
    FOREIGN KEY (`resposta_id`)
    REFERENCES `politica`.`resposta` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

ALTER TABLE pessoa AUTO_INCREMENT = 1;
ALTER TABLE proposta AUTO_INCREMENT = 1;
ALTER TABLE pergunta AUTO_INCREMENT = 1;
ALTER TABLE resposta AUTO_INCREMENT = 1;
ALTER TABLE area AUTO_INCREMENT = 1;
ALTER TABLE partido AUTO_INCREMENT = 1;
ALTER TABLE nota AUTO_INCREMENT = 1;



INSERT partido VALUE(0, 0,'../arquivos/imagens/partido/bandeira.png', 'PARTIDO SO LONG AND THANKS FOR ALL THE FISHES', '42', 'PSLTF');
INSERT INTO `politica`.`partido` (`id`, `version`, `bandeira`, `nome`, `numero`, `sigla`) VALUES ('2', '0', '../arquivos/imagens/partido/bandeira.png', 'Partido 01', '01', 'P1');
INSERT INTO `politica`.`partido` (`id`, `version`, `bandeira`, `nome`, `numero`, `sigla`) VALUES ('3', '0', '../arquivos/imagens/partido/bandeira.png', 'Partido 02', '02', 'p2');

INSERT area VALUE(0,0,'fa-medkit','Saúde')
                ,(0,0,'fa-book','Educação')
               ,(0,0,'fa-suitcase','Turismo')
			 ,(0,0,'fa-university','Segurança')
             ,(0,0,'fa-tree','Meio Ambiente')
             ,(0,0,'fa-subway', 'Transporte');
             
               


INSERT pessoa VALUE(0, 0, now(), 'politico1@teste.com', true, 'Douglas Martins Ferreira', 'senha123', 'Masculino', 'POLITICO', '../arquivos/imagens/politico/perfil.jpg',
                        true, '42641', 1);
INSERT pessoa VALUE(0, 0, now(), 'politico2@teste.com', true, 'Tânia Correia Cavalcanti', 'senha123', 'Feminino', 'POLITICO', '../arquivos/imagens/politico/perfil.jpg',
                        true, '42752', 1); 
INSERT pessoa VALUE(0, 0, now(), 'politico3@teste.com', true, 'Paulo Lima Santos', 'senha123', 'Masculino', 'POLITICO', '../arquivos/imagens/politico/perfil.jpg',
                        true, '42149', 1);  
  INSERT pessoa VALUE(0, 0, now(), 'politico4@teste.com', true, 'Maluf Barros Azevedo', 'senha123', 'Masculino', 'POLITICO', '../arquivos/imagens/politico/perfil.jpg',
                        true, '13149', 2); 
INSERT pessoa VALUE(0, 0, now(), 'politico5@teste.com', true, ' Gabrielle Alves Lima', 'senha123', 'Feminino', 'POLITICO', '../arquivos/imagens/politico/perfil.jpg',
                        true, '13167', 2);                        
INSERT pessoa VALUE(0, 0, now(), 'politico6@teste.com', true, 'Vitória Souza Rodrigues', 'senha123', 'Feminino', 'POLITICO', '../arquivos/imagens/politico/perfil.jpg',
                        true, '13142', 2);
 INSERT pessoa VALUE(0, 0, now(), 'politico7@teste.com', true, 'Júlia Araujo Rocha', 'senha123', 'Feminino', 'POLITICO', '../arquivos/imagens/politico/perfil.jpg',
                        true, '13390', 2);
INSERT pessoa VALUE(0, 0, now(), 'politico8@teste.com', true, 'Leonardo Rocha Gomes', 'senha123', 'Masculino', 'POLITICO', '../arquivos/imagens/politico/perfil.jpg',
                        true, '45122', 3);
INSERT pessoa VALUE(0, 0, now(), 'politico9@teste.com', true, 'Guilherme Oliveira Carvalho', 'senha123', 'Masculino', 'POLITICO', '../arquivos/imagens/politico/perfil.jpg',
                        true, '45192', 3);
INSERT pessoa VALUE(0, 0, now(), 'politico10@teste.com', true, 'Roberto L. Carpenter', 'senha123', 'Masculino', 'POLITICO', '../arquivos/imagens/politico/perfil.jpg',
                        true, '42444', 2);
INSERT pessoa VALUE(0, 0, now(), 'politico11@teste.com', true, 'Antônio Melo Souza', 'senha123', 'Masculino', 'POLITICO', '../arquivos/imagens/politico/perfil.jpg',
                        true, '45123', 3);
INSERT pessoa VALUE(0, 0, now(), 'politico12@teste.com', true, 'José Goncalves Oliveira', 'senha123', 'Masculino', 'POLITICO', '../arquivos/imagens/politico/perfil.jpg',
                        true, '45742', 3);
INSERT pessoa VALUE(0, 0, now(), 'politico13@teste.com', true, 'Fernanda Almeida Melo', 'senha123', 'Feminino', 'POLITICO', '../arquivos/imagens/politico/perfil.jpg',
                        true, '13142', 2);
INSERT pessoa VALUE(0, 0, now(), 'politico14@teste.com', true, 'Júlia Castro Lima', 'senha123', 'Feminino', 'POLITICO', '../arquivos/imagens/politico/perfil.jpg',
                        true, '42242', 1);
                        
                        
                        
                        
                        
                        
INSERT pessoa VALUE(0, 0, now(), 'pessoa1@gmail.com', true, 'Arthur Almeida Costa', 'senha123', 'Masculino', 'ELEITOR', '../arquivos/imagens/politico/perfil.jpg',
                        true,null,null);
INSERT pessoa VALUE(0, 0, now(), 'pessoa2@gmail.com', true, 'Alex Souza Goncalves', 'senha123', 'Masculino', 'ELEITOR', '../arquivos/imagens/politico/perfil.jpg',
                        true,null,null);
                        
INSERT proposta VALUE (0,0, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas faucibus imperdiet sem, it ligula faucibus. Fusce sit amet arcu vitae mi porttitor scelerisque nec eu dui. Suspendisse potenti. Quisque quis luctus augue. Aliquam elementum a magna non imperdiet. Integer elementum, lacus at dignissim faucibus, lectus dui fermentum diam, ut tincidunt sapien ligula sit amet tortor. Morbi mi arcu, placerat pretium posuere eget, sollicitudin quis est.

In hac habitasse platea dictumst. Vivamus nisl diam, imperdiet sed massa eget, ultrices iaculis nibh. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Etiam commodo sem non egestas fermentum. Duis at neque ultrices, condimentum arcu nec, ultrices dolor. Aenean sit amet dictum felis, nec hendrerit neque. Nulla facilisi.

Donec in velit sed nunc bibendum interdum non vel quam. Quisque id dictum justo, non cursus augue. Duis turpis nisl, mattis et leo sed, volutpat venenatis magna. Sed in congue augue, vel vestibulum ex. Donec vestibulum enim a tellus ultricies mattis. In commodo maximus suscipit. Morbi vel lacus id orci rhoncus pulvinar.

Aenean at erat id augue suscipit bibendum et eu dolor. Maecenas id lacus quis elit posuere lacinia. Duis sit amet viverra purus. Praesent nec mi mollis, elementum diam eu, euismod tellus. Vivamus pulvinar sem ut urna ullamcorper, non pretium nunc consequat. Nulla viverra mi nulla, non elementum nunc scelerisque non. Morbi rutrum, dui a blandit hendrerit, neque leo ultricies risus, eget mollis dolor nisi ut nibh. Ut eu vestibulum ipsum. Donec ultrices nibh in massa hendrerit pulvinar. Nunc at lacus metus. Nunc elementum lobortis augue, tempor finibus turpis consectetur a. Aenean a leo ac ante ultricies aliquet ut ac ipsum.

Mauris ut magna egestas, imperdiet augue id, porttitor est. Nunc eget risus diam. Cras at enim a nisi congue laoreet. Praesent ultrices gravida est, quis mollis nisl commodo id. Fusce at scelerisque erat. Ut consequat felis libero, non suscipit velit aliquet at. Aliquam non ligula vitae nulla volutpat fringilla et quis magna. Sed ut elementum sapien. Vestibulum molestie posuere blandit. Aenean et velit mollis, posuere augue molestie, ultrices enim. Aenean tempor tortor urna, consequat varius arcu ultrices vitae.', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla gravida libero eget nunc ornare rutrum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse laoreet egestas venenatis. Quisque tristique enim non euismod dignissim. Pellentesque nec interdum libero. In lobortis semper vehicula. Phasellus semper a sapien congue elementum. Integer dapibus elit elementum mi pellentesque, sit amet volutpat eros porta. In posuere et sem nec gravida. Sed vitae lorem efficitur, suscipit mauris at, ultricies elit. Praesent felis nunc, pellentesque ac lobortis at, dapibus nec justo.', 'TITULO DA PROPOSTA _001');

INSERT proposta VALUE (0,0, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse id ante eget ante ultrices aliquam eu sit amet erat. Aliquam commodo ligula eget lectus commodo vehicula. Nulla nec massa quis odio pulvinar vehicula laoreet quis urna. Fusce vitae nisl risus. Nullam mi magna, pulvinar ullamcorper est et, vulputate pulvinar tellus. Vivamus ultrices neque imperdiet egestas mattis. Duis dictum massa non sem pretium molestie.

Aliquam nulla magna, rhoncus sit amet euismod sit amet, accumsan tincidunt ex. Proin justo turpis, cursus at nisl non, ornare malesuada felis. Morbi egestas, nisi ut semper mattis, lacus lectus facilisis tortor, a finibus arcu neque nec ligula. Pellentesque tellus libero, viverra sed sapien at, mattis mollis augue. Vestibulum hendrerit nibh eget arcu mattis, eget dignissim lectus faucibus. Nulla aliquam, lorem eu pellentesque auctor, purus nisl ultricies sem, nec consectetur neque mi pretium dolor. Duis sit amet elementum enim. Praesent faucibus rutrum tortor. Fusce ipsum leo, tincidunt quis volutpat at, sodales vitae quam. Aenean blandit, dui in venenatis molestie, ex massa mattis lorem, vitae maximus justo risus in risus. Vivamus pretium ex convallis justo imperdiet, vel facilisis ex tincidunt. Sed lobortis est a nulla commodo rhoncus. Proin cursus elit et nisl suscipit, a dictum dolor commodo.

Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus ullamcorper aliquet elit, in fermentum ligula gravida consectetur. Curabitur tempor nunc vitae urna commodo, at pretium erat cursus. Integer nec dignissim quam. Donec lacinia, tellus eget congue eleifend, mauris enim laoreet augue, in condimentum felis purus sit amet lorem. Duis condimentum sodales semper. Curabitur sed enim dignissim, placerat purus sit amet, gravida urna. Nullam quis tellus orci. Integer laoreet placerat odio at imperdiet. Proin et rhoncus mi. Nam quis ligula ut risus ullamcorper interdum quis sit amet erat. Sed mi sem, maximus non posuere nec, ultricies eget quam.

Cras sed augue dolor. In id orci viverra, vulputate ligula sit amet, venenatis felis. Donec id placerat mi. Pellentesque quam lorem, tristique in pulvinar commodo, tincidunt quis enim. Sed dignissim mauris ac tortor luctus, id imperdiet nisi vehicula. Aliquam posuere felis efficitur laoreet ullamcorper. Vestibulum auctor, purus non posuere vehicula, ipsum nibh eleifend diam, eget fermentum arcu nunc eget justo.', 1, 'Aliquam nulla magna, rhoncus sit amet euismod sit amet, accumsan tincidunt ex. Proin justo turpis, cursus at nisl non, ornare malesuada felis. Morbi egestas, nisi ut semper mattis, lacus lectus facilisis tortor, a finibus arcu neque nec ligula. Pellentesque tellus libero, viverra sed sapien at, mattis mollis augue. Vestibulum hendrerit nibh eget arcu mattis, eget dignissim lectus faucibus. Nulla aliquam, lorem eu pellentesque auctor, purus nisl ultricies sem, nec consectetur neque mi pretium dolor. Duis sit amet elementum enim. Praesent faucibus rutrum tortor. Fusce ipsum leo, tincidunt quis volutpat at, sodales vitae quam. Aenean blandit, dui in venenatis molestie, ex massa mattis lorem, vitae maximus justo risus in risus. Vivamus pretium ex convallis justo imperdiet, vel facilisis ex tincidunt. Sed lobortis est a nulla commodo rhoncus. Proin cursus elit et nisl suscipit, a dictum dolor commodo.', 'TITULO DA PROPOSTA _002');

INSERT proposta VALUE (0,0, 3, 'Duis a porta nunc. Vestibulum sed fringilla sapien. Aenean aliquet lectus sed odio eleifend euismod. Pellentesque nec euismod lectus. Nam mollis nulla eget enim molestie, a posuere enim sodales. Cras ultrices velit ut velit elementum, ac sagittis nulla scelerisque. Etiam id tincidunt mi, sed cursus ante. Proin metus mi, iaculis a mi et, tempor aliquam tellus. Cras facilisis tortor sed velit sollicitudin sagittis. Donec aliquam elit lorem, et fermentum mauris porttitor sollicitudin. Donec convallis ornare ante id vestibulum. Sed imperdiet mauris et elit sodales dignissim. Maecenas a ornare felis, in aliquet nibh. Praesent sagittis urna finibus vulputate fermentum.

Ut vel elit tristique, facilisis nisl ac, rutrum arcu. Proin efficitur eleifend ipsum et facilisis. Sed vulputate interdum convallis. Nulla mi dui, lobortis sit amet purus quis, aliquam laoreet risus. Vestibulum vel porttitor ipsum, sit amet convallis nibh. Nulla non rhoncus dolor. Aliquam erat volutpat. Vivamus dictum hendrerit metus, ac venenatis lacus tincidunt quis. Donec sit amet tortor luctus, pulvinar neque et, posuere est. Etiam sagittis justo ultrices arcu vehicula, eu dignissim ante luctus. Etiam facilisis quam ut ante bibendum, at suscipit ex consectetur. Ut orci nunc, pretium nec tellus sit amet, euismod malesuada turpis. Morbi at orci ac erat pellentesque faucibus non id mauris. Curabitur at rutrum erat, at auctor erat. Phasellus vitae consectetur metus. Donec magna lorem, eleifend et euismod quis, finibus ac tellus.

Praesent elementum purus quis ex luctus, ac pharetra nisi consectetur. Suspendisse id eleifend nibh, id pellentesque mi. In ut quam eu ligula scelerisque varius sit amet mollis massa. Phasellus at risus scelerisque, hendrerit nisl a, maximus elit. Donec eu vulputate erat. Cras euismod, risus quis vulputate posuere, nisl turpis tincidunt libero, in sodales augue magna vitae nisl. Nullam imperdiet lobortis elit, vel sollicitudin felis lobortis a. Ut bibendum dignissim faucibus. Sed at varius neque. Donec tincidunt neque in ex tincidunt pretium.', 2, 'Praesent elementum purus quis ex luctus, ac pharetra nisi consectetur. Suspendisse id eleifend nibh, id pellentesque mi. In ut quam eu ligula scelerisque varius sit amet mollis massa. Phasellus at risus scelerisque, hendrerit nisl a, maximus elit. Donec eu vulputate erat. Cras euismod, risus quis vulputate posuere, nisl turpis tincidunt libero, in sodales augue magna vitae nisl. Nullam imperdiet lobortis elit, vel sollicitudin felis lobortis a. Ut bibendum dignissim faucibus. Sed at varius neque. Donec tincidunt neque in ex tincidunt pretium.', 'TITULO DA PROPOSTA _003');

INSERT proposta VALUE (0,0, 1, 'Donec euismod, urna non tempor imperdiet, ligula elit feugiat justo, in facilisis odio augue vitae purus. Mauris elementum arcu a dolor gravida, in elementum dolor auctor. Vivamus tortor magna, lobortis eget ante non, placerat suscipit quam. Suspendisse potenti. Morbi ut gravida neque, et dapibus lectus. In consectetur erat nec nulla blandit auctor. Suspendisse tristique elementum sapien id accumsan. Phasellus scelerisque auctor lectus quis commodo. Donec malesuada velit vitae varius sagittis. Vestibulum vel ligula a lacus porttitor ullamcorper at eget nisl. Vestibulum sed feugiat felis, quis lobortis est. Vivamus cursus ac nisl at sollicitudin. Curabitur in diam at ipsum accumsan sollicitudin in et metus. Mauris congue lorem augue, sit amet tristique urna placerat ut. Vivamus et interdum libero.

Morbi sit amet dui vitae velit gravida faucibus a ac erat. Interdum et malesuada fames ac ante ipsum primis in faucibus. In ultrices eros sed massa euismod, ac varius metus sollicitudin. Phasellus erat ipsum, pulvinar id lacinia in, ornare eu tortor. Morbi eget velit ac diam vehicula congue. Integer eleifend volutpat tellus, posuere euismod libero sollicitudin et. Sed semper ante dignissim vestibulum finibus. Quisque congue ultrices bibendum. Sed luctus vitae mi ut malesuada. Suspendisse tempor felis et tellus faucibus lobortis. Sed condimentum, magna quis imperdiet sagittis, nisl mi blandit sem, a convallis eros tellus in nisl. Quisque nec odio ac justo auctor faucibus. Fusce tempus tincidunt faucibus.

Suspendisse potenti. Pellentesque quis ullamcorper erat, quis volutpat tellus. Fusce ac urna ut lacus pellentesque porttitor. Suspendisse potenti. Fusce in nisl tortor. Cras pretium interdum tortor tristique porttitor. Phasellus sit amet eleifend ante. Pellentesque quis diam est.', 2, 'Nunc sed imperdiet dolor, sit amet molestie dui. Duis ac sem auctor, congue diam sit amet, vestibulum nisl. Maecenas hendrerit tempus egestas. Aenean ac augue porttitor, accumsan felis vel, rutrum urna. Etiam et fringilla lorem, quis auctor velit. Vivamus turpis est, venenatis in dignissim non, rhoncus ac augue. Nulla volutpat tristique ex, vel volutpat sapien faucibus quis. Sed feugiat pellentesque massa ut fermentum. Suspendisse urna nulla, elementum et interdum in, efficitur ut magna. Nunc ut auctor metus. Praesent fringilla accumsan quam sit amet interdum. Suspendisse in turpis est. Morbi pretium nec ex vel scelerisque. Maecenas consectetur vel sem nec laoreet. Nulla mollis, tortor eu dapibus semper, felis diam tincidunt ligula, vitae ultricies mi nulla sodales magna.', 'TITULO DA PROPOSTA _004');

INSERT proposta VALUE (0,0, 3, 'Sed mi diam, rutrum non felis eget, convallis venenatis ligula. In quis fermentum ipsum. Curabitur condimentum pretium mauris eu cursus. Fusce convallis convallis convallis. Suspendisse posuere feugiat leo et lobortis. Donec vehicula purus ligula, vitae posuere libero cursus at. Nam mattis rutrum sodales. Morbi non ex sed massa molestie viverra ac ut felis. Vivamus vel dui tortor. Aenean consequat ante sed magna facilisis eleifend.

Morbi ultrices quam eu tristique sodales. Nullam a semper orci. Nulla egestas mauris ut augue convallis molestie. Fusce nunc risus, eleifend vel ex posuere, tincidunt rutrum nulla. Donec nec lobortis tellus, at cursus urna. Integer elementum et orci ut lacinia. Duis sit amet erat ut eros fermentum maximus. Nunc nec orci sit amet dui vulputate viverra a sit amet nisl. Etiam vitae lacus enim. Morbi condimentum rhoncus tellus a cursus. Nullam commodo sem quis sollicitudin iaculis. Praesent ut mattis ante. Sed dapibus metus ligula, in porttitor neque volutpat eu.

Phasellus convallis non dolor ac pellentesque. Phasellus mattis, eros eget eleifend aliquam, nisi elit interdum sem, ut hendrerit odio massa et diam. Nunc scelerisque blandit egestas. Donec ut auctor ante. Vivamus commodo purus in tortor vehicula, et luctus velit vestibulum. Phasellus mi sapien, porta at tincidunt at, cursus porttitor ligula. Maecenas sit amet tristique velit. Donec luctus urna in laoreet commodo. Mauris consectetur, mi ut gravida tempus, purus lorem lacinia leo, id tincidunt leo lorem sit amet lorem. Donec vel convallis augue, ac mattis velit. Cras in rutrum turpis. In porta, tortor sit amet facilisis pulvinar, nibh ligula aliquet leo, sit amet bibendum quam arcu et mauris. Quisque varius lacinia diam vel scelerisque. Curabitur non lacus tristique, sollicitudin nisl in, gravida augue. Quisque posuere scelerisque metus non volutpat. Etiam eu tellus rutrum, gravida nunc suscipit, fermentum mi.', 2, 'In et fermentum risus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nullam non leo pulvinar, porta augue vitae, laoreet purus. Cras hendrerit pharetra ipsum, vitae ornare eros fermentum ac. Integer ullamcorper vulputate augue, non varius tellus tristique nec. Integer eget vehicula tellus, in finibus justo. Donec molestie mi eu augue dapibus, et tempor mi semper. Curabitur eu ultricies lectus. Fusce et libero pulvinar magna dapibus ultricies non vitae nulla. Nulla gravida magna quis felis faucibus, sed ullamcorper massa pulvinar. Aliquam euismod ex nec varius porta. Nullam molestie elit eget sagittis laoreet. Integer libero turpis, aliquam eu ullamcorper ultrices, maximus sed mi. Sed rutrum imperdiet ante. Maecenas vel consequat sem. Quisque tristique massa metus.', 'TITULO DA PROPOSTA _005');

INSERT proposta VALUE (0,0, 3, 'Fusce tristique semper lorem a vehicula. Proin non ligula ex. Suspendisse at tortor lobortis, dictum diam sit amet, vehicula sem. Praesent a sapien a dolor scelerisque feugiat. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aenean fringilla nulla vel lorem ultricies blandit. Fusce et eleifend odio, at imperdiet nulla.

Nam accumsan rutrum elit vel dignissim. Nulla sollicitudin eleifend nibh at tincidunt. Praesent a leo eget dui auctor porttitor eu ut nulla. Mauris tristique laoreet urna, non luctus nisl dignissim ut. Quisque semper diam sit amet nibh tristique, ut convallis est rhoncus. Etiam maximus nibh sit amet ipsum pellentesque, et tempus justo accumsan. Cras malesuada turpis sit amet nunc sagittis aliquet. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed at ipsum in tortor condimentum vestibulum vitae eu lectus. In hac habitasse platea dictumst. Donec ut dui purus. Nulla turpis nulla, tincidunt at metus id, pretium finibus metus. Maecenas in nunc eu quam sollicitudin gravida. Cras pulvinar quis urna nec efficitur. Sed vulputate pharetra commodo. Vivamus vitae eleifend nisl.

Donec sed consequat tellus, vitae vehicula arcu. Etiam eu dui commodo, tincidunt justo rutrum, tincidunt justo. Etiam sodales massa nec condimentum efficitur. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean dictum vel augue quis mollis. Pellentesque vel tellus erat. Quisque rhoncus aliquam lectus, consectetur egestas lectus interdum vel. Nam in diam malesuada, hendrerit turpis eu, lobortis mauris.

Aenean tristique nulla ut nibh congue, non viverra elit finibus. Sed varius varius ultricies. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Morbi sed leo consectetur, viverra orci sed, varius diam. Phasellus lacinia, purus fermentum ullamcorper porttitor, tellus neque efficitur ipsum, ut imperdiet turpis libero sit amet sapien. Nulla facilisi. Aenean finibus massa neque, pellentesque pellentesque dolor blandit vel. Donec et tincidunt magna. Vestibulum a tortor quam. Morbi sed pulvinar libero. Sed magna neque, tincidunt vitae dictum semper, tempor vitae nisi. Quisque ut nisl iaculis, viverra tellus quis, egestas magna. Etiam nec tempor metus, eget fermentum sem. Curabitur rutrum nisi nibh, a bibendum mauris euismod eu.', 1, 'Donec blandit non mi ac lobortis. Donec eu ex elit. Sed nec tellus suscipit, eleifend orci sed, euismod nunc. Sed lacinia pretium egestas. Nunc eu magna aliquam, lacinia nisl ut, bibendum nibh. Nulla pulvinar bibendum ullamcorper. In aliquam porttitor augue ut eleifend. Aliquam erat volutpat. Curabitur a dignissim turpis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aenean pellentesque hendrerit erat. Suspendisse porttitor, nisi ut sollicitudin tincidunt, sem sem efficitur est, ac rhoncus ex dui eget enim.', 'TITULO DA PROPOSTA _006');

INSERT proposta VALUE (0,0, 3, 'Morbi sem purus, ultricies ut nunc in, tristique facilisis lorem. Morbi quis arcu gravida, feugiat turpis vitae, molestie enim. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tincidunt imperdiet massa vitae ornare. Nulla sit amet erat a ligula efficitur sollicitudin. Nullam a nibh vitae nunc pellentesque blandit nec et velit. Praesent imperdiet erat vel porttitor eleifend. Donec volutpat lacinia mauris. Mauris at facilisis arcu, ac pharetra magna.

Curabitur mattis vestibulum fringilla. Mauris facilisis pulvinar risus, quis hendrerit nisi maximus at. Nullam nec sagittis massa. Maecenas mi odio, varius non eros sagittis, pretium scelerisque neque. Sed ac vulputate lorem. Vivamus porta dictum sagittis. Nam libero libero, luctus ac volutpat quis, vestibulum vitae elit. Nulla facilisi. In in nisl elit. Etiam a lacus ac eros volutpat egestas at ac purus. Donec luctus facilisis leo, vitae efficitur diam facilisis quis. Cras et molestie sem. Curabitur volutpat ex id dolor congue pulvinar. Nulla facilisi. Sed et venenatis lectus, at finibus magna.

Praesent augue libero, viverra et cursus id, faucibus et nibh. Donec elementum luctus semper. Integer mauris felis, mollis consectetur est placerat, sodales posuere odio. Curabitur sit amet ante id lacus aliquet finibus eget a nunc. Curabitur mollis at lorem at facilisis. Sed orci arcu, dictum nec libero in, accumsan aliquam metus. Nulla et nulla sit amet ligula porttitor maximus. Morbi dignissim nunc vel odio consequat finibus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam dapibus pharetra gravida. Mauris vehicula, massa sed facilisis lobortis, augue tortor blandit arcu, eu hendrerit odio arcu at augue. Vivamus sed erat sapien.

Curabitur et orci diam. Cras erat lacus, pellentesque et rhoncus sit amet, posuere id ipsum. Vivamus rhoncus ornare nunc in convallis. Mauris justo arcu, gravida et volutpat ornare, ultricies vel nulla. In felis leo, dignissim ac commodo ullamcorper, vestibulum non orci. Nulla sit amet dictum nibh. Etiam scelerisque, libero a tristique dictum, urna enim molestie ex, quis cursus erat justo quis turpis. Aliquam vitae ex erat. Praesent eros lacus, fringilla ac augue a, tempus aliquet augue. Sed scelerisque at diam sed faucibus. Duis imperdiet ex sit amet posuere gravida. Praesent in diam eget dui sollicitudin bibendum et quis felis. Morbi sollicitudin consequat orci, in tincidunt tortor commodo sed. Nam ullamcorper congue eros et volutpat. Ut eget viverra nibh.

Sed sagittis vel urna vitae dapibus. Etiam venenatis purus vel ipsum posuere, placerat aliquet mi luctus. Duis aliquet consequat ipsum, eget interdum nulla suscipit quis. Morbi volutpat libero neque, eu consectetur ipsum tristique non. Etiam lacinia lacinia quam, mattis tempus est molestie vitae. Donec sit amet lectus at mi posuere porttitor. Duis sit amet mauris tellus. In ultrices sem erat, eget varius augue consequat ac. Mauris blandit finibus est, at euismod eros finibus ac. Aliquam vestibulum mi tellus, quis gravida elit rutrum sodales.

Aliquam laoreet urna sapien, at tempor felis malesuada nec. Etiam turpis metus, maximus nec porta sit amet, fermentum ut nibh. Nunc ac lorem in dolor volutpat commodo. Suspendisse sit amet tempor dui, eu dictum urna. Nullam commodo arcu dui, vel vestibulum ligula dictum non. Praesent a sem non magna venenatis euismod a eget nunc. Pellentesque tempor metus ac nibh ullamcorper eleifend. Nulla dui erat, mollis in faucibus non, porttitor eget justo. Nunc orci leo, aliquam convallis eros at, rhoncus cursus erat. Duis placerat turpis at rhoncus vestibulum. Donec volutpat vel mauris id venenatis. Praesent nisl urna, blandit quis lacus in, efficitur auctor ante. Nam quis convallis erat. Praesent fringilla scelerisque est id laoreet. In neque metus, congue in arcu sit amet, ultrices aliquet urna. In hac habitasse platea dictumst.

Proin accumsan tincidunt aliquam. Proin tristique cursus nibh, nec dictum tellus tristique eu. Vestibulum et pellentesque nibh. Nunc eget consectetur mauris. Nunc nec ligula est. Nullam laoreet justo vitae leo ullamcorper, a fringilla tortor facilisis. Nulla ut semper eros. Nam id convallis lacus. Pellentesque tincidunt diam libero, a ullamcorper eros commodo pretium. Cras ut eros et enim semper tincidunt hendrerit vitae mauris. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin a metus tincidunt, feugiat nulla non, rhoncus ante. Nam dignissim aliquet ultrices. Nam consequat dapibus diam sed ultrices. Sed semper ex quis libero viverra blandit.', 2, 'Nulla ex enim, mollis nec scelerisque quis, venenatis et tortor. Pellentesque efficitur elit at neque mollis, vel venenatis dolor porttitor. Ut gravida mattis nulla, vel tristique ligula lobortis sit amet. Curabitur vel urna ex. Nam augue massa, iaculis non velit vel, interdum maximus nisl. Aenean lorem arcu, bibendum ultricies porta sed, egestas in metus. Etiam venenatis magna ultricies mauris malesuada eleifend. Vestibulum interdum ullamcorper arcu, sit amet cursus orci malesuada lacinia. Nullam enim ipsum, dapibus eget cursus ut, consequat eu quam. In hac habitasse platea dictumst.', 'TITULO DA PROPOSTA _007');

INSERT proposta VALUE (0,0, 1, 'Phasellus tincidunt dictum risus, id aliquet purus sodales nec. Sed maximus bibendum ex, id tincidunt augue condimentum blandit. Duis aliquet fringilla ex vitae finibus. Vestibulum tempor, magna nec molestie ultrices, nunc dui vehicula mauris, sed vulputate nisi risus ac magna. Curabitur ut efficitur ex, in pretium arcu. Curabitur auctor ipsum porttitor dolor ultricies auctor. Integer vitae dui sagittis, feugiat mi at, venenatis dui. In erat dui, condimentum eget arcu quis, eleifend pharetra erat. Praesent orci lorem, aliquet ut purus a, suscipit mattis est. Mauris diam enim, venenatis non orci in, congue tempus sem. Sed pretium arcu quis eros vehicula, ac dapibus felis feugiat. Vestibulum ut urna rutrum, ultrices ligula et, dignissim eros. Nunc porta metus eget porta condimentum. Sed finibus ultricies libero congue cursus. Curabitur et tristique nunc, vel faucibus quam.', 2, 'Nunc congue purus elit. Nam mattis dui ac elit consequat porttitor rhoncus at tortor. Nulla tempor ullamcorper ex, non vestibulum justo eleifend eu. Nam non diam suscipit mauris iaculis viverra nec vitae mi. Nunc nec nulla non augue ultrices vestibulum. Nunc vitae turpis libero. Vestibulum at nibh magna.', 'TITULO DA PROPOSTA _008');

INSERT proposta VALUE (0,0, 2, 'Ao contrário do que se acredita, Lorem Ipsum não é simplesmente um texto randômico. Com mais de 2000 anos, suas raízes podem ser encontradas em uma obra de literatura latina clássica datada de 45 AC. Richard McClintock, um professor de latim do Hampden-Sydney College na Virginia, pesquisou uma das mais obscuras palavras em latim, consectetur, oriunda de uma passagem de Lorem Ipsum, e, procurando por entre citações da palavra na literatura clássica, descobriu a sua indubitável origem. Lorem Ipsum vem das seções 1.10.32 e 1.10.33 do "de Finibus Bonorum et Malorum" (Os Extremos do Bem e do Mal), de Cícero, escrito em 45 AC. Este livro é um tratado de teoria da ética muito popular na época da Renascença. A primeira linha de Lorem Ipsum, "Lorem Ipsum dolor sit amet..." vem de uma linha na seção 1.10.32.', 2, 'O trecho padrão original de Lorem Ipsum, usado desde o século XVI, está reproduzido abaixo para os interessados. Seções 1.10.32 e 1.10.33 de "de Finibus Bonorum et Malorum" de Cicero também foram reproduzidas abaixo em sua forma exata original, acompanhada das versões para o inglês da tradução feita por H. Rackham em 1914.', 'TITULO DA PROPOSTA _009');