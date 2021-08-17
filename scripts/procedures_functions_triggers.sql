----FUNÇÃO #1: Verifica quantos usuário sabem determinada habilidade que foi digitada

CREATE OR REPLACE FUNCTION N_profs_habilidade (keyword IN VARCHAR2) 
RETURN NUMBER
IS
v_contador NUMBER;
BEGIN
SELECT count(*)
INTO v_contador
FROM prof
INNER JOIN habilidade_prof
ON prof.id_prof =  habilidade_prof.id_prof
INNER JOIN habilidades 
ON habilidade_prof.id_habilidade = habilidades.id_habilidade
WHERE habilidades.habilidade = keyword;
RETURN v_contador;
END ;
/

----FUNÇÃO #2: Verifica quantos usuários estão disponíveis para trabalhar em determinada região

CREATE OR REPLACE FUNCTION N_regiao_profissional (keyword IN NUMBER) 
RETURN NUMBER
IS
v_contador NUMBER;
BEGIN
SELECT count(*)
INTO v_contador
FROM regiao_prof
INNER JOIN regiao
ON regiao_prof.id_regiao = regiao.id_regiao
WHERE regiao.id_regiao = keyword;
RETURN v_contador;
END ;
/

----PROCEDURE #1:  A partir do id do idioma e do id do usuários, retorna o grau de proficiência no idioma

CREATE OR REPLACE PROCEDURE verifica_nivel_idioma(p_id_idioma IN NUMBER, p_id_user IN NUMBER, p_nivel OUT VARCHAR2) IS
BEGIN
SELECT nivel
INTO p_nivel
FROM idioma_prof
WHERE id_prof = p_id_user
AND id_idioma = p_id_idioma;
END;
/

----PROCEDURE #2:  A partir do id do curso, retorna o número de profissionais que estudam naquele curso

create or replace PROCEDURE numero_prof_x_curso(p_id_curso IN NUMBER, p_numero OUT NUMBER) IS
BEGIN
SELECT count(*)
INTO p_numero
FROM prof
WHERE id_curso = p_id_curso;
DBMS_OUTPUT.PUT_LINE(p_numero);
END;
/
----PROCEDURE #3: 

create or replace PROCEDURE habilidade_x_prof(p_id_habilidade IN NUMBER, p_return OUT BOOLEAN) IS
p_numero NUMBER;
BEGIN
SELECT count(*)
INTO p_numero
FROM habilidade_prof
WHERE id_habilidade = p_id_habilidade;
IF p_numero != 0 THEN
    p_return:=TRUE;
ELSE
    p_return:=FALSE;
END IF;
END;
/

----PROCEDURE #4: Faz update na tabela, atualizando o número do semestre que estudam todos os profissionais

CREATE OR REPLACE PROCEDURE atualiza_semestre_em_lote
IS
begin
update prof
set semestre=semestre+1;
dbms_output.put_line(SQL%ROWCOUNT);
end;
/

----PROCEDURE #5: Procedure com cursor, retorna uma lista de todos os profissionais que conhecem determinada habilidade

CREATE OR REPLACE PROCEDURE p_prof_habilidade(p_id_habilidade IN NUMBER, p_res OUT SYS_REFCURSOR) IS
BEGIN
OPEN p_res 
FOR SELECT prof.nome, prof.descricao
FROM prof
INNER JOIN habilidade_prof
ON prof.id_prof = habilidade_prof.id_prof
WHERE habilidade_prof.id_habilidade=p_id_habilidade;
END;
/

----PROCEDURE #6: Procedure com cursor, retorna todos os profissionais disponíveis para trabalhar em determinado tipo de trabalho. Como tipo de trabalho é uma espécie de array, ele precisa buscar a incidência da string dentro do campo tipo_trabalho

CREATE OR REPLACE PROCEDURE p_prof_tipo_trabalho(p_string IN VARCHAR2, p_res OUT SYS_REFCURSOR) IS
BEGIN
OPEN p_res
FOR SELECT nome, descricao
FROM prof
WHERE INSTR(tipo_trabalho, p_string) > 0;
END;
/

----TRIGGER #1: Impede que o usuário cadastre uma senha fraca da lista. 

CREATE OR REPLACE TRIGGER valida_senha_fraca
BEFORE
INSERT OR UPDATE OF senha
ON prof
FOR EACH ROW
BEGIN 
	IF (:new.senha = '123456'
        or :new.senha = '123456789'
        or :new.senha = 'password123'
        or :new.senha = 'password'
        or :new.senha = 'senha'
        or :new.senha = 'qwerty')
	THEN raise_application_error(-20601, 'Senha fraca, cadastre uma senha segura');
	END IF;
END;
/

----TRIGGER #2: Impede que usuário cadastre uma imagem no campo Avatar que não tenha a extensão .JPG ou .PNG. Pega o trecho

CREATE OR REPLACE TRIGGER valida_extensao_imagem
BEFORE
INSERT OR UPDATE OF avatar
ON prof
FOR EACH ROW
BEGIN 
	IF (SUBSTR(:new.avatar,-3) <> 'jpg' and SUBSTR(:new.avatar,-3) <> 'png')
	THEN raise_application_error(-20601, 'Imagem não permitida, arquivo deve ter extensão do tipo JPG ou PNG');
	END IF;
END;
/


---QUERYS QUE DISPARAM O ERRO

select nome, semestre from prof;

update prof set senha = '123456' where id_prof = 1;

update prof set avatar = 'imagens/foto.gif' where id_prof = 1;
