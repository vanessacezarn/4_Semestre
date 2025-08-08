--Cria��o da tabela FUNCIONARIO
CREATE TABLE FUNCIONARIO (
	Pnome VARCHAR(15) NOT NULL,
    Minicial CHAR,
    Unome VARCHAR(15) NOT NULL,
    Cpf CHAR(11),
    Datanasc DATE,
    Endereco VARCHAR(255),
    Sexo CHAR,
    Salario DECIMAL(10,2),
    Cpf_supervisor CHAR(11),
    Dnr INT,
    PRIMARY KEY (Cpf),
    FOREIGN KEY (Cpf_supervisor) REFERENCES FUNCIONARIO(Cpf)
);
GO

--Tablea de DEPARTAMENTO
CREATE TABLE DEPARTAMENTO (
	Dnome VARCHAR(15) NOT NULL,
    Dnumero INT,
    Cpf_gerente CHAR(11),
    Data_inicio_gerente DATE,
    PRIMARY KEY (Dnumero),
    UNIQUE (Dnome),
    FOREIGN KEY (Cpf_gerente) REFERENCES FUNCIONARIO(CPF)
);

--Adiconando resti��o referencial em FUNCIONARO de DEPARTAMENTO
--Criando uma ALTERA��O de Tabela
ALTER TABLE FUNCIONARIO
ADD CONSTRAINT Dnr
FOREIGN KEY (Dnr) REFERENCES DEPARTAMENTO (Dnumero);

--Cria��o da tabela de LOCALIZACAO_DEP
CREATE TABLE LOCALIZACAO_DEP (
	Dnumero INT NOT NULL,
	Dlocal VARCHAR (15) NOT NULL,
    PRIMARY KEY (Dnumero, Dlocal),
    FOREIGN KEY (Dnumero) REFERENCES DEPARTAMENTO (Dnumero)
);

--Criacao da tabela PROJETO
CREATE TABLE PROJETO(
	Projnome VARCHAR (15) NOT NULL,
	Projnumero INT NOT NULL,
    Projlocal VARCHAR(15),
    Dnum INT,
    PRIMARY KEY (Projnumero),
    UNIQUE (Projnome),
    FOREIGN KEY (Dnum) REFERENCES DEPARTAMENTO (Dnumero)
);

--Cria��o da tabela TRABALHA_EM
CREATE TABLE TRABALHA_EM(
	Fcpf CHAR(11) NOT NULL,
    Pnr INT NOT NULL,
    Horas DECIMAL (3,1) NOT NULL,
    PRIMARy KEY (Fcpf, Pnr),
    FOREIGN KEY (Fcpf) REFERENCES FUNCIONARIO (Cpf),
    FOREIGN KEY (Pnr) REFERENCES PROJETO(Projnumero)
);

--Cria��o da tabela DEPENDENTE sem sele��o do esquema
CREATE TABLE DEPENDENTE(
	Fcpf CHAR(11) NOT NULL,
    Nome_dependente VARCHAR(15) NOT NULL,
    Sexo CHAR,
    Datanasc DATE,
    Parentesco VARCHAR(8),
    PRIMARY KEY (Fcpf, Nome_dependente),
    FOREIGN KEY (Fcpf) REFERENCES FUNCIONARIO(Cpf)
);

--Inserindo valores no Departamento
INSERT INTO DEPARTAMENTO (Dnome, Dnumero) VALUES('Pesquisa', 5);
INSERT INTO DEPARTAMENTO (Dnome, Dnumero) VALUES('Administra��o', 4);
INSERT INTO DEPARTAMENTO (Dnome, Dnumero) VALUES('Matriz', 1);
SELECT * FROM DEPARTAMENTO;

