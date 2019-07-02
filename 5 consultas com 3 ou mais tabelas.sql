--  consulta os nomes dos tipos de equipamento presentes em uma atividade
-- na algebra relacional temos a busca: π atividade.idatividade,tipoEq.nome (σ atividade_has_equipamento.idequipamento= equipamento.idequipamento ((equipamento*tipoEq)X(atividade_has_equipamento*atividade))
select atividade.idatividade,tipoEq.nome from (equipamento INNER JOIN tipoEq on equipamento.tipoEq_idtipoEq=tipoEq.idtipoEq) ,(atividade_has_equipamento INNER JOIN atividade on atividade_has_equipamento.atividade_idatividade=atividade.idatividade ) where atividade_has_equipamento.equipamento_idequipamento= equipamento.idequipamento;

--  consulta os nomes dos alunos que participaram de atividades de cada instrutor
-- na algebra relacional temos a busca: π pessoa.nome (σ escoteiro_participa_atividade.atividade_idatividade=instrutor_administra_atividade.atividade_idatividade (((pessoa*escoteiro)*escoteiro_participa_atividade)X(instrutor*instrutor_administra_atividade))
select instrutor.pessoa_cpf,pessoa.nome from pessoa,escoteiro,instrutor,instrutor_administra_atividade,escoteiro_participa_atividade where escoteiro.pessoa_cpf =escoteiro_participa_atividade.escoteiro_pessoa_cpf && escoteiro_participa_atividade.atividade_idatividade=instrutor_administra_atividade.atividade_idatividade && escoteiro.pessoa_cpf=pessoa.cpf && instrutor.pessoa_cpf=instrutor_administra_atividade.instrutor_pessoa_cpf;
-- consulta a descrição das doenças cronicas de determinado escoteiro x
-- na algebra relacional:π doencaCronica.descricao (σ pessoa.nome="x"&& pessoa.cpf=escoteiro_has_donecaCronica.escoteiro_pessoa_cpf((doencaCronica*escoteiro_has_doecaCronica)X pessoa)
select doencacronica.descricao from doencacronica,escoteiro_has_doencacronica,pessoa where pessoa.nome='x' && pessoa.cpf=escoteiro_has_doencacronica.escoteiro_pessoa_cpf && doencaCronica.id=escoteiro_has_doencacronica.doencaCronica_id;
-- cunsulta de todos os equipamentos comprados por determinado administrador
-- π equipamento.id(σ compra.id=equipamento.compra_id && pessoa.cpf=compra.administrador_pessoa_cpf && pessoa.nome='x'(compra X pessoa X equipamento))
select equipamento.idequipamento from compra,equipamento,pessoa where pessoa.cpf=compra.administrador_pessoa_cpf && compra.idcompra=equipamento.compra_idcompra && pessoa.nome='x';
-- consulta as doenças cronicas de um aluno que participa de determinada atividade
-- π doencacronica.nome (σ escoteiro_has_doençacronica.escoteiro_cpf=escoteiro_participa_atividade.escoteiro_cpf && escoteiro_has_doencacronica.doencacronica_id=doencacronica.id(escoteiro_participa_atividade X escoteiro_has_doencacronica X doencacronica))
select doencacronica.nome from escoteiro_has_doencacronica,escoteiro_participa_atividade,doencacronica where doencacronica.id=escoteiro_has_doencacronica.doencaCronica_id && escoteiro_participa_atividade.escoteiro_pessoa_cpf=escoteiro_has_doencacronica.escoteiro_pessoa_cpf;