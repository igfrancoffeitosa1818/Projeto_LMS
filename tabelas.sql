USE 
GO

CREATE TABLE Usuario
(
  idUsuario tinyint IDENTITY(1,1) NOT NULL,
  login varchar(20) NOT NULL,
  senha varchar(15),
  dtExpiracao char(10) NOT NULL,

  CONSTRAINT dfDtExpiracao DEFAULT('01/01/1900') for dtExpiracao,
  CONSTRAINT pkIdUsuario PRIMARY KEY(idUsuario),
  CONSTRAINT uqLogin UNIQUE(login),
);

CREATE TABLE Coordenador
(
   idCoordenador tinyint IDENTITY(1,1) NOT NULL,
   idUsuario tinyint NOT NULL,
   nome varchar(35) NOT NULL,
   email varchar(50) NOT NULL,
   celular smallint NOT NULL,

   CONSTRAINT pkIdCoordenador PRIMARY KEY(idCoordenador),
   CONSTRAINT fkidUsuarioCoordenador FOREIGN KEY(idUsuario) REFERENCES Usuario(idUsuario),
   CONSTRAINT uqEmail UNIQUE(email),
   CONSTRAINT uqCelular UNIQUE(celular),      
);

CREATE TABLE Aluno
(
  idAluno tinyint IDENTITY(1,1) NOT NULL,
  idUsuario tinyint NOT NULL,
  nome varchar(35) NOT NULL,
  email varchar(50) NOT NULL,
  celular smallint NOT NULL,
  ra smallint NOT NULL,
  foto varchar(2083),

  CONSTRAINT pkIdAluno PRIMARY KEY (idAluno),
  CONSTRAINT fkIdUsuarioAluno FOREIGN KEY(idUsuario) REFERENCES Usuario(idUsuario),
  CONSTRAINT uqEmailAluno UNIQUE(email),
  CONSTRAINT uqCelularAluno UNIQUE(celular), 
);

CREATE TABLE Professor

(
   idProfessor tinyint IDENTITY(1,1) NOT NULL,
   idUsuario tinyint NOT NULL,
   email varchar(50) NOT NULL,
   celular smallint NOT NULL,
   Apelido varchar(20),

   CONSTRAINT pkIdProfessor PRIMARY KEY(idProfessor),
   CONSTRAINT fkidUsuarioProfessor FOREIGN KEY(idUsuario) REFERENCES Usuario(idUsuario),
   CONSTRAINT uqEmailProfessor UNIQUE(email),
   CONSTRAINT uqcelularProfessor UNIQUE(celular),
);

CREATE TABLE Disciplina
(
   idDisciplina tinyint IDENTITY(1,1) NOT NULL,
   nome varchar(35) NOT NULL,
   data DATE NOT NULL,
   status varchar(7) NOT NULL, 
   planoDeEnsino varchar(3000) NOT NULL,
   cargaHoraria tinyint NOT NULL,
   competencias varchar(1500) NOT NULL,
   habilidades Varchar(300) NOT NULL,
   ementa varchar(200) NOT NULL,
   conteudoProgramatico varchar(1500) NOT NULL,
   bibliografiaBasica varchar(300) NOT NULL,
   bibliografiaComplementar varchar(300) NOT NULL,
   percentualPratico tinyint NOT NULL,
   percentualTeorico tinyint NOT NULL,
   idCoordenador tinyint NOT NULL,


   CONSTRAINT pkIdDisciplina PRIMARY KEY (idDisciplina),
   CONSTRAINT fkCoordenadorDisciplina FOREIGN KEY(idCoordenador) REFERENCES Coordenador(idCoordenador),
   CONSTRAINT dfData DEFAULT(GETDATE()) for data,
   CONSTRAINT dfStatusDisciplina DEFAULT('ABERTA'),
   CONSTRAINT ckStatusDisciplina CHECK( status = 'ABERTA' OR 'FECHADA'),
   CONSTRAINT ckCargaHoraria CHECK(cargaHoraria = 40 or 80),
   CONSTRAINT ckPercentualPratico CHECK(percentualPratico between 0 and 100),
   CONSTRAINT ckPercentualTeorico CHECK(percentualTeorico between 0 and 100),
   CONSTRAINT uqNome UNIQUE(nome),
);