--Inserindo funcionarios com cargo de gerencia DATE AAAA-MM-DD
INSERT INTO FUNCIONARIO VALUES ( 'Jorge', 'E', 'Brito', '88866555576', '1937-11-10', 'Rua do Horto, 35, S�o Paulo, SP', 'M', 55000, NULL , 1 );
INSERT INTO FUNCIONARIO VALUES ( 'Jennifer', 'S', 'Souza', '98765432168', '1941-06-20', 'Av Arthur de Lima, 54, Santo Andr�, SP', 'F', 43000, '88866555576' , 4 );
INSERT INTO FUNCIONARIO VALUES ( 'Fernando', 'T', 'Wong', '33344555587', '1955-12-08', 'Rua da Lapa, 34, S�o Paulo, SP', 'M', 40000, '88866555576' , 5 );
INSERT INTO FUNCIONARIO VALUES ( 'Jo�o', 'B', 'Silva', '12345678966', '1965-01-09', 'Rua das Flores, 751, S�o Paulo, SP', 'M', 30000, '33344555587' , 5 );
INSERT INTO FUNCIONARIO VALUES ( 'Alice', 'J', 'Zelaya', '99988777767', '1968-01-19', 'Rua Souza Lima, 35, Curitiba, PR', 'F', 25000, '98765432168' , 4 );
INSERT INTO FUNCIONARIO VALUES ( 'Ronaldo', 'K', 'Lima', '66688444476', '1962-09-15', 'Rua Rebou�as, 65, Piracicaba, SP', 'M', 38000, '33344555587' , 5 );
INSERT INTO FUNCIONARIO VALUES ( 'Joice', 'A', 'Leite', '45345345376', '1972-07-31', 'Av. Lucas Obes, 74, S�o Paulo, SP', 'F', 25000, '33344555587' , 5 );
INSERT INTO FUNCIONARIO VALUES ( 'Andr�', 'E', 'Brito', '98798798733', '1969-03-29', 'Rua Timbira, 35, S�o Paulo, SP', 'M', 25000, '98765432168' , 4 );

--Corrigindo erro de inser��o
UPDATE FUNCIONARIO
SET Endereco = 'Rua Reboucas, 65, Piracicaba, SP'
WHERE Cpf = '66688444476';

--Recupera todas as informa��es de funcion�rios
SELECT * FROM FUNCIONARIO;

--Finzalindo o preenchimento da tabela DEPTARTAMENTO
UPDATE DEPARTAMENTO
SET Cpf_gerente = '33344555587', Data_inicio_gerente = '1988-05-22'
WHERE Dnumero = 5;
UPDATE DEPARTAMENTO
SET Cpf_gerente = '98765432168', Data_inicio_gerente = '1995-01-01'
WHERE Dnumero = 4;
UPDATE DEPARTAMENTO
SET Cpf_gerente = '88866555576', Data_inicio_gerente = '1981-06-19'
WHERE Dnumero = 1;
--Recuperar todas as informa��es de departamento
SELECT * FROM DEPARTAMENTO;

--Prrencher a tabela LOCALIZACAO_DEP
INSERT INTO LOCALIZACAO_DEP VALUES (1, 'S�o Paulo');
INSERT INTO LOCALIZACAO_DEP VALUES (4, 'Mau�');
INSERT INTO LOCALIZACAO_DEP VALUES (5, 'Santo Andr�');
INSERT INTO LOCALIZACAO_DEP VALUES (5, 'Itu');
INSERT INTO LOCALIZACAO_DEP VALUES (5, 'S�o Paulo');
--Recuperando informa��es de LOCALIZACAO_DEP
SELECT * FROM LOCALIZACAO_DEP;

--Preenchendo a table PROJETO
INSERT INTO PROJETO VALUES ('ProdutoX', 1, 'Santo Andr�', 5);
INSERT INTO PROJETO VALUES ('ProdutoY', 2, 'Itu', 5);
INSERT INTO PROJETO VALUES ('ProdutoZ', 3, 'S�o Paulo', 5);
INSERT INTO PROJETO VALUES ('Informatiza��o', 10, 'Mau�', 4);
INSERT INTO PROJETO VALUES ('Reorganiza��o', 20, 'S�o Paulo', 1);
INSERT INTO PROJETO VALUES ('Novosbenef�cios', 30, 'Mau�', 4);
--Recuperando informa��es de PROJETO
SELECT * FROM PROJETO;

