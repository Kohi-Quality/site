CREATE DATABASE KohiQuality;

USE KohiQuality;

CREATE TABLE empresa (
	id INT PRIMARY KEY AUTO_INCREMENT,
	razao_social VARCHAR(50),
	cnpj CHAR(14)
);
select * from usuario;

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50),
	fk_empresa INT,
	FOREIGN KEY (fk_empresa) REFERENCES empresa(id)
);

CREATE TABLE aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
);

create table aquario (
/* em nossa regra de negócio, um aquario tem apenas um sensor */
	id INT PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(300),
	fk_empresa INT,
	FOREIGN KEY (fk_empresa) REFERENCES empresa(id));


insert into aquario (descricao, fk_empresa) values 
('Armazem café arábica', 1), 
('Aquário café conilon', 1);


/* esta tabela deve estar de acordo com o que está em INSERT de sua API do arduino - dat-acqu-ino */

create table medida (
	id INT PRIMARY KEY AUTO_INCREMENT,
	dht11_umidade DECIMAL,
	dht11_temperatura DECIMAL,
	luminosidade DECIMAL,
	lm35_temperatura DECIMAL,
	chave TINYINT,
	momento DATETIME,
	fk_aquario INT,
	FOREIGN KEY (fk_aquario) REFERENCES aquario(id)
);

INSERT INTO medida (dht11_umidade, dht11_temperatura, luminosidade, lm35_temperatura, chave, momento, fk_aquario) VALUES
(55.3, 22.1, 150.5, 23.7, 1, '2023-05-28 12:34:56', 1),
(60.8, 24.3, 200.1, 25.9, 0, '2023-06-14 08:45:32', 1),
(55.3, 22.1, 150.5, 23.7, 1, '2023-05-28 12:34:56', 2),
(60.8, 24.3, 200.1, 25.9, 0, '2023-06-14 08:45:32', 2);


insert into empresa (razao_social, cnpj) values 
('Melitta', '00000000000000'),
('Pilão', '11111111111111');