CREATE TABLE Curso
(
  idCurso tinyint IDENTITY(1,1) NOT NULL,
  nome varchar(35) NOT NULL,
  
  CONSTRAINT pkIdCurso PRIMARY KEY(idCurso),
  CONSTRAINT uqNomeCurso UNIQUE(nomeCurso),
);




CREATE TABLE DisciplinaOfertada 

(
   idDisciplinaOfertada tinyint IDENTITY(1,1) NOT NULL,
   idCoordenador tinyint NOT NULL,
   dtInicioMatricula varchar(10),
   dtFimMatricula varchar(10),
   idDisciplina tinyint NOT NULL,
   idCurso tinyint NOT NULL,
   ano smallint NOT NULL,
   semestre tinyint NOT NULL,
   turma char(1) NOT NULL,
   idProfessor tinyint NOT NULL,
   metodologia varchar(500),
   recursos varchar(500),
   criterioAvaliacao varchar(500),
   planoDeAulas varchar(500),
   
   
   CONSTRAINT pkIdDisciplinaOfertada PRIMARY KEY(idDisciplinaOfertada),
   CONSTRAINT fkIdCoordenadorDisciplinaOfertada FOREIGN KEY(idCoordenador) REFERENCE Coordenador(idCoordenador),
   CONSTRAINT fkIdDisciplinaDisciplinaOfertada FOREIGN KEY(idDisciplina) REFERENCES Disciplina(idDisciplina),
   CONSTRAINT fkIdCursoDisciplinaOfertada FOREIGN KEY(idCurso) REFERENCES Curso(idCurso),
   CONSTRAINT fkIdProfessorDisciplinaOfertada FOREIGN KEY(IdProfessor) REFERENCES Professor(idProfessor),
   CONSTRAINT ckAno CHECK( ano between 1900 and 2100),
   CONSTRAINT ckSemestre CHECK( semestre = 1 or 2),
   CONSTRAINT ckTurma CHECK( turma LIKE [A-Z]),
);
  
CREATE TABLE SolicitacaoMatricula

(
   idSolicitacaoMatricula tinyint IDENTITY(1,1) NOT NULL,
   idAluno tinyint NOT NULL,
   idDisciplinaOfertada tinyint NOT NULL,
   dtSolicitacao DATE NOT NULL,
   idCoordenador tinyint,
   status varchar(10),
   

   CONSTRAINT pkIdSolicitacaoMatricula PRIMARY KEY(idSolicitacaoMatricula),
   CONSTRAINT fkAlunoSolicitacaoMatricula FOREIGN KEY(idAluno) REFERENCES Aluno(idAluno),
   CONSTRAINT fkidDisciplinaOfertadaSolicitacaoMatricula FOREIGN KEY(idDisciplinaOferdada) REFERENCES DisciplinaOfertada(idDisciplinaOfertada),
   CONSTRAINT fkIdCoordenadorSolicitacaoMatricula FOREIGN KEY(idCoordenador) REFERENCES Coordenador(idCoordenador),
   CONSTRAINT dfDtSolicitacao DEFAULT(GETDATE()) for dtSolicitacao,
   CONSTRAINT dfStatus DEFAULT('Solicitada') for status,
   CONSTRAINT ckStatusSolicitacaoMatricula CHECK( status = 'Solicitada' or 'Aprovada' or 'Rejeitada' or 'Cancelada'),
);   

CREATE TABLE Atividade

(
   idAtividade tinyint IDENTITY(1,1) NOT NULL,
   titulo varchar(50) NOT NULL,
   descricao varchar(200),
   conteudo varchar(200),
   tipo varchar(15) NOT NULL,
   extra varchar(50),
   idProfessor tinyint NOT NULL,

   CONSTRAINT pkIdAtividade PRIMARY KEY(idAtividade),
   CONSTRAINT fkIdProfessorAtividade FOREIGN KEY(idProfessor) REFERENCES Professor(idProfessor),
   CONSTRAINT uqTitulo UNIQUE(titulo),
   CONSTRAINT cktipo CHECK(tipo = 'Resposta Aberta' or 'Teste'),
);

