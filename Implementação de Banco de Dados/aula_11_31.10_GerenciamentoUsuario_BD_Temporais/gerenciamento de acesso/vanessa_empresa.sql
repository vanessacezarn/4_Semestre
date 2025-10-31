use EMPRESA;
select * from FUNCIONARIO;

insert into FUNCIONARIO (Pnome, Unome, Cpf, Sexo)
values ('Luiza','Karlec','123456789','F');

update FUNCIONARIO
set Minicial = 'L'
where cpf='123456789'

DELETE FROM FUNCIONARIO WHERE Cpf = '123456789';