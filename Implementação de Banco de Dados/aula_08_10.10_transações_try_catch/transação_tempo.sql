set transaction isolation level serializable;
-- transa��� 1
 BEGIN TRAN;
 SELECT * FROM FUNCIONARIO;
 PRINT 'SELECT concluido em:' + CONVERT(varchar(30),SYSDATETIME(),121);
 -- pausa de 20 segundos
 WAITFOR DELAY '00:00:20'
 COMMIT TRAN;
 PRINT 'commit:' + CONVERT(varchar(30),SYSDATETIME(),121);

 -- transa��o 2 
 BEGIN TRAN;
 INSERT INTO FUNCIONARIO (Pnome,Minicial,Unome,Cpf)
 VALUES ('vanessa','C','nascimento','031212')
 PRINT 'insert concluido em:' + CONVERT(varchar(30),SYSDATETIME(),121);
 COMMIT TRAN;
 PRINT 'commit:' + CONVERT(varchar(30),SYSDATETIME(),121);