CREATE TABLE AtividadeVinculada
(
 
 idAtividadeVinculada tinyint IDENTITY(1,1) NOT NULL,
 idAtividade tinyint NOT NULL,
 idProfessor tinyint NOT NULL,
 idDisciplinaOfertada tinyint NOT NULL,
 rotulo varchar(35) NOT NULL,
 dtInicioRespostas DATE NOT NULL,
 dtFimRespostas DATE NOT NULL,
 
 CONSTRAINT pkIdAtividadeVinculada PRIMARY KEY(idAtividadeVinculada),
 CONSTRAINT fkIdAtividadeAtividadeVinculada FOREIGN KEY(idAtividade) REFERENCES Atividade(idAtividade),
 CONSTRAINT fkIdProfessorAtividadeVinculada FOREIGN KEY(idProfessor) REFERENCES Professor(idprofessor),
 CONSTRAINT fkIdDisciplinaOfertadaAtividadeVinculada FOREIGN KEY(idDisciplinaOfertada) REFERENCES DisciplinaOfertada(idDisciplinaOfertada), 
 CONSTRAINT ckIdDisciplinaOfertada CHECK( status = ‘Disponibilizada’ OR ‘Aberta’ OR ‘Fechada’ OR ‘Encerrada’ OR ‘Prorrogada’),
);

CREATE TABLE Entrega
 (
 idEntrega tinyint IDENTITY(1,1) NOT NULL,
 idAluno tinyint NOT NULL,
 idAtividadeVinculada tinyint NOT NULL,
 tituloEntrega varchar(50) NOT NULL,
 respostaEntrega varchar(2083) NOT NULL,
 dtEntrega DATE NOT NULL,
 idProfessor tinyint,
 dtAvaliacao DATE,
 obs varchar(100),
 status varchar(9) NOT NULL,

 CONSTRAINT pkIdEntrega PRIMARY KEY(idEntrega),
 CONSTRAINT fkIdAluno FOREIGN KEY(idAluno) REFERENCES Aluno(idAluno),
 CONSTRAINT fkIdAtividadeVinculada FOREIGN KEY (idAtividadeVinculada) REFERENCES AtividadeVinculada(idAtividadeVinculada),
 CONSTRAINT dfDtEntrega DEFAULT(GETDATE()),
 CONSTRAINT fkIdProfessor FOREIGN KEY(idProfessor) REFERENCES Professor(idProfessor),
 CONSTRAINT ckNota CHECK( Nota between 0.00 and 10.00),
 CONSTRAINT dfStatus DEFAULT('Entregue') for status,
 CONSTRAINT ckStatus CHECK( status = 'Entregue' or 'Corrigido'),
 );


CREATE TABLE Mensagem
 (
 idMensagem tinyint IDENTITY(1,1) NOT NULL,
 idAluno tinyint NOT NULL,
 idProfessor tinyint NOT NULL,
 assuntoMensagem varchar(50) NOT NULL,
 referênciaMensagem varchar(100) NOT NULL,
 conteudoMensagem varchar(400) NOT NULL,
 dtEnvio DATE NOT NULL,
 dtResopsta DATE,
 resposta varchar(30),

 CONSTRAINT pkIdMensagem PRIMARY KEY(idMensagem),
 CONSTRAINT fkIdAlunoMensagem FOREIGN KEY(idAluno) REFERENCES Aluno(idAluno),
 CONSTRAINT fkIdProfessorMensagem FOREIGN KEY(idProfessor) REFERENCES Professor(idProfessor),
 CONSTRAINT dfStatus DEFAULT('Enviado') for status,
 CONSTRAINT ckStatus CHECK( status = 'Enviado' OR 'Lido' OR 'Respondido'),
 );
