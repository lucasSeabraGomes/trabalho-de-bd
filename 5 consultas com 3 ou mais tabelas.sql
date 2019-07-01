--  consulta os nomes dos tipos de equipamento presentes em uma atividade
-- π atividade.idatividade,tipoEq.nome (σ atividade_has_equipamento.idequipamento= equipamento.idequipamento ((equipamento*tipoEq)X(atividade_has_equipamento*atividade))
select atividade.idatividade,tipoEq.nome from (equipamento INNER JOIN tipoEq on equipamento.tipoEq_idtipoEq=tipoEq.idtipoEq) ,(atividade_has_equipamento INNER JOIN atividade on atividade_has_equipamento.atividade_idatividade=atividade.idatividade ) where atividade_has_equipamento.equipamento_idequipamento= equipamento.idequipamento;

