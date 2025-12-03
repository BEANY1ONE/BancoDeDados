-- =============================================
-- _____________________________________________
-- Aqui abaixo, será o código do MySQL que será utilizado para criação do Banco de Dados e
-- tabelas do Projeto Individual
-- _____________________________________________
-- =============================================


CREATE DATABASE beany1;

USE beany1;

-- Criação das Tabelas do Banco de Dados
-- Tabela: Usuário

CREATE TABLE usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(50) UNIQUE NOT NULL,
	email VARCHAR(80),
	senha VARCHAR(20) NOT NULL
);

CREATE TABLE conta ( -- Informações da conta
	idConta INT AUTO_INCREMENT,
	fkUsuario INT,
		CONSTRAINT fkUsuarioConta FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario),
		PRIMARY KEY (idConta, fkUsuario),
	ranks VARCHAR(15),
		CONSTRAINT chkRanks CHECK (ranks IN('Cobre', 'Bronze', 'Prata', 'Ouro', 'Platina', 'Diamante', 'Champion')),
	kd DECIMAL DEFAULT 0,
	dtConta DATE DEFAULT NOW(),
	nvlConta INT
);

CREATE TABLE equipe (
	idEquipe INT PRIMARY KEY AUTO_INCREMENT,
	dtCriacao DATE NOT NULL,
	qtdMembros INT
);

CREATE TABLE partidaUsuario (
	idPartida INT AUTO_INCREMENT,
	fkUsuario INT,
	fkEquipe INT,
		CONSTRAINT fkUsuarioPartida FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario),
		CONSTRAINT fkEquipePartida FOREIGN KEY (fkEquipe) REFERENCES equipe(idEquipe),
		PRIMARY KEY (idPartida, fkUsuario, fkEquipe),
	dtPartida DATE DEFAULT NOW() NOT NULL,
	mapa VARCHAR(45),
	resultado VARCHAR(45) NOT NULL,
		CONSTRAINT chkResultado CHECK (resultado IN('Vitória', 'Derrota')),
	kills INT NOT NULL,
	deaths INT NOT NULL,
	pontos INT
);

-- ================================================================
-- Tabela Fóruns caso ache necessário futuramente adicionar
-- ================================================================

-- CREATE TABLE forum (
-- 	idPostagem INT PRIMARY KEY AUTO_INCREMENT,
-- 	titulo VARCHAR(45) NOT NULL,
-- 	comentario VARCHAR(200),
-- 	fkUsuario INT DEFAULT 0,
-- 		CONSTRAINT fkUsuarioForum FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario)
-- );