DELIMITER $$
drop procedure if exists comprar $$
create procedure comprar (comp int,tip int)
main:begin
	declare cont int;
    declare fim int;
    select compra_has_tipoeq.quantidade into fim from compra_has_tipoeq where comp=compra_has_tipoeq.compra_idcompra && tip=compra_has_tipoeq.tipoEq_idtipoEq;
    set cont=0;
    while cont<fim do 
		insert into equipamento value(null,tip,comp);
		set fim=fim-1;
    END WHILE;
END $$

select equipamento.* from equipamento;
call comprar(1,1);
