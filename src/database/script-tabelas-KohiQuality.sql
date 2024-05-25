USE KohiQuality;
CREATE TABLE suporte (
idSuporte int primary key auto_increment,
nome varchar(45),
email varchar(100),
funcao varchar (45));

INSERT INTO suporte VALUES 
(default, "Luis Gustavo", "vendas@kohi.quality.com", "Lider de vendas"),
(default, "Vitória Lemes", "vendas@kohi.quality.com", "Lider de vendas");

SELECT * FROM suporte;

select nome as 'Resposável' ,
	email as 'Email Suporte',
    funcao as 'Função Interna de Suporte'
from suporte;

CREATE TABLE leads (
idLeads int primary key auto_increment,
fkSuporte int, 
	constraint fkSuporteLeads foreign key (fkSuporte)
		references suporte(idSuporte),
nome varchar(45),
email varchar(100),
mensagem varchar(500));

INSERT INTO leads VALUES 
(default,1,"Melita","contato@melita.com","Olá, adorei o sistema de monitoramento de vocês, vamos fechar um contrato ? "),
(default,2,"Pilão","contato@pilao.com","Boa tarde ! Adorei o sistema de monitoramento de vocês, vamos logo fechar um contrato ? ");

SELECT * FROM leads;

select leads.nome as 'Nome Empresa',
	leads.email as 'Email Empresa',
    suporte.nome as 'Membro Responsável Pelo Suporte',
	suporte.email as 'Email suporte',
	mensagem as 'Mensagem Empresa'    
from leads join suporte on fkSuporte = idSuporte;

CREATE TABLE fazenda (
idFazenda int primary key auto_increment,
nome varchar(45),
cep char(9),
numero varchar(45),
complemento varchar(45));

INSERT INTO fazenda VALUES
(default, 'Fazenda Santa Clara', '12345678', '1000', 'Sítio Bom Sucesso'),
(default, 'Fazenda São Jorge', '54321098', '500', 'Km 10, Estrada do Café'),
(default, 'Fazenda Nossa Senhora das Graças', '98765432', '1500', 'Rodovia dos Cafezais, Lote 20');

CREATE TABLE usuario (
idUsuario int primary key auto_increment,
fkFazenda int, 
	constraint fkFazendaUsuario foreign key (fkFazenda)
		references fazenda(idFazenda),
fkResponsavel int, 
	constraint fkUsuarioResponsavel foreign key (fkResponsavel)
		references usuario(idUsuario),
nomeCompleto varchar(100),
cpf char(11),
logradouro varchar(100),
numero varchar(10),
complemento varchar(45),
bairro varchar(45),
estado char(2),
numeroTelefone char(9),
email varchar(45),
senha varchar(45));

insert into usuario (fkFazenda, fkResponsavel, nomeCompleto, cpf, logradouro, numero, complemento, bairro, estado, numeroTelefone, email, senha) values
(1, NULL, 'Ana Silva', '12345678901', 'Rua das Palmeiras', '101', '', 'Centro', 'SP', '111222333', 'ana@example.com', 'senha123'),
(2, 1, 'Marcos Oliveira', '23456789012', 'Avenida Central', '202', 'Bloco A', 'Jardins', 'RJ', '444555666', 'marcos@example.com', 'abc123'),
(3, NULL, 'Carla Pereira', '34567890123', 'Travessa dos Lírios', '303', '', 'Centro', 'MG', '777888999', 'carla@example.com', 'senha456'),
(1, 2, 'Lucas Santos', '45678901234', 'Rua das Acácias', '404', '', 'Liberdade', 'SP', '999888777', 'lucas@example.com', 'xyz789'),
(2, NULL, 'Fernanda Souza', '56789012345', 'Alameda dos Ipês', '505', '', 'Novo Mundo', 'RJ', '333222111', 'fernanda@example.com', 'senha456'),
(1, 1, 'Gabriel Lima', '67890123456', 'Avenida dos Girassóis', '606', 'Casa 2', 'Praia', 'SP', '666777888', 'gabriel@example.com', 'senhaabc'),
(2, NULL, 'Juliana Castro', '78901234567', 'Rua das Violetas', '707', '', 'Floresta', 'RJ', '555444333', 'juliana@example.com', 'novasenha'),
(3, 2, 'Rafaela Almeida', '89012345678', 'Rua dos Jasmins', '808', '', 'Jardim', 'MG', '222333444', 'rafaela@example.com', 'outrasenha'),
(1, NULL, 'Sérgio Costa', '90123456789', 'Travessa das Orquídeas', '909', '', 'Centro', 'SP', '123456789', 'sergio@example.com', 'senha1234'),
(2, 3, 'Thiago Martins', '01234567890', 'Rua dos Cravos', '1010', '', 'Centro', 'RJ', '987654321', 'thiago@example.com', 'senha654');

SELECT * FROM usuario;

