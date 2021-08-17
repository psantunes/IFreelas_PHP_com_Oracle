-- TABELA CAMPUS: INICIALMENTE TERÁ SÓ UM REGISTRO

INSERT INTO campus (id_campus, nome_campus) VALUES (scampus.nextval, 'IFRS Porto Alegre');

-- TABELA CURSO: INSERIDOS OS DOIS CURSOS DE TI DO IFRS POA

INSERT INTO curso (id_curso, nome_curso, id_campus) VALUES (scurso.nextval, 'Tecnologia em Sistemas para Internet', 1);
INSERT INTO curso (id_curso, nome_curso, id_campus) VALUES (scurso.nextval, 'Técnico em Redes de Computadores', 1);

-- TABELA IDIOMAS: INSERIDO INGLÊS E ESPANHOL

INSERT INTO idiomas (id_idioma, nome_idioma) VALUES (sidiomas.nextval, 'Inglês');
INSERT INTO idiomas (id_idioma, nome_idioma) VALUES (sidiomas.nextval, 'Espanhol');
INSERT INTO idiomas (id_idioma, nome_idioma) VALUES (sidiomas.nextval, 'Libras');
INSERT INTO idiomas (id_idioma, nome_idioma) VALUES (sidiomas.nextval, 'Alemão');

-- TABELA REGIAO: INSERIDA 4 REGIÕES DE PORTO ALEGRE. LOCAIS ONDE O PROFISSIONAL SE DISPÕE A TRABALHAR

INSERT INTO regiao (id_regiao, regiao) VALUES (sregiao.nextval, 'Porto Alegre - Região Central');
INSERT INTO regiao (id_regiao, regiao) VALUES (sregiao.nextval, 'Porto Alegre - Zona Leste');
INSERT INTO regiao (id_regiao, regiao) VALUES (sregiao.nextval, 'Porto Alegre - Zona Norte');
INSERT INTO regiao (id_regiao, regiao) VALUES (sregiao.nextval, 'Porto Alegre - Zona Sul');
INSERT INTO regiao (id_regiao, regiao) VALUES (sregiao.nextval, 'Home Office');

-- TABELA HABILIDADES: INSERIDAS ALGUMAS HABILIDADES QUE O PROFISSIONAL PODERÁ SELECIONAR

INSERT INTO habilidades (id_habilidade, habilidade, publica) VALUES (shabilidades.nextval, 'HTML', 1);
INSERT INTO habilidades (id_habilidade, habilidade, publica) VALUES (shabilidades.nextval, 'CSS', 1);
INSERT INTO habilidades (id_habilidade, habilidade, publica) VALUES (shabilidades.nextval, 'Javascript', 1);
INSERT INTO habilidades (id_habilidade, habilidade, publica) VALUES (shabilidades.nextval, 'MySQL', 1);
INSERT INTO habilidades (id_habilidade, habilidade, publica) VALUES (shabilidades.nextval, 'Photoshop', 1);
INSERT INTO habilidades (id_habilidade, habilidade, publica) VALUES (shabilidades.nextval, 'PHP', 1);
INSERT INTO habilidades (id_habilidade, habilidade, publica) VALUES (shabilidades.nextval, 'Wordpress', 1);
INSERT INTO habilidades (id_habilidade, habilidade, publica) VALUES (shabilidades.nextval, 'CorelDraw', 1);
INSERT INTO habilidades (id_habilidade, habilidade, publica) VALUES (shabilidades.nextval, 'Infraestrutura de redes', 1);
INSERT INTO habilidades (id_habilidade, habilidade, publica) VALUES (shabilidades.nextval, 'Manutenção de computadores', 1);
INSERT INTO habilidades (id_habilidade, habilidade, publica) VALUES (shabilidades.nextval, 'Active Directory', 1);
INSERT INTO habilidades (id_habilidade, habilidade, publica) VALUES (shabilidades.nextval, 'Virtualização', 0);
INSERT INTO habilidades (id_habilidade, habilidade, publica) VALUES (shabilidades.nextval, 'Java', 1);
INSERT INTO habilidades (id_habilidade, habilidade, publica) VALUES (shabilidades.nextval, 'Ruby on Rails', 1);
INSERT INTO habilidades (id_habilidade, habilidade, publica) VALUES (shabilidades.nextval, 'Oracle', 1);
-- TABELA CLIENTE:

