ALTER PROCEDURE usp_inserirDepartamento
	 @Dnome VARCHAR(15),
     @Dnumero INT,
     @Dlocal varchar(15)
AS
BEGIN
    IF EXISTS (select * 
               from DEPARTAMENTO as D 
               WHERE D.Dnome = @Dnome)
    BEGIN
        INSERT INTO LOCALIZACAO_DEP (Dnumero,Dlocal)
    VALUES (@Dnumero, @Dlocal)
    END;

    INSERT INTO DEPARTAMENTO  (Dnome, Dnumero)
    VALUES (@Dnome, @Dnumero)
    INSERT INTO LOCALIZACAO_DEP (Dnumero,Dlocal)
    VALUES (@Dnumero, @Dlocal)
END;

EXEC usp_inserirDepartamento 'Salao', 11,'UFN - 3'

    
    select * from DEPARTAMENTO;
    select * from LOCALIZACAO_DEP;