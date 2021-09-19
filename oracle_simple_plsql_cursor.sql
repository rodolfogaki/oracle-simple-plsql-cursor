DECLARE
    cursor cur_pessoa is
           select p.nome_completo,p.email
             from pessoa p
            where 1=1
              and p.status = 'A'
           ;
    --
    reg_pessoa cur_pessoa%rowtype;
BEGIN
    open cur_pessoa;
    --
    loop
        fetch cur_pessoa into reg_pessoa;
         exit when cur_pessoa%notfound;
        dbms_output.put_line(reg_pessoa.nome_completo||' - '||reg_pessoa.email);
    end loop;
    --
    close cur_pessoa;
END;

/*
-- CRIACAO DE TABELAS
CREATE TABLE pessoa (
    id_pessoa NUMBER(11) NOT NULL,
    nome_completo VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    dt_nascimento DATE NOT NULL,
    sexo VARCHAR2(1) NOT NULL,
    status VARCHAR2(1) NOT NULL, --I=INATIVO,A=ATIVO
    PRIMARY KEY (id_pessoa)
);

-- INCLUSAO DE INFORMACOES
insert into pessoa values (1,'João Henrique da Silva','joaohs@joaohs.com',to_date('01/01/1990','dd/mm/yyyy'),'M','A');
insert into pessoa values (2,'Ana Patrícia Monteiro Dias','anapmd@anapmd.com',to_date('05/05/2006','dd/mm/yyyy'),'F','A');
insert into pessoa values (3,'Carlos José Pinheiro','carlosjp@carlosjp.com',to_date('05/05/2006','dd/mm/yyyy'),'M','I');
*/