--Preenchento TRABALHA_EM
INSERT INTO TRABALHA_EM VALUES ('12345678966',1,32.5);
INSERT INTO TRABALHA_EM VALUES ('12345678966',2,7.5);
INSERT INTO TRABALHA_EM VALUES ('66688444476',3,40);
INSERT INTO TRABALHA_EM VALUES ('45345345376',1,20);
INSERT INTO TRABALHA_EM VALUES ('45345345376',2,20);
INSERT INTO TRABALHA_EM VALUES ('33344555587',2,10);
INSERT INTO TRABALHA_EM VALUES ('33344555587',3,10);
INSERT INTO TRABALHA_EM VALUES ('33344555587',10,10);
INSERT INTO TRABALHA_EM VALUES ('33344555587',20,10);
INSERT INTO TRABALHA_EM VALUES ('99988777767',10,10);
INSERT INTO TRABALHA_EM VALUES ('99988777767',30,30);
INSERT INTO TRABALHA_EM VALUES ('98798798733',10,35);
INSERT INTO TRABALHA_EM VALUES ('98798798733',30,5);
INSERT INTO TRABALHA_EM VALUES ('98765432168',30,20);
INSERT INTO TRABALHA_EM VALUES ('98765432168',20,15);

--Preenchendo a tabela de DEPENDENTES
INSERT INTO DEPENDENTE VALUES ('33344555587', 'Alicia', 'F', '1986-04-05', 'Filha');
INSERT INTO DEPENDENTE VALUES ('33344555587', 'Tiago', 'M', '1983-10-25', 'Filh0');
INSERT INTO DEPENDENTE VALUES ('33344555587', 'Janaina', 'F', '1958-05-03', 'Eposa');
INSERT INTO DEPENDENTE VALUES ('98765432168', 'Antonio', 'M', '1942-02-28', 'Marido');
INSERT INTO DEPENDENTE VALUES ('12345678966', 'Michael', 'M', '1988-01-04', 'Filho');
INSERT INTO DEPENDENTE VALUES ('12345678966', 'Alicia', 'F', '1988-12-30', 'Filha');
INSERT INTO DEPENDENTE VALUES ('12345678966', 'Elizabeth', 'F', '1967-05-05', 'Esposa');

/*
-- Execute estes comando para a aula de IF/ELSE
-- Adicionando a coluna Bonus
ALTER TABLE FUNCIONARIO
ADD Bonus DECIMAL(10, 2) NULL;

-- Adicionando a coluna Data_Admissao
ALTER TABLE FUNCIONARIO
ADD Data_Admissao DATE NULL;


-- Inserindo novos registros com valores para as colunas Bonus e Data_Admissao
INSERT INTO FUNCIONARIO (Pnome, Minicial, Unome, Cpf, Datanasc, Endereco, Sexo, Salario, Cpf_supervisor, Dnr, Data_Admissao, Bonus)
VALUES
('Carlos', 'A', 'Silva', '98765432100', '1985-04-12', 'Rua A, 123', 'M', 4500.00, NULL, 1, '2023-03-01', 1000.00),
('Ana', 'B', 'Sousa', '98765432200', '1990-06-23', 'Rua B, 456', 'F', 6500.00, '98765432100', 1, '2022-01-15', 0.00),
('Maria', 'C', 'Oliveira', '98765432300', '1978-09-17', 'Rua C, 789', 'F', 7500.00, '98765432200', 5, '2024-02-01', 1500.00),
('Paulo', 'D', 'Silva', '98765432400', '1982-11-05', 'Rua D, 101', 'M', 7000.00, '98765432300', 4, '2024-05-15', 500.00);


*/