INSERT INTO cliente (
id_cliente, nome_responsavel, razao_social, email, telefone, senha
) VALUES (
scliente.nextval, 'Celso Ramos', 'Fábica de calçados Ltda.', 'celso.r@hotmail.com', '51 99756-4567', 'xyz');

INSERT INTO cliente (
id_cliente, nome_responsavel, razao_social, email, telefone, senha
) VALUES (
scliente.nextval, 'Roberto Farias', 'Laboratório Labscare', 'roberto.farias@labscare.com', '51 98632-9876', 'a2c');
INSERT INTO cliente (
id_cliente, nome_responsavel, razao_social, email, telefone, senha
) VALUES (
scliente.nextval, 'Sandra Alves', 'LocaCar Veículos', 'sandra@locacar.com.br', '51 98512-4356', 'loc');

-- CADASTRO PROFISSIONAL: INSERE DADOS NAS TABELAS prof, habilidade_prof, idioma_prof, regiao_prof

INSERT INTO prof (
id_prof, nome, email, telefone, descricao, avatar, experiencia_1, experiencia_desc_1, experiencia_2, experiencia_desc_2, experiencia_3, experiencia_desc_3, linkedin, website, horarios, tipo_trabalho, senha, semestre, id_curso
) VALUES (
sprof.nextval, 'Paulo Serpa Antunes', 'pauloserpaantunes@gmail.com', '51 98213-7558', 'Profissional com formação em Comunicação Social, em transição de carreira para desenvolvimento front-end', 'images/person_4.jpg','Editor de Internet no Jornal do Comércio','Entre 2009 e 2018 foi o responsável pela implantação e administração do site do Jornal do Comércio. Fazia a gestão editorial, de TI e do desenvolvimento do site. Coordenação de equipe formada por jornalistas, webdesigner e desenvolvedores terceirizados. Criação de hotsites e templates para o CMS da empresa, usando HTML, CSS, PHP, JQuery e MySQL','Professor EAD ','Ministrou a disciplina Mensuração de Resultados nas Mídias Digitais, no curso de especialização em Comunicação e Inovação, com 9 horas-aula, dando aulas sobre monitoramento de redes sociais, web analytics e técnicas de SEO.','Coordenador/Editor do TeleSéries','Criador e editor do TeleSéries (www.teleseries.com.br), site especializado em seriados de televisão em Wordpress. Criado em 2002 e encerrado em 2015, o site chegou a ter mais de uma centena de colaboradores e a registrar audiências superiores a 200 mil visitantes únicos/mês.','https://www.linkedin.com/in/pauloserpaantunes/', 'https://jornalismodigital.jor.br/', 'manhã,tarde','In Company','senha2021forte',2,1);

INSERT INTO habilidade_prof (id_habilidade, id_prof) VALUES (1, 1);
INSERT INTO habilidade_prof (id_habilidade, id_prof) VALUES (2, 1);
INSERT INTO habilidade_prof (id_habilidade, id_prof) VALUES (3, 1);
INSERT INTO habilidade_prof (id_habilidade, id_prof) VALUES (5, 1);
INSERT INTO habilidade_prof (id_habilidade, id_prof) VALUES (6, 1);
INSERT INTO habilidade_prof (id_habilidade, id_prof) VALUES (7, 1);
INSERT INTO habilidade_prof (id_habilidade, id_prof) VALUES (9, 1);
INSERT INTO habilidade_prof (id_habilidade, id_prof) VALUES (13, 1);
INSERT INTO habilidade_prof (id_habilidade, id_prof) VALUES (14, 1);
INSERT INTO idioma_prof (id_idioma, id_prof, nivel) VALUES (1, 1, 'Intermediário');
INSERT INTO idioma_prof (id_idioma, id_prof, nivel) VALUES (2, 1, 'Básico');
INSERT INTO regiao_prof (id_regiao,id_prof) VALUES (1, 1);
INSERT INTO regiao_prof (id_regiao,id_prof) VALUES (2, 1);
INSERT INTO regiao_prof (id_regiao,id_prof) VALUES (3, 1);
INSERT INTO regiao_prof (id_regiao,id_prof) VALUES (4, 1);

