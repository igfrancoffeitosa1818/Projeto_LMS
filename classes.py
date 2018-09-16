class usuario():
    def __init__(self, id_usuario, login, senha):
        self.id_usuario = id_usuario
        self.login = login
        self.senha = senha
        self.dt.Expiração = 1900

class coordenador():
    def __init__(self, id_coord, nome, email_coord, celular_coord, usuario):
        self.id_coord = id_coord
        self.nome = nome
        self.email_coord = email_coord
        self.celular_coord = celular_coord
        self.usuario = usuario

class aluno():
    def __init__(self, id_aluno, usuario, email_aluno, celular_aluno, RA, foto):
        self.id_aluno = id_aluno
        self.usuario = usuario
        self.email_aluno = email_aluno
        self.celular_aluno = celular_aluno
        self.foto = foto
        self.RA = RA
        

class professor():
    def __init__(self, id_prof, usuario, email_prof, celular_prof, apelido):
        self.id_prof = id_prof
        self.usuario = usuario
        self.email_prof = email_prof
        self.celular_prof = celular_prof
        self.apelido = apelido

class disciplina():
    def __init__(self, id_disc, nome, data, status, planoDeEnsino, cargaHoraria, competencias, habilidades, emenda, conteudoProgramatico, bibliografiaBasica, bibliografiaComplementar, porcentualPratico, coordenador):
        self.id_disc = id_disc
        self.nome = nome
        self.data = data
        self.status = status
        self.planoDeEnsino = planoDeEnsino
        self.cargaHoraria = cargaHoraria
        self.competencias = competencias
        self.habilidades = habilidades
        self.emenda = emenda
        self.conteudoProgramatico = conteudoProgramatico
        self.bibliografiaBasica = bibliografiaBasica
        self.bibliografiaComplementar = bibliografiaComplementar
        self.porcentualPratico = porcentualPratico
        self.coordenador = coordenador

class disciplinaOfertada():
    def __init__(self, id_disciplinaOfertada, DtInicioMatricula, DtFimMatricula, ano, semestre, turma, metodologia, recursos, criterioAvaliacao, planoDeAulas, professor, coordenador, disciplina, curso):    
        self.id_disciplinaOfertada= id_disciplinaOfertada
        self.DtInicioMatricula=DtInicioMatricula
        self.DtFimMatricula=DtFimMatricula
        self.ano= ano
        self.semestre = semestre
        self.turma = turma
        self.metodologia=metodologia
        self.recursos=recursos
        self.criterioAvaliacao=criterioAvaliacao
        self.planoDeAulas=planoDeAulas
        self.coordenador = coordenador
        self.disciplina = disciplina
        self.curso = curso
        self.professor = professor

class curso():
    def __init__(self,id_curso,nome):
        self.id_curso
        self.nome=nome

class solicitacaoMatricula():
    def __init__(self,id_matricula,dtSolicitacao,status, aluno, coordenador, disciplinaOfertada):
        self.id_matricula=id_matricula
        self.dtSolicitacao=dtSolicitacao
        self.status=status
        self.aluno = aluno
        self.coordenador = coordenador
        self.disciplinaOfertada = disciplinaOfertada

class atividade():
    def __init__(self, id_atividade, titulo, descricao, conteudo, tipo, extras, professor):
        self.id_atividade=id_atividade
        self.titulo=titulo
        self.descricao=descricao
        self.conteudo=conteudo
        self.tipo=tipo
        self.extras=extras
        self.professor = professor

class atividadeVinculada():
    def __init__(self, id_atividadeVinculada, atividade, professor, rotulo, status, DtInicioRespostas, DtFimRespostas, disciplinaOfertada):
        self.id_atividadeVinculada = id_atividadeVinculada
        self.atividade = atividade
        self.professor = professor
        self.rotulo=rotulo
        self.status=status
        self.DtInicioResposta=DtInicioRespostas
        self.DtFimRespostas=DtFimRespostas
        self.disciplinaOfertada = disciplinaOfertada

class entrega():
    def __init__(self, id_entrega, titulo, resposta, DtEntrega, status, nota, DtAvaliacao, obs, aluno, atividadeVinculada, professor):
        self.id_entrega=id_entrega
        self.titulo=titulo
        self.resposta=resposta
        self.DtEntrega=Dtentrega
        self.status=stats
        self.nota=nota
        self.DtAvaliacao=DtAvaliacao
        self.obs=obs
        self.aluno = aluno
        self.atividadeVinculada = atividadeVinculada
        self.professor = professor

class mensagem():
    def __init__(self,id_mensagem,assunto,referencia,conteudo,status,DtEnvio,DtResposta,resposta, professor, aluno):
        self.id_mensagem=id_mensagem
        self.assunto=assunto
        self.referencia=referencia
        self.conteudo=conteudo
        self.status=status
        self.DtEnvio=DtEnvio
        self.DtResposta=DtResposta
        self.resposta=resposta
        self.aluno = aluno
        self.professor = professor