select usuario.nomeCompleto as 'Nome Usuário',
	responsavel.nomeCompleto as 'Nome Responsável',
	usuario.email as 'Email usuário',
    fazenda.
    nome as 'Nome Fazenda'
    from usuario join fazenda on fkFazenda = idFazenda
    join usuario as responsavel
    on responsavel.idUsuario = usuario.fkResponsavel;
    
SELECT COUNT(idUsuario) as 'Quantidade de usuários' FROM usuario;

CREATE TABLE Silo (
idSilo int auto_increment,
nome varchar(45),
fkFazenda int,
fkResponsavel int,
	constraint fkFazenda foreign key (fkFazenda) references fazenda(idFazenda),
	constraint pkComposta primary key (idSilo, fkFazenda),
	constraint fkResponsavelSilo foreign key (fkResponsavel) references usuario(idUsuario));

insert into silo values 
(null,"Beta" ,1, 3),
(null,"Alpha",1, 3),
(null,"Gama",2, 1),
(null,"Delta",3, 6);

SELECT * FROM silo;

/*select silo.nome as 'Nome Silo',
	fazenda.nome as 'Nome Fazenda',
	responsavel.nomeCompleto as 'Nome Responsavel do Silo'
    from silo
    join fazenda on fkFazenda = idFazenda
    right join usuario as responsavel
    on responsavel.idUsuario;
*/
    
CREATE TABLE graos (
idGraos int primary key auto_increment,
fkSilo int, 
	constraint fkSiloGraos foreign key (fkSilo)
		references silo(idSilo),
nomeGrao varchar(45),
temperaturaIdealMax float,
temperaturaIdealMin float,
umidadeIdealMax float,
umidadeIdealMin float,
mensagemEstavel varchar(45),
mensagemAlerta varchar(45),
mensagemCritico varchar(45));


insert into graos(fkSilo, nomeGrao, temperaturaIdealMax, temperaturaIdealMin, umidadeIdealMax, umidadeIdealMin) values 
(1,'Grão de café ARÁBICA',23,10,65.99,65.01),
(2,'Grão de café CONILON',23,10,65.99,65.01);

SELECT * FROM graos;

select nomeGrao as 'Nome Grão',
	silo.nome as 'Nome Silo',
    temperaturaIdealMax as 'Temperatura ideal máxima',
    temperaturaIdealMin as 'Temperatura ideal mínima',
    umidadeIdealMax as 'Umidade ideal máxima',
    umidadeIdealMin as 'Umidade ideal mínima' 
    from graos join silo on fkSilo = idSilo;

CREATE TABLE sensores (
idSensor int primary key auto_increment,
fkSilo int,
posicao varchar(45), 
	constraint fkSensorSilo foreign key (fkSilo)
		references silo(idSilo));

insert into sensores values
(default,1,'No silo de madeira numero 4'),
(default,2,'No silo de aluminio numero 1'),
(default,3,'No silo de madeira numero 2'),
(default,4,'No silo de aluminio numero 3');

SELECT * FROM sensores;

select idSensor as 'Id Do Sensor',
	silo.nome as 'Nome Silo' from sensores
    join silo on fkSilo = idSilo;
    
SELECT COUNT(idSensor) as 'Quantidade de Sensores' FROM sensores;

CREATE TABLE medida (
idMedida int primary key auto_increment,
fkSensor int, 
	constraint fkSensorMedida foreign key (fkSensor)
		references sensores(idSensor),
temperatura float,
umidade float,
data_hora datetime);

INSERT INTO medida VALUES
(default,1, 24, 65.1, '2024-05-09 12:00'),
(default,1, 22, 65.8, '2024-05-09 13:00'),
(default,1, 23, 66.2, '2024-05-09 14:00'),
(default,1, 15, 65.4, '2024-05-09 15:00'),
(default,1, 12, 65.2, '2024-05-09 16:00'),
(default,1, 9, 65.9, '2024-05-09 17:00'),
(default,2, 12.5, 63.7, '2024-05-09 16:30'),
(default,3, 24.8, 63.1, '2024-05-09 17:00'),
(default,4, 22.1, 64.3, '2024-05-09 06:00');

SELECT * FROM medida;
     
SELECT 
    u.idUsuario,
    u.nomeCompleto AS nomeResponsavel,
    u.email,
    u.senha,
    s.idSilo,
    f.idFazenda,
    f.nome AS nomeFazenda,
    f.cep,
    f.numero AS numeroFazenda,
    f.complemento AS complementoFazenda
FROM 
    usuario as u
JOIN 
    silo as s ON u.idUsuario = s.fkResponsavel
JOIN 
    fazenda as f ON s.fkFazenda = f.idFazenda
WHERE
    u.email = 'ana@example.com' AND u.senha = 'senha123';
    
--  Obter informações sobre os sensores e as medidas registradas por cada sensor.
    
SELECT 
    s.idSensor,
    m.idMedida,
    m.temperatura,
    m.umidade,
	DATE_FORMAT(m.data_hora,'%H:%i:%s') as momento_grafico
FROM 
    sensores s
JOIN 
    medida m ON s.idSensor = m.fkSensor 
WHERE fkSensor = 1
    ORDER BY idMedida DESC LIMIT 3;