INSERT INTO prof (
id_prof, nome, email, telefone, descricao, avatar, experiencia_1, experiencia_desc_1, experiencia_2, experiencia_desc_2, experiencia_3, experiencia_desc_3, linkedin, website, horarios, tipo_trabalho, senha, semestre, id_curso
) VALUES (
sprof.nextval, 'Jefferson Ribeiro', 'jeffersonlive2@gmail.com', '51 98502-1025', 'Empreendedor na área de TI e eventos.', 'images/person_2.jpg','MEI na área de TI.','Desde de 2010, com diversas atividades desde aulas particulares, assistência para empresas, infraestrutura de rede, suporte, venda e instalação de equipamentos e suporte.','Estágio no Ministério Público do RS ','Apoio ao usuário, dos sistemas e estruturas no MP, auxilio, instalação de software, suporte em assinatura digital e orientações diversas.','Preparados de Dados','Editando e criando imagens para sites e sistemas, elaborando soluções para sites instuticionais na parte de layout e módulos de construção no Joomla.','https://www.linkedin.com/in/jefferson-ribeiro-824a14127/', '', 'manhã,tarde,finais de semana','In Company,Home Office','password999',2,1);

INSERT INTO habilidade_prof (id_habilidade, id_prof) VALUES (5, 2);
INSERT INTO habilidade_prof (id_habilidade, id_prof) VALUES (8, 2);
INSERT INTO habilidade_prof (id_habilidade, id_prof) VALUES (9, 2);
INSERT INTO habilidade_prof (id_habilidade, id_prof) VALUES (10, 2);
INSERT INTO habilidade_prof (id_habilidade, id_prof) VALUES (11, 2);
INSERT INTO habilidade_prof (id_habilidade, id_prof) VALUES (12, 2);
INSERT INTO idioma_prof (id_idioma, id_prof, nivel) VALUES (1, 2, 'Básico');
INSERT INTO regiao_prof (id_regiao,id_prof) VALUES (1, 2);
INSERT INTO regiao_prof (id_regiao,id_prof) VALUES (2, 2);
INSERT INTO regiao_prof (id_regiao,id_prof) VALUES (3, 2);
INSERT INTO regiao_prof (id_regiao,id_prof) VALUES (4, 2);

----PERFIL DE TESTE

INSERT INTO prof (
id_prof, nome, email, telefone, descricao, avatar, experiencia_1, experiencia_desc_1, experiencia_2, experiencia_desc_2, experiencia_3, experiencia_desc_3, linkedin, website, horarios, tipo_trabalho, senha, semestre, id_curso
) VALUES (
sprof.nextval, 'Carla Teste', 'carla.teste@mail.com', '51 99999-0000', 'Perfil teste.', 'images/person_6.jpg','Experiência 1 do perfil teste.','Descrição 1 do perfil teste.','Experiência 2 do perfil teste.','Descrição 2 do perfil teste.','Experiência 3 do perfil teste.', 'Descrição 3 do perfil teste.','linkedin/', 'www.testecarla.abc', 'manhã,tarde,finais de semana','In Company,Home Office','teste1234',3,2);

INSERT INTO habilidade_prof (id_habilidade, id_prof) VALUES (5, 3);
INSERT INTO habilidade_prof (id_habilidade, id_prof) VALUES (9, 3);
INSERT INTO habilidade_prof (id_habilidade, id_prof) VALUES (10, 3);
INSERT INTO habilidade_prof (id_habilidade, id_prof) VALUES (11, 3);
INSERT INTO habilidade_prof (id_habilidade, id_prof) VALUES (12, 3);
INSERT INTO idioma_prof (id_idioma, id_prof, nivel) VALUES (1, 3, 'Avançado');
INSERT INTO idioma_prof (id_idioma, id_prof, nivel) VALUES (2, 3, 'Avançado');
INSERT INTO regiao_prof (id_regiao,id_prof) VALUES (1, 3);
INSERT INTO regiao_prof (id_regiao,id_prof) VALUES (2, 3);

--FIM DO ARQUIVO INSERT