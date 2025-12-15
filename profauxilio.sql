create database profAuxilio;
use profAuxilio;


-- Tabela 1: USUÁRIOS
CREATE TABLE usuarios ( 
    id_usuario INT AUTO_INCREMENT PRIMARY KEY, 
    usuario VARCHAR(100) NOT NULL, 
    email VARCHAR(100) UNIQUE NOT NULL,
    senha_hash VARCHAR(255) NOT NULL, 
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP 
); 

-- Tabela 2: MÓDULOS
CREATE TABLE modulos ( 
    id_modulo INT AUTO_INCREMENT PRIMARY KEY, 
    modulo VARCHAR(100) NOT NULL
);
select*from modulos;
-- Tabela 3: ACESSO
CREATE TABLE acesso_modulos (
    id_acesso INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_modulo INT NOT NULL,
    data_selecao DATETIME DEFAULT CURRENT_TIMESTAMP, 
    ativo BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario),
    FOREIGN KEY (id_modulo) REFERENCES modulos (id_modulo),
    UNIQUE (id_usuario, id_modulo)
);

create table series (
    id_serie INT AUTO_INCREMENT PRIMARY KEY,
    serie VARCHAR(100) NOT NULL,
    id_modulo INT NOT NULL,
    FOREIGN KEY (id_modulo) REFERENCES modulos(id_modulo)
);
select*from series;
-- Tabela 4: MATÉRIAS (Removida coluna 'modulo' redundante)
create table materias (
    id_materia INT AUTO_INCREMENT PRIMARY KEY,
    materia VARCHAR(100) NOT NULL,
    id_modulo INT NOT NULL,
    id_serie int not null,
    FOREIGN KEY (id_modulo) REFERENCES modulos(id_modulo),
    FOREIGN KEY (id_serie) REFERENCES series(id_serie)
);

-- Tabela 5: CONTEÚDOS
CREATE TABLE conteudos(
 id_conteudo INT AUTO_INCREMENT PRIMARY KEY,
 id_materia INT NOT NULL,
 titulo TEXT NOT NULL,
 texto TEXT,
 data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP,
 ordem INTEGER,
 FOREIGN KEY (id_materia) REFERENCES materias(id_materia)
 );

-- Tabela 8: VIDEOAULAS (Removida coluna 'video_aula' redundante)
create table video_aula(
    id_video int auto_increment primary key,
    nome_video varchar(100) not null,
    video_url varchar (255) not null
);


INSERT INTO usuarios (usuario, email, senha_hash) VALUES
('Gustavo', 'gustavo@email.com', '123'),
('Maria Silva', 'maria@email.com', 'abc'),
('Aluno Teste', 'aluno@teste.com', 'xyz');



INSERT INTO modulos (modulo) VALUES
('Fundamental 1'),
('Fundamental 2'),
('Ensino Médio');


INSERT INTO series (serie, id_modulo) VALUES
('1ª Ano', 1),
('2ª Ano', 1),
('3ª Ano', 1),
('4ª Ano', 1),
('5ª Ano', 1),
('6ª Ano', 2),
('7ª Ano', 2),
('8ª Ano', 2),
('9ª Ano', 2),
('1º Serie', 3),
('2º Serie', 3),
('3º Serie', 3);

select*from materias;

INSERT INTO materias (materia, id_modulo, id_serie) VALUES
-- FUND 2
('Português', 2, 6),
('Matemática', 2, 6),
('Ciências', 2, 6),
('História', 2, 6),
('Geografia', 2, 6),
('Artes', 2, 6),
('Inglês', 2, 6),
('Educação Física', 2, 6),

('Português', 2, 7),
('Matemática', 2, 7),
('Ciências', 2, 7),
('História', 2, 7),
('Geografia', 2, 7),
('Artes', 2, 7),
('Inglês', 2, 7),
('Educação Física', 2, 7),

('Português', 2, 8),
('Matemática', 2, 8),
('Ciências', 2, 8),
('História', 2, 8),
('Geografia', 2, 8),
('Artes', 2, 8),
('Inglês', 2, 8),
('Educação Física', 2, 8),

('Português', 2, 9),
('Matemática', 2, 9),
('Ciências', 2, 9),
('História', 2, 9),
('Geografia', 2, 9),
('Artes', 2, 9),
('Inglês', 2, 9),
('Educação Física', 2, 9),


-- ENSINO MÉDIO
('Português', 3, 10),
('Matemática', 3, 10),
('História', 3, 10),
('Geografia', 3, 10),
('Sociologia', 3, 10),
('Filosofia', 3, 10),
('Física', 3, 10),
('Química', 3, 10),
('Biologia', 3, 10),
('Inglês', 3, 10),
('Artes', 3, 10),
('Educação Física', 3, 10),

-- ENSINO MÉDIO
('Português', 3, 11),
('Matemática', 3, 11),
('História', 3, 11),
('Geografia', 3, 11),
('Sociologia', 3, 11),
('Filosofia', 3, 11),
('Física', 3, 11),
('Química', 3, 11),
('Biologia', 3, 11),
('Inglês', 3, 11),
('Artes', 3, 11),
('Educação Física', 3, 11),

-- ENSINO MÉDIO
('Português', 3, 12),
('Matemática', 3, 12),
('Geografia', 3, 12),
('História', 3, 12),
('Física', 3, 12),
('Química', 3, 12),
('Artes', 3, 12),
('Inglês', 3, 12),
('Educação Física', 3, 12);





-- 6º ANO CONTEUDOS

-- PORTUGUÊS 6° (ID 1)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(1, 'Sílabas ', 'Sílabas são fonemas emitidos de uma só vez. Isso é percebido mais facilmente quando 
fazemos exercícios de separação silábica e dividimos as palavras conforme elas são 
pronunciadas. 
Assim, a palavra mar tem uma sílaba, enquanto on-da tem duas;  
bi-quí-ni, três e  
bra-si-lei-ros, quatro sílabas. 
Em cada sílaba há sempre uma vogal, por isso, lembre-se: as vogais são um elemento 
obrigatório; não existe sílaba sem vogal! 
Classificação das palavras quanto ao número de sílabas 
As palavras são classificadas conforme o número de sílabas: 
• monossílabas: palavras que têm apenas uma sílaba. Exemplos: mão, pai, pé. 
• dissílabas: palavras que têm duas sílabas. Exemplos: pa-pai, sal-to, ta-to. 
• trissílabas: palavras que têm três sílabas. Exemplos: cor-ti-na, sa-co-la, sa-pa-to. 
• polissílabas: palavras que têm quatro ou mais sílabas. Exemplos: bi-lhe-te-ri-a, 
com-pu-ta-dor, fo-to-gra-fi-a. 
Classificação das palavras quanto ao acento tônico 
As sílabas são classificadas conforme a intensidade e a localização da sílaba tônica. 
Classificação conforme a INTENSIDADE com que são pronunciadas: 
• sílabas tônicas: sílabas emitidas com intensidade maior, por exemplo, ge-ne-ro
si-da-de. 
• sílabas subtônicas: sílabas emitidas com intensidade média, por exemplo, ge
ne-ro-si-da-de. 
• sílabas átonas: sílabas emitidas com intensidade menor, por exemplo, ge-ne-ro
si-da-de. 
Classificação conforme a LOCALIZAÇÃO DA SÍLABA TÔNICA: 
• oxítonas: a sílaba mais forte é a última sílaba da palavra. Exemplos: a-tum, cha
péu, vo-cê. 
• paroxítonas: a sílaba mais forte é a penúltima sílaba da palavra. Exemplos: ca
dei-ra, ja-ne-la, te-cla-do 
• proparoxítonas: a sílaba mais forte é a antepenúltima sílaba da palavra. 
Exemplos: ár-vo-re, aus-trí-a-co, lâm-pa-da. 
Sílabas canônicas e não canônicas 
As sílabas canônicas são aquelas formadas por uma consoante e uma vogal (C + V), 
seguindo sempre essa ordem. 
As sílabas não canônicas não seguem essa disposição. Elas podem ser formadas 
somente por vogal (V) ou por vogal e consoante (V + C), entre outras opções, tal como 
acontece com os encontros consonantais. 
Exemplos: ad-je-ti-vo, ca-ne-ta, e-la, es-co-la. 
• São sílabas canônicas: -je, -ti, -vo (da palavra adjetivo); ca-,-ne,-ta (da palavra 
caneta); -la (da palavra ela); -co,-la (da palavra escola). 
• São sílabas não canônicas: ad- (da palavra adjetivo); e-(da palavra ela). 
Sílabas abertas e fechadas 
As sílabas abertas terminam por uma vogal, enquanto as fechadas terminam por 
consoante. 
• Exemplos de sílabas abertas: a-ba-ca-te, ci-da-de, ma-la. 
• Exemplos de sílabas fechadas: ad-ver-tir, al-tar, op-tar. ', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(1, 'Encontros Vocálicos e Consonantais', 'Encontros vocálicos são encontros de vogais ou semivogais, sem consoantes 
intermediárias. 
Eles acontecem na mesma ou em outra sílaba, sendo classificados 
em: ditongo, tritongo e hiato. 
Isso quer dizer que quando vogais ou semivogais (sons vocálicos ditos com menos 
força) aparecem umas ao lado das outras numa palavra, acontece um encontro 
vocálico. Se uma consoante aparecer entre as vogais ou semivogais, elas deixam de 
estar juntas e não ocorre o encontro vocálico. 
Exemplos: lua, madeira, Uruguai. 
Nos hiatos, ocorre apenas o encontro de vogais (nunca de semivogais), e quando 
fazemos a separação das suas sílabas, cada vogal fica numa sílaba diferente. Exemplos: 
álcool (ál-co-ol), navio (na-vi-o), saída (sa-í-da). 
Nos ditongos, ocorre o encontro de uma vogal com uma semivogal, e quando fazemos 
a separação das suas sílabas, as duas ficam na mesma sílaba. Exemplos: papai (pa
pai), oi (a palavra "oi" não se separa), sabão (sa-bão). 
Nos tritongos, ocorre o encontro semivogal, vogal e semivogal (sempre nessa ordem), e 
quando fazemos a separação das suas sílabas, as três ficam na mesma sílaba. 
Exemplos: iguais (i-guais), saguão (sa-guão), uruguaio (u-ru-guai-o). 
Ditongo 
Ditongo é o encontro vocálico em que uma vogal e uma semivogal ficam juntas, mesmo 
quando se faz a separação de sílabas. Exemplos: céu (céu), tranquilo (tran-qui-lo), boi 
(boi). 
De acordo com a posição da vogal e da semivogal, os ditongos podem ser: crescentes 
ou decrescentes. 
Ditongos crescentes são aqueles em que a semivogal vem antes da vogal (sv + v). 
Exemplos: igual (i-gual), quota (quo-ta), pátria (pá-tria). 
Ditongos decrescentes são aqueles em que a vogal vem antes da semivogal (v + sv). 
Exemplos: meu (meu), herói (he-rói), cai (cai). 
De acordo com a pronúncia, os ditongos podem ser orais ou nasais. 
Ditongos orais são os pronunciados apenas pela boca. É o caso de ai, ia, iu, ui, eu, éu, 
ue, ei, éi, ie, oi, ói, io, au, ua, ao, oa, ou, uo, oe, eo, ea. Exemplos: mau (mau), sei (sei), 
viu (viu). 
Ditongos nasais são os pronunciados pela boca e pelo nariz. É o caso de ão, ãe, õe, am, 
an, em, en, ãi, ui (ocorre apenas na palavra "muito"). Exemplos: mãe (mãe), levem (le
vem), muito (mui-to). 
Palavras com ditongo 
• automóvel (au-to-mó-vel) 
• boi (boi) 
• cai (cai) 
• céu (céu) 
• deus (deus) 
• eu (eu) 
• frequente (fre-quen-te) 
• gratuito (gra-tui-to) 
• herói (he-rói) 
• igual (i-gual) 
• jeito (jeito) 
• levem (le-vem) 
• madeira (ma-dei-ra) 
• mãe (mãe) 
• mau (mau) 
• meu (meu) 
• muito (mui-to) 
• noite (noi-te) 
• oi (oi) 
• outro (ou-tro) 
• papai (pa-pai) 
• pátria (pá-tria 
• quota (quo-ta) 
• respeito (res-pei-to) 
• sabão (sa-bão) 
• sei (sei) 
• tranquilo (tran-qui-lo) 
• viu (viu) 
Tritongo 
Tritongo é o encontro vocálico em que semivogal + vogal + semivogal ficam juntas, 
mesmo quando se faz a separação de sílabas. Exemplos: Uruguai (U-ru-guai), saguão 
(sa-guão), enxaguam (en-xa-guam). 
Os tritongos podem ser orais ou nasais. 
Tritongos orais são os pronunciados apenas pela boca. Exemplos: Paraguai (Pa-ra-guai), 
enxaguei (en-xa-guei), iguais (i-guais). 
Tritongos nasais são os pronunciados pela boca e pelo nariz. As consoantes "m" e "n" 
podem acompanhar os tritongos. Quando isso acontecer, os tritongos são classificados 
como tritongos nasais. Exemplos: quão (quão), saguões (sa-guões), enxaguem (en-xa
guem). 
Palavras com tritongo 
• apaziguou (a-pa-zi-guou) 
• desaguou (de-sa-guou) 
• enxaguam (en-xa-guam) 
• enxaguei (en-xa-guei) 
• enxaguem (en-xa-guem) 
• iguais (i-guais) 
• minguem (min-guem) 
• Paraguai (Pa-ra-guai) 
• paraguaio (pa-ra-guai-o) 
• quais (quais) 
• quão (quão) 
• saguão (sa-guão) 
• saguões (sa-guões) 
• Uruguai (U-ru-guai) 
• uruguaio (u-ru-guai-o) 
• uruguaiano (u-ru-guai-a-no) 
Hiato 
Hiato é o encontro vocálico em que duas vogais aparecem juntas numa palavra, mas 
f
icam em sílabas diferentes quando se faz a separação de sílabas. Exemplos: raiz (ra-iz), 
Saara (Sa-a-ra), país (pa-ís). 
Palavras com hiato 
• afiado (a-fi-a-do) 
• águia (á-gui-a) 
• álcool (ál-co-ol) 
• baú (ba-ú) 
• coelho (co-e-lho) 
• dia (di-a) 
• elogio (e-lo-gi-o) 
• faísca (fa-ís-ca) 
• gênio (gê-ni-o) 
• hiato (hi-a-to) 
• iate (i-a-te) 
• juiz (ju-iz) 
• karaokê (ka-ra-o-kê) 
• leão (le-ão) 
• lua (lu-a) 
• moeda (mo-e-da) 
• navio (na-vi-o) 
• oceano (o-ce-a-no) 
• país (pa-ís) 
• quieto (qui-e-to) 
• raiz (ra-iz) 
• Saara (Sa-a-ra) 
• saída (sa-í-da) 
• tio (ti-o) 
• unicórnio (u-ni-cór-ni-o) 
• voo (vo-o) 
• zoológico (zo-o-ló-gi-co) 
Atenção! 
Os ditongos e os tritongos não se separam, somente os hiatos. 
Encontros vocálicos e consonantais 
Os encontros vocálicos são o encontro de vogais ou semivogais, sem consoantes entre 
elas. Exemplos: mãe, poeta, piada. 
Os encontros vocálicos são classificados em ditongo, tritongo e hiato. 
Os encontros consonantais são a sequência de duas ou mais consoantes, sem a 
presença de vogais entre elas. Exemplos: Brasil, cacto, flor, objetivo, psicologia. 
Os encontros consonantais podem ser separáveis ou inseparáveis. 
Encontros consonantais separáveis: quando a palavra é separada, as consoantes ficam 
em sílabas diferentes. Exemplos: advogado (ad-vo-ga-do), sorte (sor-te), torta (tor-ta). 
Encontros consonantais inseparáveis: quando a palavra é separada, as consoantes 
f
icam na mesma sílaba. Exemplos: blusa (blu-sa), livro (li-vro), trem (trem). ', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(1, 'Dígrafos', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(1, 'Substantivos', 'Substantivo é a classe de palavras usada para dar nome aos seres, objetos, fenômenos, 
lugares, qualidades, ações, dentre outros. 
Exemplos: menino, João, Portugal, caneta, ventania, coragem, corrida. 
Os substantivos podem ser flexionados em gênero (masculino e 
feminino), número (singular e plural) e grau (aumentativo e diminutivo). 
Classificação dos substantivos 
Os substantivos são classificados em: comum, próprio, simples, composto, concreto, 
abstrato, primitivo, derivado e coletivo. 
1. Substantivos comuns 
Os substantivos são comuns se eles dão nome a seres de forma genérica. 
Exemplos: pessoa, gente, país. 
2. Substantivos próprios 
Os substantivos são próprios quando eles dão nome a seres de forma particular. Eles 
são escritos com letra maiúscula. 
Exemplos: Maria, São Paulo, Brasil. 
3. Substantivos simples 
Os substantivos simples são formados por apenas um radical (radical é a parte da 
palavra que contém o seu significado básico). 
Exemplos: casa, carro, camiseta. 
4. Substantivos compostos 
Os substantivos compostos são formados por mais de um radical (radical é a parte da 
palavra que contém o seu significado básico). 
Exemplos: guarda-chuva, passatempo, beija-flor. 
5. Substantivos concretos 
Os substantivos concretos designam as palavras reais, concretas, sejam elas pessoas, 
objetos, animais ou lugares. 
Exemplos: menina, homem, cachorro. 
6. Substantivos abstratos 
Os substantivos abstratos são aqueles relacionados aos sentimentos, estados, 
qualidades e ações. 
Exemplos: beleza, alegria, bondade. 
7. Substantivos primitivos 
Os substantivos primitivos, como o próprio nome indica, são aqueles que não derivam 
de outras palavras. 
Exemplos: casa, folha, chuva. 
8. Substantivos derivados 
Os substantivos derivados são aquelas palavras que derivam de outras. 
Exemplos: casarão (derivado de casa), folhagem (derivado de folha), chuvarada 
(derivado de chuva). 
9. Substantivos coletivos 
Os substantivos coletivos são aqueles que se referem a um conjunto de seres. 
Exemplos: flora (conjunto de plantas), álbum (conjunto de fotos), colmeia (conjunto de 
abelhas). 
Flexão de gênero dos substantivos 
Conforme o gênero (feminino e masculino) dos substantivos, eles são classificados em: 
biforme e uniforme. 
Substantivos biformes - apresentam duas formas, ou seja, uma para o masculino e 
outra para o feminino. Exemplos: professor e professora; amigo e amiga. 
Substantivos uniformes - somente um termo especifica os dois gêneros (masculino e 
feminino), sendo classificados em: epiceno, sobrecomum e comum de dois gêneros. 
• Epicenos: apresenta somente um gênero e refere-se aos animais. Exemplo: foca 
(macho ou fêmea). 
• Sobrecomum: apresenta somente um gênero e refere-se às pessoas. Exemplo: 
criança (masculino e feminino). 
• Comum de dois gêneros: termo que se refere aos dois gêneros (masculino e 
feminino), identificado por meio do artigo que o acompanha. Exemplo: 
"o artista" e "a artista". 
Os substantivos de origem grega terminados em "ema" e "oma" são masculinos, por 
exemplo: teorema, poema. 
Há os substantivos chamados de "gênero duvidoso ou incerto", ou seja, aqueles 
utilizados para os dois gêneros sem alteração do significado, por exemplo: o 
personagem e a personagem. 
Existem alguns substantivos que, variando de gênero, mudam seu significado, por 
exemplo: "o cabeça" (líder), "a cabeça" (parte do corpo humano). 
Flexão de número dos substantivos 
Conforme o número do substantivo, eles são classificados em: singular e plural. 
Singular - designa uma única coisa, pessoa ou um grupo. Exemplo: bola, mulher. 
Plural - designa várias coisas, pessoas ou grupos. Exemplo: bolas, mulheres. 
Flexão de grau dos substantivos 
Conforme o grau dos substantivos, eles são classificados em: aumentativo e 
diminutivo. 
Aumentativo - indica o aumento do tamanho de algum ser ou alguma coisa. 
Diminutivo - indica a diminuição do tamanho de algum ser ou alguma coisa. 
Os graus aumentativo e diminutivo podem ser analíticos e sintéticos. 
O aumentativo analítico é acompanhado de um adjetivo que indica grandeza. 
Exemplo: casa grande. 
O aumentativo sintético recebe o acréscimo de um sufixo indicador de aumento. 
Exemplo: casarão. 
O diminutivo analítico é acompanhado de um adjetivo que indica pequenez. Exemplo: 
casa pequena. 
O diminutivo sintético recebe o acréscimo de um sufixo indicador de diminuição. 
Exemplo: casinha. 
Relação entre adjetivos e substantivos 
Os adjetivos correspondem à classe de palavras que indicam qualidades e estados aos 
substantivos, por exemplo: casa bonita. Aqui, o termo "bonita" atribui uma qualidade 
ao substantivo "casa". ', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(1, 'Adjetivos', 'O adjetivo é uma classe de palavras que atribui características aos substantivos, ou 
seja, ele indica suas qualidades e estados. 
Essas palavras variam em gênero (feminino e masculino), número (singular e plural) e 
grau (comparativo e superlativo). 
Exemplos de adjetivos: 
• garota bonita 
• garotas bonitas 
• criança obediente 
• crianças obedientes 
Tipos de adjetivos 
Os adjetivos podem variar em gênero (masculino/feminino), número (singular/plural) e 
grau (aumentativo/diminutivo) para concordar com o substantivo a que se referem. 
Além disso, também são classificados de acordo com sua função e formação. 
Adjetivo simples 
São formados por apenas um radical, ou seja, uma única parte que carrega o 
significado básico da palavra. 
Exemplos: pobre, magro, triste, lindo, bonito, feio. 
Adjetivo composto 
São adjetivos formados por mais de um radical, ou seja, resultam da junção de duas ou 
mais palavras. Eles podem ser escritos com hífen ou sem, dependendo das regras 
ortográficas. A formação desses adjetivos pode ocorrer por justaposição (palavras 
unidas sem alteração) ou por aglutinação (palavras unidas com alteração fonética). 
Exemplos: luso-brasileiro (português + brasileiro), superinteressante (super + 
interessante), rosa-claro (rosa + claro), amarelo-ouro (amarelo + ouro), socioeconômico 
(social + econômico). 
Adjetivo primitivo 
Adjetivos que dão origem a outras palavras, como substantivos ou outros adjetivos. 
Eles são a base para a formação de derivados. 
Exemplos: bom (origina bondade), alegre (origina alegria), puro (origina pureza), triste 
(origina tristeza), notável (origina notabilidade). 
Adjetivo derivado 
São adjetivos que derivam de outras palavras, como substantivos, verbos ou até 
mesmo outros adjetivos. Eles são formados por meio de processos de derivação, como 
acréscimo de sufixos ou prefixos. 
Exemplos: articulado (verbo articular), visível (verbo ver), formoso (substantivo 
formosura), tristonho (substantivo tristeza). 
Adjetivo pátrio (adjetivo gentílico) 
Indicam a origem geográfica, nacionalidade ou localidade de uma pessoa, animal ou 
coisa. Eles são utilizados para identificar a procedência de algo ou alguém. Os adjetivos 
pátrios podem variar conforme a região ou o país. Por exemplo, quem nasce no Brasil é 
"brasileiro", enquanto quem nasce em São Paulo é "paulista". 
Exemplos: brasileiro, carioca, paulista, europeu, espanhol. 
O gênero dos adjetivos 
Em relação aos gêneros (masculino e feminino), os adjetivos são divididos em dois 
t
ipos: 
1. Adjetivos uniformes - apresentam uma forma para os dois gêneros (feminino e 
masculino). Exemplo: menino feliz; menina feliz. 
2. Adjetivos biformes - a forma varia conforme o gênero (masculino e feminino). 
Exemplo: homem carinhoso; mulher carinhosa. 
O número dos adjetivos 
Os adjetivos podem estar no singular ou no plural, concordando com o número do 
substantivo a que se referem. Assim, a sua formação se assemelha à dos substantivos. 
Exemplos: 
• Pessoa feliz - pessoas felizes 
• Vale formoso - vales formosos 
• Casa enorme - casas enormes 
• Problema socioeconômico - problemas socioeconômicos 
• Menina afro-brasileira - meninas afro-brasileiras 
• Estudante mal-educado - estudantes mal-educados 
O grau dos adjetivos 
Quanto ao grau, os adjetivos são classificados em dois tipos: 
1. Comparativo: utilizado para comparar qualidades. 
2. Superlativo: utilizado para intensificar qualidades. 
Grau comparativo 
• Comparativo de Igualdade - O professor de matemática é tão bom quanto o de 
geografia. 
• Comparativo de Superioridade - Marta é mais habilidosa do que a Patrícia. 
• Comparativo de Inferioridade - João é menos feliz que Pablo. 
Grau superlativo 
• Superlativo Absoluto: refere-se a um substantivo somente, sendo classificados 
em: 
o Analítico - A moça é extremamente organizada. 
o Sintético - Luiz é inteligentíssimo. 
o Superlativo Relativo: refere-se a um conjunto, sendo classificados em: 
o Superioridade - A menina é a mais inteligente da turma. 
o Inferioridade - O garoto é o menos esperto da classe. 
A locução adjetiva 
A locução adjetiva é o conjunto de duas ou mais palavras que possuem valor de 
adjetivo. 
Exemplos: 
• Amor de mãe - Amor maternal 
• Doença de boca - doença bucal 
• Pagamento do mês - pagamento mensal 
• Férias do ano - férias anual 
• Dia de chuva - dia chuvoso 
O pronome adjetivo 
Os pronomes adjetivos são aqueles em que o pronome exerce a função de adjetivo. 
Surgem acompanhados do substantivo, modificando-os. Exemplos: 
• Este livro é muito bom. 
Acompanha o substantivo "livro", especificando-o. 
• Aquela é a empresa onde ele trabalha. 
Acompanha o substantivo "empresa", especificando-o.', '2025-12-07', 5);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(1, 'Gênero Narrativo', 'Texto narrativo é um tipo de texto que esboça as ações de personagens num 
determinado tempo e espaço. 
Geralmente, ele é escrito em prosa e nele são narrados (contados) alguns fatos e 
acontecimentos. 
Alguns exemplos de textos narrativos são: romance, novela, conto, crônica e fábula. 
Estrutura da narrativa 
Apresentação - também chamada de introdução, nessa parte inicial o autor do texto 
apresenta os personagens, o local e o tempo em que se desenvolverá a trama. 
Desenvolvimento - aqui grande parte da história é desenvolvida com foco nas ações 
dos personagens. 
Clímax - parte do desenvolvimento da história, o clímax designa o momento mais 
emocionante da narrativa. 
Desfecho - também chamada de conclusão, ele é determinado pela parte final da 
narrativa, onde a partir dos acontecimentos, os conflitos vão sendo desenvolvidos. 
Elementos da narrativa 
Narrador - é aquele que narra a história. Dividem-se em: narrador observador, 
narrador personagem e narrador onisciente. 
Enredo - são os acontecimentos da narrativa, ou seja, a trama em que se desenrolam 
as ações. São classificados em: enredo linear e enredo não linear. 
Personagens - são aqueles que compõem a narrativa, sendo classificados em: 
personagens principais (protagonista e antagonista) e personagens secundários 
(adjuvante ou coadjuvante). 
Tempo - está relacionado com a marcação do tempo dentro da narrativa, por exemplo, 
uma data ou um momento específico. O tempo pode ser cronológico ou psicológico. 
Espaço - local (s) onde a narrativa se desenvolve. Podem ocorrer num ambiente físico, 
ambiente psicológico ou ambiente social. 
Tipos de narrador 
Os tipos de narrador, também chamado de foco narrativo, representam a "voz textual" 
da narração, sendo classificados em: 
Narrador personagem (1ª pessoa) - a história é narrada em 1ª pessoa onde o narrador 
é um personagem e participa das ações. 
Narrador observador (3ª pessoa) - narrado em 3ª pessoa, esse tipo de narrador 
conhece os fatos, porém, não participa da ação. 
Narrador onisciente (3ª, mas também 1ª pessoa) - esse narrador conhece todos os 
personagens e a trama. Nesse caso, a história é narrada em 3ª pessoa. No entanto, 
quando apresenta fluxo de pensamentos dos personagens, ela é narrada em 1ª pessoa. 
Tipos de discurso narrativo 
Discurso direto - no discurso direto, a própria personagem fala. 
Discurso indireto - no discurso indireto o narrador interfere na fala da personagem. Em 
outras palavras, é narrado em 3ª pessoa, uma vez que não aparece a fala da 
personagem. 
Discurso indireto livre - no discurso indireto livre há intervenções do narrador e das 
falas dos personagens. Nesse caso, funde-se o discurso direto com o indireto. 
Exemplos de texto narrativo 
Exemplo 1: O cavalo e o burro, fábula de Monteiro Lobato, no discurso direto 
"O cavalo e o burro seguiam juntos para a cidade. O cavalo contente da vida, folgando 
com uma carga de quatro arrobas apenas, e o burro — coitado! gemendo sob o peso 
de oito. Em certo ponto, o burro parou e disse: 
— Não posso mais! Esta carga excede às minhas forças e o remédio é repartirmos o 
peso irmanamente, seis arrobas para cada um. 
O cavalo deu um pinote e relinchou uma gargalhada. 
— Ingênuo! Quer então que eu arque com seis arrobas quando posso bem continuar 
com as quatro? Tenho cara de tolo? 
O burro gemeu: 
— Egoísta! Lembre-se que se eu morrer você terá que seguir com a carga de quatro 
arrobas e mais a minha. 
O cavalo pilheriou de novo e a coisa ficou por isso. Logo adiante, porém, o burro 
tropica, vem ao chão e rebenta. 
Chegam os tropeiros, maldizem a sorte e sem demora arrumam as oito arrobas do 
burro sobre as quatro do cavalo egoísta. E como o cavalo refuga, dão-lhe de chicote em 
cima, sem dó nem piedade. 
— Bem feito! Exclamou um papagaio. Quem o mandou ser mais burro que o pobre 
burro e não compreender que o verdadeiro egoísmo era aliviá-lo da carga em excesso? 
Tome! Gema dobrado agora…" 
LOBATO, Monteiro. Fábulas. São Paulo: Brasiliense, 1994. 
Exemplo 2: Trecho de Vidas Secas, de Graciliano Ramos, no discurso indireto 
"Julgou-a estúpida e egoísta, deixou-a, indignada, foi puxar a manga do vestido da mãe, 
desejando comunicar-se com ela. Sinha Vitória soltou uma exclamação de 
aborrecimentos, e, como o pirralho insistisse, deu-lhe um cascudo." 
(Trecho de Vi, de de Vidas Secas, de Graciliano Ramos) 
Exemplo 3: Trecho de As Mãos de Meu Filho, de Érico Veríssimo, no discurso indireto 
livre 
"D. Margarida tira os sapatos que lhe apertam os pés, machucando os calos. 
Não faz mal. Estou no camarote. Ninguém vê. 
Mexe os dedos do pé com delícia. Agora sim, pode ouvir melhor o que ele está 
tocando, ele, o seu Gilberto. Parece um sonho… Um teatro deste tamanho. Centenas 
de pessoas finas, bem-vestidas, perfumadas, os homens de preto, as mulheres com 
vestidos decotados — todos parados, mal respirando, dominados pelo seu filho, pelo 
Betinho! 
D. Margarida olha com o rabo dos olhos para o marido. Ali está ele a seu lado, 
pequeno, encurvado, a calva a reluzir foscamente na sombra, a boca entreaberta, o ar 
pateta. Como fica ridículo nesse smoking! O pescoço descarnado, dançando dentro do 
colarinho alto e duro, lembra um palhaço de circo." 
(Trecho de As mãos de meu filho, de Érico Veríssimo)', '2025-12-07', 6);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(1, 'Conto', 'O conto é um texto curto em que um narrador conta uma história desenvolvida em 
torno de um enredo - uma situação que dá origem aos acontecimentos de uma 
narrativa. 
Há poucos personagens e poucos locais, pois como a história é breve não é possível 
incluir vários lugares e personagens diferentes. 
Há vários tipos de contos: realistas, populares, fantásticos, de terror, de humor, infantis, 
psicológicos, de fadas. 
A estrutura desse gênero textual é composta por quatro partes: apresentação do 
enredo, desenvolvimento dos acontecimentos, momento de tensão - clímax, e solução - desfecho. 
Alguns exemplos de contos escritos pelos maiores contistas brasileiros são: 
• A Cartomante, de Machado de Assis 
• O Gato Vaidoso, de Monteiro Lobato 
• Presépio, de Carlos Drummond de Andrade 
• Feliz Aniversário, de Clarice Lispector 
• A Caçada, de Lygia Fagundes Telles 
• Conto de Verão n.º 2: Bandeira Branca, de Luis Fernando Verissimo 
• O Vampiro de Curitiba, de Dalton Trevisan 
Características do conto 
O conto apresenta as seguintes características: 
• Espaço delimitado; 
• Tempo marcado; 
• Presença de narrador; 
• Poucos personagens; 
• Enredo. 
Espaço delimitado: o local em que se desenvolve a história é delimitado, como uma 
determinada casa, rua, parque, praça. Isso acontece pelo fato de o conto ser uma 
narrativa breve, em que não é possível se falar em muitos espaços diferentes. 
Tempo marcado: o tempo do conto é marcado. Isso quer dizer que é possível saber em 
que momento a história acontece. Esse tempo pode ser: 
cronológico - quando as coisas acontecem numa sequência normal, de horas, dias, 
anos. 
psicológico - quando as coisas não acontecem numa sequência normal, mas de acordo 
com a imaginação do narrador ou de um personagem. 
Narrador: a história do conto é contada por um narrador, que pode ser: 
• narrador observador, aquele que conhece a história, mas não participa dela. 
• narrador personagem, aquele que além de narrar a história, também é um dos 
seus personagens. 
• narrador onisciente, aquele que conhece a história e todos os personagens 
envolvidos nela. 
Personagens: o conto contém poucos personagens, porque como é um texto breve, 
não é possível incluir muitos participantes na história. Os personagens podem ser 
principais ou secundários. 
Enredo: o conto apresenta sempre um enredo, que é um problema ou situação que dá 
origem aos acontecimentos de uma história. Ele pode ser: 
linear - quando os fatos seguem uma sequência lógica, ou seja: apresentação, 
desenvolvimento, momento de tensão - clímax, e solução - desfecho. 
não linear - quando os fatos não seguem uma sequência lógica, ou seja, em vez de 
começar pela apresentação do problema ou da situação, pode começar pela sua 
solução e os acontecimentos são narrados ao longo do conto. 
Tipos de contos 
Dependendo da temática explorada, há diversos tipos de contos, do qual se destacam: 
• Contos realistas, os que narram situações realistas e não imaginárias. 
• Contos populares, os que narram histórias transmitidas de uma geração para 
outra. 
• Contos fantásticos, aqueles em que as histórias apresentam mistura de 
realidade com ficção e confundem os leitores com acontecimentos absurdos. 
• Contos de terror, os que narram histórias cheias de mistérios, suspense e 
medo. 
• Contos de humor, os que narram histórias que têm como objetivo divertir os 
leitores. 
• Contos infantis, os que narram histórias para crianças e que têm a intenção de 
transmitir uma lição moral. 
• Contos psicológicos, os que narram histórias que envolvem lembranças e 
sentimentos, e têm a intenção de levar o leitor a refletir. 
• Contos de fadas, os que narram histórias que envolvem príncipes e princesas, e 
se desenvolvem em torno de um acontecimento trágico, mas que têm um final 
feliz. 
Os minicontos, microcontos ou nanocontos são subcategorias do conto, chamados de 
"contos minimalistas". 
Eles são bem menores que o conto, uma vez que podem ocupar meia página, uma 
página, ou ser formado por poucas linhas. 
Mesmo que não compartilhem da estrutura básica dos contos, esse tipo de texto tem 
adquirido diversas formas na atualidade, sobretudo após o movimento modernista. 
Dessa forma, ele deixa de lado a estrutura fixa narrativa, privilegiando assim, a 
liberdade criativa dos escritores. 
Estrutura do conto 
A estrutura do conto é fechada e objetiva, na medida em que esse tipo de texto é 
formado por apenas uma história e um conflito. 
Sua estrutura está dividida em três partes: 
• Introdução: nesse momento inicial, há uma breve ambientação do espaço, 
tempo, personagens e enredo. 
• Desenvolvimento: aqui se desenrolam os acontecimentos da história, 
relacionados com o problema ou a situação apresentado na introdução. 
• Clímax: quando acontece o momento de maior tensão da história. 
• Desfecho: encerramento da narrativa, em que se apresenta uma solução para o 
enredo. 
Exemplos de conto 
Trecho do conto Missa do Galo, de Machado de Assis 
“NUNCA PUDE entender a conversação que tive com uma senhora, há muitos anos, 
contava eu dezessete, ela trinta. Era noite de Natal. Havendo ajustado com um vizinho 
irmos à missa do galo, preferi não dormir; combinei que eu iria acordá-lo à meia-noite. 
A casa em que eu estava hospedado era a do escrivão Meneses, que fora casado, em 
primeiras núpcias, com uma de minhas primas A segunda mulher, Conceição, e a mãe 
desta acolheram-me bem quando vim de Mangaratiba para o Rio de Janeiro, meses 
antes, a estudar preparatórios. Vivia tranquilo, naquela casa assobradada da Rua do 
Senado, com os meus livros, poucas relações, alguns passeios. A família era pequena, o 
escrivão, a mulher, a sogra e duas escravas. Costumes velhos. Às dez horas da noite 
toda a gente estava nos quartos; às dez e meia a casa dormia. Nunca tinha ido ao 
teatro, e mais de uma vez, ouvindo dizer ao Meneses que ia ao teatro, pedi-lhe que me 
levasse consigo. Nessas ocasiões, a sogra fazia uma careta, e as escravas riam à 
socapa; ele não respondia, vestia-se, saía e só tornava na manhã seguinte. Mais tarde 
é que eu soube que o teatro era um eufemismo em ação. Meneses trazia amores com 
uma senhora, separada do marido, e dormia fora de casa uma vez por semana. 
Conceição padecera, a princípio, com a existência da comborça; mas afinal, resignara
se, acostumara-se, e acabou achando que era muito direito. 
Remover anúncios 
Boa Conceição! Chamavam-lhe "a santa", e fazia jus ao título, tão facilmente suportava 
os esquecimentos do marido. Em verdade, era um temperamento moderado, sem 
extremos, nem grandes lágrimas, nem grandes risos. No capítulo de que trato, dava 
para maometana; aceitaria um harém, com as aparências salvas. Deus me perdoe, se a 
julgo mal. Tudo nela era atenuado e passivo. O próprio rosto era mediano, nem bonito 
nem feio. Era o que chamamos uma pessoa simpática. Não dizia mal de ninguém, 
perdoava tudo. Não sabia odiar; pode ser até que não soubesse amar. 
Naquela noite de Natal foi o escrivão ao teatro. Era pelos anos de 1861 ou 1862. Eu já 
devia estar em Mangaratiba, em férias; mas fiquei até o Natal para ver “a missa do 
galo na Corte”. A família recolheu-se à hora do costume; eu meti-me na sala da frente, 
vestido e pronto. Dali passaria ao corredor da entrada e sairia sem acordar ninguém. 
Tinha três chaves a porta; uma estava com o escrivão, eu levaria outra, a terceira 
f
icava em casa. 
— Mas, Sr. Nogueira, que fará você todo esse tempo? perguntou-me a mãe de 
Conceição. 
— Leio, D. Inácia. 
Tinha comigo um romance, Os Três Mosqueteiros, velha tradução creio do Jornal do 
Comércio. Sentei-me à mesa que havia no centro da sala, e à luz de um candeeiro de 
querosene, enquanto a casa dormia, trepei ainda uma vez ao cavalo magro de 
D. Artagnan e fui-me às aventuras. Dentro em pouco estava completamente ébrio de 
Dumas. Os minutos voavam, ao contrário do que costumam fazer, quando são de 
espera; ouvi bater onze horas, mas quase sem dar por elas, um acaso. Entretanto, um 
pequeno rumor que ouvi dentro veio acordar-me da leitura. Eram uns passos no 
corredor que ia da sala de visitas à de jantar; levantei a cabeça; logo depois vi assomar 
à porta da sala o vulto de Conceição. 
— Ainda não foi? perguntou ela. 
— Não fui, parece que ainda não é meia-noite. 
— Que paciência! (...)” 
Trecho do conto Felicidade Clandestina, de Clarice Lispector 
"Ela era gorda, baixa, sardenta e de cabelos excessivamente crespos, meio arruivados. 
Tinha um busto enorme, enquanto nós todas ainda éramos achatadas. Como se não 
bastasse enchia os dois bolsos da blusa, por cima do busto, com balas. Mas possuía o 
que qualquer criança devoradora de histórias gostaria de ter: um pai dono de livraria. 
Pouco aproveitava. E nós menos ainda: até para aniversário, em vez de pelo menos um 
livrinho barato, ela nos entregava em mãos um cartão-postal da loja do pai. Ainda por 
cima era de paisagem do Recife mesmo, onde morávamos, com suas pontes mais do 
que vistas. Atrás escrevia com letra bordadíssima palavras como “data natalícia” e 
“saudade”. 
Mas que talento tinha para a crueldade. Ela toda era pura vingança, chupando balas 
com barulho. Como essa menina devia nos odiar, nós que éramos imperdoavelmente 
bonitinhas, esguias, altinhas, de cabelos livres. Comigo exerceu com calma ferocidade o 
seu sadismo. Na minha ânsia de ler, eu nem notava as humilhações a que ela me 
submetia: continuava a implorar-lhe emprestados os livros que ela não lia. 
Até que veio para ela o magno dia de começar a exercer sobre mim uma tortura 
chinesa. Como casualmente, informou-me que possuía As reinações de Narizinho, de 
Monteiro Lobato. 
Era um livro grosso, meu Deus, era um livro para se ficar vivendo com ele, comendo-o, 
dormindo-o. E completamente acima de minhas posses. Disse-me que eu passasse pela 
sua casa no dia seguinte e que ela o emprestaria. 
Até o dia seguinte eu me transformei na própria esperança da alegria: eu não vivia, eu 
nadava devagar num mar suave, as ondas me levavam e me traziam. 
No dia seguinte fui à sua casa, literalmente correndo. Ela não morava num sobrado 
como eu, e sim numa casa. Não me mandou entrar. Olhando bem para meus olhos, 
disse-me que havia emprestado o livro a outra menina, e que eu voltasse no dia 
seguinte para buscá-lo. Boquiaberta, saí devagar, mas em breve a esperança de novo 
me tomava toda e eu recomeçava na rua a andar pulando, que era o meu modo 
estranho de andar pelas ruas de Recife. Dessa vez nem caí: guiava-me a promessa do 
livro, o dia seguinte viria, os dias seguintes seriam mais tarde a minha vida inteira, o 
amor pelo mundo me esperava, andei pulando pelas ruas como sempre e não caí 
nenhuma vez. 
Mas não ficou simplesmente nisso. O plano secreto da filha do dono de livraria era 
tranquilo e diabólico. No dia seguinte lá estava eu à porta de sua casa, com um sorriso 
e o coração batendo. Para ouvir a resposta calma: o livro ainda não estava em seu 
poder, que eu voltasse no dia seguinte. Mal sabia eu como mais tarde, no decorrer da 
vida, o drama do “dia seguinte” com ela ia se repetir com meu coração batendo. 
E assim continuou. Quanto tempo? Não sei. Ela sabia que era tempo indefinido, 
enquanto o fel não escorresse todo de seu corpo grosso. Eu já começara a adivinhar 
que ela me escolhera para eu sofrer, às vezes adivinho. Mas, adivinhando mesmo, às 
vezes aceito: como se quem quer me fazer sofrer esteja precisando danadamente que 
eu sofra."', '2025-12-07', 7);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(1, 'Fábula', 'Em breve', '2025-12-07', 8);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(1, 'Crônica', 'Em breve', '2025-12-07', 9);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(1, 'Lenda', 'Em breve', '2025-12-07', 10);

-- MATEMÁTICA 6° (ID 2)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(2, 'Números Naturais', 'Os Números Naturais N = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12...} 
são números inteiros positivos (não-negativos) que se agrupam num conjunto 
chamado de N, composto de um número ilimitado de elementos. Se um número é 
inteiro e positivo, podemos dizer que é um número natural. 
Quando o zero não faz parte do conjunto, é representado com um asterisco ao lado da 
letra N e, nesse caso, esse conjunto é denominado de Conjunto dos Números Naturais 
Não-Nulos: N* = {1, 2, 3, 4, 5, 6, 7, 8, 9...}. 
• Conjunto dos Números Naturais Pares = {0, 2, 4, 6, 8...} 
• Conjunto dos Números Naturais Ímpares = {1, 3, 5, 7, 9...} 
O conjunto de números naturais é infinito. Todos possuem um antecessor (número 
anterior) e um sucessor (número posterior), exceto o número zero (0). Assim: 
• o antecessor de 1 é 0 e seu sucessor é o 2; 
• o antecessor de 2 é 1 e seu sucessor é o 3; 
• o antecessor de 3 é 2 e seu sucessor é o 4; 
• o antecessor de 4 é 3 e seu sucessor é o 5. 
Cada elemento é igual ao número antecessor mais um, exceptuando-se o zero. Assim, 
podemos notar que: 
• o número 1 é igual ao anterior (0) + 1 = 1; 
• o número 2 é igual ao anterior (1) + 1 = 2; 
• o número 3 é igual ao anterior (2) + 1 = 3; 
• o número 4 é igual ao anterior (3) + 1 = 4. 
A função dos números naturais é contar e ordenar. Nesse sentido, vale lembrar que os 
homens, antes de inventarem os números, tinham muita dificuldade em realizar a 
contagem e ordenação das coisas. 
Segundo a história, essa necessidade começou com a dificuldade apresentada pelos 
pastores dos rebanhos em contarem suas ovelhas. 
Assim, alguns povos antigos, desde os egípcios e babilônios, utilizaram diversos 
métodos, desde acumular pedrinhas ou marcar as ovelhas. 
Algumas propriedades dos números naturais: 
• Ordem: Os números naturais são ordenados, o que significa que podemos 
compará-los entre si. Por exemplo, 5 é maior que 3. 
• Adição: A adição de números naturais é sempre um número natural. Por 
exemplo, 5 + 3 = 8. 
• Multiplicação: A multiplicação de números naturais é sempre um número 
natural. Por exemplo, 5 x 3 = 15. 
• Primo e composto: um número natural é primo se tiver apenas dois divisores: 1 
e ele mesmo. Caso contrário, é composto. 
Na matemática, as frações correspondem a uma representação das partes de um todo. 
Ela determina a divisão de partes iguais sendo que cada parte é uma fração do inteiro. 
Como exemplo podemos pensar numa pizza dividida em 8 partes iguais, sendo que 
cada fatia corresponde a 1/8 (um oitavo) de seu total. Se eu como 3 fatias, posso dizer 
que comi 3/8 (três oitavos) da pizza. 
Importante lembrar que nas frações, o termo superior é chamado 
de numerador enquanto o termo inferior é chamado de denominador. 
Tipos de Frações 
Fração Própria 
São frações em que o numerador é menor que o denominador, ou seja, representa um 
número menor que um inteiro. Ex: 2/7 
Fração Imprópria 
São frações em que o numerador é maior, ou seja, representa um número maior que o 
inteiro. Ex: 5/3 
Fração Aparente 
São frações em que o numerador é múltiplo ao denominador, ou seja, representa um 
número inteiro escrito em forma de fração. Ex: 6/3= 2 
Fração Mista 
É constituída por uma parte inteira e uma fracionária representada por números 
mistos. Ex: 1 2/6. (um inteiro e dois sextos) 
Obs: Há outros tipos de frações, são elas: equivalente, irredutível, unitária, egípcia, 
decimal, composta, contínua, algébrica. 
Você também pode se interessar por O que é fração? 
Operações com Frações 
Adição 
Para somar frações é necessário identificar se os denominadores são iguais ou 
diferentes. Se forem iguais, basta repetir o denominador e somar os numeradores. 
Contudo, se os denominadores são diferentes, antes de somar devemos transformar as 
frações em frações equivalentes de mesmo denominador. 
Neste caso, calculamos o Mínimo Múltiplo Comum (MMC) entre os denominadores das 
frações que queremos somar, esse valor passa a ser o novo denominador das frações. 
Além disso, devemos dividir o MMC encontrado pelo denominador e o resultado 
multiplicamos pelo numerador de cada fração. Esse valor passa a ser o novo 
numerador. 
Exemplos: 
Subtração 
A) 5/9 + 2/9 = 7/9 
B) 1/5 + 2/3 = 3.1 + 5.2/15 = 3+10/15 = 13/15 
C) 1/3 + ½ + 2/5 = 10.1 +15.1 + 6.2/30 = 10 + 15 + 12/30 = 37/30 
Para subtrair frações temos que ter o mesmo cuidado que temos na soma, ou seja, 
verificar se os denominadores são iguais. Se forem, repetimos o denominador e 
subtraímos os numeradores. 
Se forem diferentes, fazemos os mesmos procedimentos da soma, para obter frações 
equivalentes de mesmo denominador, aí sim podemos efetuar a subtração. 
Exemplos: 
A) 3/8 – 2/8 = 1/8 
B) 6/7 – 1/3 = 3.6 – 7.1/21 = 18 – 7/21 = 11/21 
Multiplicação 
A multiplicação de frações é feita multiplicando os numeradores entre si, bem como 
seus denominadores. 
Exemplos: 
A) ¾.1/5 = 3.1/4.5 = 3/20 
B) 7/8.3/5 = 21/40 
C) ½.1/3.5/7 = 1.1.5/2.3.7 = 5/42 
Divisão 
Na divisão entre duas frações, multiplica-se a primeira fração pelo inverso da segunda, 
ou seja, inverte-se o numerador e o denominador da segunda fração. 
Exemplos: 
A) 3/4: 3/2 = 3/4. 2/3 = 6/12 = ½ 
B) 15/8: 3 = 15/8. 1/3 = 14/24 = 5/8 
C) 3/8: 15/2 = 3/8.2/15 = 6/120 = 1/20 
História das Frações 
A história das frações remonta o Antigo Egito (3.000 a.C.) e traduz a necessidade e a 
importância para o ser humano acerca dos números fracionários. 
Naquele tempo, os matemáticos marcavam suas terras para delimitá-las. Com isso, nas 
épocas chuvosas o rio passava do limite e inundava muitas terras e, 
consequentemente, as marcações. 
Diante disso, os matemáticos resolveram demarcá-las com cordas a fim de resolver o 
problema inicial das enchentes. 
Contudo, notaram que muitos terrenos não eram compostos somente por números 
inteiros, havia os terrenos que mediam partes daquele total. 
Foi a partir disso, que os geômetras dos faraós do Egito, começaram a utilizar os 
números fracionários. Note que a palavra Fração é proveniente do latim fractus e 
significa “partido”. ', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(2, 'Números Decimais', 'Os números decimais são números racionais (Q) não inteiros expressos por vírgulas e 
que possuem casas decimais, por exemplo: 1,54; 4,6; 8,9, etc. Eles podem ser positivos 
ou negativos. 
As casas decimais são contadas a partir da vírgula, por exemplo o número 12,451 
possui três casas decimais, ou seja, três algarismos após a vírgula. 
Números Inteiros 
Diferente dos números decimais, os números inteiros são números reais (positivos ou 
negativos) representados pela letra Z. Eles não possuem vírgula, por exemplo: 1; 2; -3; 
4, etc. 
Números Fracionários 
Embora possam ter um valor correspondente, os números fracionários são expressos 
da seguinte maneira: 
• ½ (um meio) que corresponde ao decimal 0,5 
• ¾ (três quartos) que corresponde ao decimal 0,75 
• ¼ (um quarto) que corresponde a 0,25 
Logo, todos os números decimais podem ser expressos por frações. 
Leitura de Números Decimais 
A leitura dos números decimais é feita pela união da parte inteira do número (expressa 
antes da vírgula) e a quantidade de casas decimais (depois da vírgula) que corresponde 
a parte fracionária: décimo, centésimo, milésimo, décimo de milésimo, centésimo de 
milésimo, milionésimo, etc. 
Para compreender melhor, veja abaixo alguns exemplos: 
• 0,1: um décimo 
• 0,4: quatro décimos 
• 0,01: um centésimo 
• 0,35: trinta e cinco centésimos 
• 0,125: cento e vinte e cinco milésimos 
• 1,50: um inteiro e cinquenta centésimos 
• 2,1: dois inteiros e um décimo 
• 4,8: quatro inteiros e oito décimos 
Operações com Números Decimais 
Para realizar as operações dos números decimais, devemos alinhar os números 
segundo a vírgula e as casas decimais que possuem. 
Adição 
A) 0,2 + 0,9 = 1,1 
B) 2,35 + 0,17 = 2,52 
C) 89,36 + 0,035 + 97,89 = 187,285 
Subtração 
A) 0,3 – 0,1 = 0,2 
B) 25,4 – 13,2 = 12,2 
C) 356,85 – 114,3 – 0,35 = 242,2 
Multiplicação 
A) 3,2. 2,1 = 32 + 64 = 6,72 
B) 5,12. 0,8 = 4096 + 0 = 4,096 
C) 1,75. 3,11 = 175 + 175 + 525 = 5,4425 
Divisão 
A) 48,7: 0,8 = 68,875 ', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(2, 'Geometria', 'A geometria plana ou euclidiana é a parte da matemática que estuda as figuras que 
não possuem volume. 
A geometria plana também é chamada de euclidiana, uma vez que seu nome 
representa uma homenagem ao geômetra Euclides de Alexandria, considerado o “pai 
da geometria”. 
Curioso notar que o termo geometria é a união das palavras “geo” (terra) e “metria” 
(medida); assim, a palavra geometria significa a "medida de terra". 
Conceitos de Geometria Plana 
Alguns conceitos são de suma importância para o entendimento da geometria plana, a 
saber: 
Ponto 
Conceito adimensional, uma vez que não possui dimensão. Os pontos determinam 
uma localização e são indicados com letras maiúsculas. 
Reta 
A reta, representada por letra minúscula, é uma linha ilimitada unidimensional (possui 
o comprimento como dimensão) e pode se apresentar em três posições: 
• horizontal 
• vertical 
• inclinada 
Dependendo da posição das retas, quando elas se cruzam, ou seja, possuem um ponto 
em comum, são chamadas de retas concorrentes. 
Por outro lado, as que não possuem ponto em comum, são classificadas como retas 
paralelas. 
Segmento de Reta 
Diferente da reta, o segmento de reta é limitado pois corresponde a parte entre dois 
pontos distintos. 
A semirreta é limitada somente num sentido, visto que possui início e não possui fim. 
Plano 
Corresponde a uma superfície plana bidimensional, ou seja, possui duas dimensões: 
comprimento e largura. Nessa superfície que se formam as figuras geométricas. 
Ângulos 
Os ângulos são formados pela união de dois segmentos de reta, a partir de um ponto 
comum, chamado de vértice do ângulo. São classificados em: 
• ângulo reto (Â = 90º) 
• ângulo agudo (0º 
• ângulo obtuso (90º 
Área 
A área de uma figura geométrica expressa o tamanho de uma superfície. Assim, quanto 
maior a superfície da figura, maior será sua área. 
Perímetro 
O perímetro corresponde a soma de todos os lados de uma figura geométrica. 
Figuras da Geometria Plana 
Triângulo 
Polígono (figura plana fechada) de três lados, o triângulo é uma figura geométrica 
plana formada por três segmentos de reta. 
Segundo a forma dos triângulos, eles são classificados em: 
• triângulo equilátero: possui todos os lados e ângulos internos iguais (60°); 
• triângulo isósceles: possui dois lados e dois ângulos internos congruentes; 
• triângulo escaleno: possui todos os lados e ângulos internos diferentes. 
No tocante aos ângulos que formam os triângulos, eles são classificados em: 
• triângulo retângulo: possui um ângulo interno de 90°; 
• triângulo obtusângulo: possui dois ângulos agudos internos, ou seja, menor que 
90°, e um ângulo obtuso interno, maior que 90°; 
• triângulo acutângulo: possui três ângulos internos menores que 90°. 
Saiba mais sobre os triângulos com a leitura dos artigos: 
Quadrado 
Polígono de quatro lados iguais, o quadrado ou quadrilátero é uma figura geométrica 
plana que possuem os quatro ângulos congruentes: retos (90°). 
Retângulo 
Figura geométrica plana marcada por dois lados paralelos no sentido vertical e os 
outros dois paralelos, no horizontal. Assim, todos os lados do retângulo formam 
ângulos reto (90°). 
Círculo 
Figura geométrica plana caracterizada pelo conjunto de todos os pontos de um plano. 
O raio (r) do círculo corresponde a medida da distância entre o centro da figura até sua 
extremidade. 
Trapézio 
Chamado de quadrilátero notável, pois a soma dos seus ângulos internos corresponde 
a 360º, o trapézio é uma figura geométrica plana. 
Ele possui dois lados e bases paralelas, donde uma é maior e outra menor. São 
classificados em: 
• trapézio retângulo: possui dois ângulos de 90º; 
• trapézio isósceles ou simétrico: os lados não paralelos possuem a mesma 
medida; 
• trapézio escaleno: todos os lados de medidas diferentes. 
Losango 
Quadrilátero equilátero, ou seja, formado por quatro lados iguais, o losango, com o 
quadrado e o retângulo, é considerado um paralelogramo. 
Ou seja, é um polígono de quatro lados os quais possuem lados e ângulos opostos 
congruentes e paralelos. 
Geometria Espacial 
A Geometria Espacial é a área da matemática que estuda as figuras que possuem mais 
de duas dimensões. 
Assim, o que a difere da geometria plana (que apresenta objetos bidimensionais) é o 
volume que essas figuras apresentam, ocupando um lugar no espaço. ', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(2, 'Frações', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(2, 'MMC', 'Em breve', '2025-12-07', 5);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(2, 'MDC', 'Em breve', '2025-12-07', 6);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(2, 'Perímetro e Área de figuras simples', 'Em breve', '2025-12-07', 7);

-- CIÊNCIAS 6º (ID 3)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(3, 'Princípios da Matéria e Carbono', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(3, 'Seres Vivos e Cadeias Alimentares', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(3, 'Organização Básica da Célula', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(3, 'Níveis de Organização dos Seres Vivos', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(3, 'Classificação dos Seres Vivos (Reinos)', 'Em breve', '2025-12-07', 5);

-- HISTÓRIA 6º (ID 4)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(4, 'Conceitos de História e Pré-História', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(4, 'Antiguidade Oriental (Mesopotâmia e Egito)', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(4, 'Grécia Antiga I', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(4, 'Grécia Antiga II', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(4, 'Roma Antiga I', 'Em breve', '2025-12-07', 5);

-- GEOGRAFIA 6° (ID 5)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(5, 'Paisagem ', 'Paisagem é o que os nossos sentidos depreendem da parte de um espaço, ou seja, as 
sensações que determinado local nos transmitem. Isso acontece quando vemos um 
local e o consideramos bonito, quando sentimos o seu cheiro, ouvimos ou tocamos 
algo nesse local. 
A paisagem é responsável por registrar vários aspectos representativos da sociedade. 
Nesse sentido, o conceito de paisagem amplia-se, na medida em que não se limita a 
uma divisão geográfica. 
Ela revela aspectos referentes à história, à cultura e, entre tantos outros aspectos, à 
economia de uma sociedade. 
Isso porque a paisagem tem importantes valores e várias funções. A paisagem que 
vemos hoje já pode ter passado por um processo de modificação possivelmente em 
decorrência do uso dado a ela. 
Exemplo: Paisagem de praia: beleza, maresia, silêncio, sossego 
Um local com potencial de exploração turística tem suas infraestruturas modificadas 
para receber turistas. 
Por outro lado, o aumento da população em determinada extensão territorial resulta 
na iminente alteração para comportar as demandas populacionais. São exemplos: 
construção de casas, e outras obras, e pavimento de ruas. 
Uma paisagem rica em construções históricas revela a sua antiguidade. A sua 
conservação pode salvaguardar aspectos históricos e falar muito sobre a cultura do seu 
povo. 
Tipos de Paisagens 
Existem vários tipos de paisagem. São elas que compreendem aquilo que se define 
como espaço geográfico. 
Paisagem Natural 
Paisagem natural: cenário verde com água limpa e fresca 
A paisagem natural remete à natureza. Serra, mar, cascatas são espaços naturais que 
geralmente podem ser modificados em decorrência de aspectos climáticos e outros 
acontecimentos naturais, não por intervenção humana. 
Paisagem Humanizada 
Paisagem modificada: cidade com várias construções 
A paisagem humanizada, modificada ou artificial é aquela em que é claramente 
perceptível a intervenção dos homens. 
Nesses casos, a paisagem é modificada para criação de infraestruturas. Basta pensar 
numa porção de terra desabitada e planejar a construção de tudo o que a torna capaz 
de ser povoada: prédios, escolas, hospitais, lojas, estradas. ', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(5, 'Conceitos Fundamentais de Geografia', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(5, 'Elementos do Espaço Geográfico', 'A Geografia é uma ciência que encanta por sua capacidade de nos fazer compreender 
melhor o mundo em que vivemos. Desde as paisagens naturais até as manifestações 
humanas, ela abrange um vasto universo de conhecimentos que nos auxiliam a 
entender como o ambiente influencia nossas vidas e, ao mesmo tempo, como nossas 
ações moldam o planeta. Para estudantes que desejam aprofundar sua compreensão 
sobre o tema, é fundamental conhecer e entender os conceitos fundamentais que 
sustentam essa disciplina. Este artigo tem como objetivo apresentar um guia completo 
e acessível sobre os principais conceitos de Geografia, de forma a apoiar o aprendizado 
e estimular a curiosidade de todos aqueles interessados em conhecer o nosso planeta 
de forma mais aprofundada. 
O que é Geografia? 
Definição e abrangência 
A Geografia é uma ciência que estuda a distribuição, estrutura, processos e 
relações que ocorrem na superfície terrestre. Seus objetivos principais incluem 
entender como o espaço geográfico é organizado, as interações entre os elementos 
naturais e humanos e as transformações que ocorrem ao longo do tempo. 
Ela é geralmente dividida em duas grandes áreas: 
• Geografia Física: enfoca os aspectos naturais do planeta, como relevo, clima, 
hidrografia, vegetação e processos geológicos. 
• Geografia Humana: analisa as atividades humanas, a ocupação do espaço, as 
dinâmicas populacionais, econômicas e culturais. 
Por que os conceitos de Geografia são importantes? 
Compreender os conceitos básicos de Geografia nos permite desenvolver uma visão 
crítica e consciente do mundo. Além disso, esses conhecimentos são essenciais para 
compreender questões atuais, como mudanças climáticas, urbanização, desigualdades 
sociais e questões ambientais. Assim, a Geografia não é apenas uma ciência de 
interesse acadêmico, mas uma ferramenta essencial para a formação de cidadãos 
críticos e responsáveis. 
Elementos do Espaço Geográfico 
Relevo, clima e vegetação 
O espaço geográfico é composto por elementos que moldam as paisagens e 
influenciam as atividades humanas. São eles: 
Relevo: Forma da superfície terrestre, incluindo montanhas, planícies, colinas e vales. 
Clima: Conjunto de condições atmosféricas médias de uma região ao longo do tempo. 
Vegetação: Tipo de plantas que predominam em uma área, influenciadas pelo clima e 
relevo. 
Estes elementos estão interligados em um complexo sistema que define o caráter de 
uma região. 
Os elementos humanos 
• População: quantidade de habitantes e suas características. 
• Atividades econômicas: agricultura, indústria, comércio e serviços. 
• Cultura: manifestações culturais, língua, religião e tradições. 
• Infraestrutura: escolas, hospitais, transporte e comunicação. 
Estes elementos configuram o espaço social que também faz parte do espaço 
geográfico. 
Escalas de análise na Geografia 
Escala local, regional e global 
A Geografia trabalha com diferentes escalas de análise, que permitem compreender 
fenômenos em níveis distintos: 
1. Escala Local: observa fenômenos em pequenas áreas, como bairros ou 
municípios. 
2. Escala Regional: abrange uma região maior, como uma microregião ou estado. 
3. Escala Global: analisa o planeta como um todo, compreendendo aspectos 
internacionais e mundiais. 
Importância da escala 
Entender a escala é fundamental para interpretar corretamente os fenômenos 
geográficos, pois eles podem se manifestar de formas diferentes dependendo do nível 
de análise. Por exemplo, o impacto do aquecimento global é global, mas suas 
manifestações podem variar localmente, como em períodos de seca ou enchentes. 
Espaço geográfico e território 
Espaço geográfico 
O espaço geográfico é o espaço onde ocorrem as relações entre os diversos elementos 
naturais e humanos. Ele é dinâmico e constantemente transformado, dependendo das 
ações de quem nele habita. 
Território 
Já o território é uma porção do espaço geográfico delimitada por fronteiras, podendo 
ser uma cidade, uma região ou um país. O território reflete o controle e a organização 
do espaço pelo ser humano, e sua gestão influencia significativamente a vida social, 
econômica e política. 
Relação entre espaço e território 
Enquanto o espaço é uma dimensão mais ampla e geral, o território é uma porção 
específica desse espaço, sob domínio ou influência definida por um grupo ou 
Estado. Ambas as noções são fundamentais para entender a organização do mundo.', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(5, 'Tectonismo', 'O tectonismo ou diastrofismo é um fenômeno que está relacionado com o movimento 
das placas tectônicas presentes na litosfera (camada externa da terra) terrestre. 
O movimento das placas tectônicas pode ocorrer de três maneiras: convergente 
(choques das placas), divergente (afastamento das placas) e transformante 
(deslizamento das placas sobre outras). 
O tectonismo é produzido pelas forças do interior da Terra e colabora com a formação 
do relevo, sendo que sua atuação pode provocar diversos abalos sísmicos, por 
exemplo, os terremotos e os maremotos. 
Placas Tectônicas 
As placas tectônicas (que se deslocam no sentido horizontal e vertical) são grandes 
blocos rochosos rígidos que cobrem a superfície terrestre, sendo que as mais 
importantes são: 
• Placa Africana 
• Placa da Antártida 
• Placa Australiana 
• Placa Euroasiática 
• Placa do Pacífico (rodeada pelo Círculo de Fogo do Pacífico) 
• Placa Norte-americana 
• Placa Sul-americana 
Saiba mais sobre as placas tectônicas. 
Classificação 
De acordo com o processo envolvido no tectonismo ele é dividido de duas maneiras: 
1. Epirogênese: também chamado de movimento epirogênico, esse tipo de 
tectonismo revela um processo lento de verticalização que causa os 
levantamentos e rebaixamentos da crosta terrestre as quais sofrem diversas 
falhas e fraturas em sua estrutura. Podem ocorrer em sentido ascendente ou 
descendente, ou seja, movimentos de soerguimento (para cima) ou de 
rebaixamento (para baixo). 
2. Orogênese: também chamado de movimento orogênico, esse tipo de 
tectonismo determina um processo de pressão horizontal em que ocorre os 
dobramentos e enrugamentos das superfícies terrestres, por exemplo, 
os dobramentos modernos, um tipo de formação geológica que formam as 
montanhas e cordilheiras. 
Vulcanismo 
O vulcanismo é outro processo que colabora com a formação do relevo. No entanto, 
ele está relacionado com a erupção vulcânica, ou seja, quando o magma que está 
presente no interior da terra, é expelido. 
Ao entrar em contato com a superfície, essa substância é resfriada colaborando assim, 
com a formação do relevo, por exemplo, as ilhas de origem vulcânica. 
Abalos Sísmicos 
Os abalos sísmicos ou terremotos ocorrem através do movimento das placas tectônicas 
e da atividade vulcânica. 
Designam um fenômeno que provoca uma vibração brusca na superfície da Terra. 
Quando ocorrem no mar, são chamados de maremotos ou tsunamis. 
O que é Atmosfera? 
Atmosfera é a camada de ar que envolve o nosso planeta. Outros planetas do sistema 
solar também apresentam atmosfera. 
Os gases que compõem a atmosfera são mantidos ao redor da Terra devido à atração 
da gravidade e acompanham o seu movimento. 
A densidade do ar diminui à medida que aumentamos a altitude, sendo que 50% dos 
gases e partículas em suspensão estão localizadas nos primeiros 5 km. 
A atmosfera é fundamental para a manutenção da vida na Terra, pois: 
• É fonte de oxigênio, gás essencial para a vida. 
• Regula a temperatura e o clima terrestre. 
• É responsável pela distribuição da água no planeta (chuva). 
• Protege a Terra das radiações cósmicas e dos meteoros. 
Atmosfera Terrestre 
A atmosfera terrestre apresenta diferentes características ao longo do seu perfil 
vertical e sua espessura é de aproximadamente 10.000 km. 
A coluna de ar que a compõe exerce uma pressão, chamada de pressão atmosférica. 
Como ela depende da densidade do ar, conforme subimos, a pressão atmosférica vai se 
tornando menor. 
A pressão atmosférica também sofre variações ao longo da superfície terrestre, sendo 
uma importante variável para as análises meteorológicas. 
A atmosfera também é a responsável por vermos o céu azul durante o dia, pois suas 
partículas difundem predominantemente a radiação visível neste comprimento de 
onda. 
Camadas da Atmosfera 
Devido as distintas características que a atmosfera apresenta, em diferentes altitudes 
ela é dividida em camadas. 
A camada mais próxima da superfície da Terra é chamada de troposfera. Ela se estende 
até uma altitude média de 12 km. 
Essa camada corresponde a 80% do peso total da atmosfera e é onde ocorrem os 
principais fenômenos meteorológicos. A temperatura decresce com a altitude. 
A seguir temos a estratosfera, que se estende até 50 km da superfície. A temperatura, 
que inicialmente é constante, passa a aumentar com a altitude devido a radiação 
absorvida pela camada de ozônio. 
Esta camada filtra a radiação ultravioleta e é fundamental para a manutenção dos seres 
vivos na Terra. 
Logo a seguir, aparece a mesosfera, cujo topo se localiza a 80 km do solo. A 
temperatura volta a diminuir com a altitude, atingindo -100 ºC. 
Na termosfera, camada após a mesosfera, ocorre absorção de radiação solar de ondas 
curtas. A temperatura volta a aumentar, podendo atingir 1500 ºC. 
Encontramos, ainda nessa camada, uma região chamada de ionosfera que apresenta 
uma concentração de partículas carregadas (íons). 
A ionosfera influência as transmissões de rádio e é a responsável pelo fenômeno da 
aurora boreal. 
Por fim, a exosfera, onde a atmosfera vai se tornando vácuo cósmico. 
Perfil da atmosfera, mostrando as variações de temperatura, pressão e densidade em 
função da altitude. 
Composição da Atmosfera 
A atmosfera terrestre é composta basicamente de nitrogênio, oxigênio, argônio, gás 
carbônico e pequena quantidade de outros gases. Apresenta ainda, uma quantidade 
variável de vapor de água. 
O nitrogênio é o gás mais abundante da atmosfera, representando cerca de 78% do seu 
volume. É um gás inerte, ou seja, não há aproveitamento pelas células do nosso corpo. 
O ar que respiramos possui cerca de 20% de oxigênio, que é o gás essencial para os 
seres vivos. 
O dióxido de carbono (CO2) é essencial para a fotossíntese. Além disso, é um eficiente 
absorvedor de energia de onda longa, o que faz com que as camadas mais baixas da 
atmosfera retenham calor. 
O vapor de água é um dos gases que apresenta quantidade mais variada na atmosfera. 
Podendo representar, em algumas regiões, 4% do seu volume. Ele é fundamental para 
a distribuição de água no planeta, pois na sua ausência não há nuvens, chuva ou neve. 
Composição da atmosfera considerando o ar seco, ou seja, sem vapor de água. 
Atmosfera Primitiva 
Pela comparação da atmosfera de outros planetas, acredita-se que a atmosfera 
primitiva terrestre era composta por hidrogênio, metano, amônia e vapor de água. 
Esses gases teriam sofrido reações químicas, pela ação da radiação solar e de descargas 
elétricas. Originando, de forma gradual, a composição atual da atmosfera. 
Circulação Geral da Atmosfera 
Em virtude do formato da Terra, existe diferenças no aquecimento da atmosfera 
terrestre. 
Para equilibrar esse aquecimento desigual, verificamos a ocorrência de células de 
circulação de ar, do Equador para os polos e dos polos para o Equador. 
De forma simplificada, podemos representar a circulação geral da atmosfera por três 
células em cada hemisfério. 
Poluição do Ar 
Considera-se poluição do ar, toda adição de partículas, compostos gasosos e formas de 
energia (calor, radiação ou ruído) que não estão presentes normalmente na atmosfera. 
A poluição do ar pode ser resultado de processos naturais ou produzidos pelo homem. 
Por processos naturais podemos citar: 
• Erupções vulcânicas 
• Tempestades de areia 
• Incêndios florestais 
• Pólen 
• Esporos de fungos 
• Poeira cósmica 
São exemplos de fontes de poluição humana: 
• Veículos automotores 
• Atividades industriais 
• Centrais térmicas 
• Refinarias de petróleo 
• Agricultura 
• Queimadas 
Consequências da poluição atmosférica 
A poluição atmosférica causa impactos negativos na saúde humana, no clima e no meio 
ambiente. 
Um dos efeitos do excesso de gases emitidos pelo homem para a atmosfera é a 
intensificação do efeito estufa e o consequente aquecimento global. 
O efeito estufa é um fenômeno natural e essencial para os seres vivos. Ele evita que a 
Terra perca calor demais, gerando variações bruscas de temperatura. 
Com o aumento da emissão de gases do efeito estufa, em decorrência das atividades 
humanas, verifica-se um aumento da temperatura global. 
Uma outra consequência da poluição é a chuva ácida, que atinge diversas regiões do 
planeta. Os gases e partículas formadores da chuva ácida podem ser transportados por 
quilômetros de distância da fonte emissora. 
Como a Atmosfera protege a Terra? 
A atmosfera impede que grande parte dos meteoros que se aproximam da Terra 
cheguem em sua superfície. Muitos queimam com o atrito e o calor da atmosfera. 
A radiação ultravioleta é filtrada na camada de ozônio. Essa radiação é extremamente 
nociva para os seres vivos. 
Além disso, a atmosfera ainda regula a quantidade de radiação que chega e que é 
perdida pela superfície terrestre. Isso evita que o planeta apresente uma variação 
muito grande de temperatura.', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(2, 'Atmosfera', 'Em breve', '2025-12-07', 5);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(5, 'Clima e Relevo', 'Em breve', '2025-12-07', 6);

-- ARTES 6º (ID 6)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(6, 'Elementos Fundamentais da Arte (Ponto, Linha, Cor)', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(6, 'Arte Indígena e suas Formas', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(6, 'Arte e Cultura Africana', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(6, 'Elementos Fundamentais da Música (Melodia, Ritmo, Harmonia)', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(6, 'Análise de Obras e Expressão', 'Em breve', '2025-12-07', 5);

-- INGLÊS 6º (ID 7)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(7, 'Saudações e Identificação Pessoal', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(7, 'Verbo To Be (Presente)', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(7, 'Pronomes Pessoais e Adjetivos', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(7, 'Vocabulário Básico (Cores, Números)', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(7, 'Interpretação de Textos Curtos (Reading)', 'Em breve', '2025-12-07', 5);

-- EDUCAÇÃO FÍSICA 6º (ID 8)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(8, 'Jogos e Brincadeiras Populares', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(8, 'Esportes de Marca (Atletismo, Natação)', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(8, 'Esportes de Invasão (Futebol, Basquete)', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(8, 'Jogos de Tabuleiro e Estratégia', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(8, 'Concentração e Consciência Corporal', 'Em breve', '2025-12-07', 5);

-- 7º ANO CONTEUDOS

-- PORTUGUÊS 7° (ID 9)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(9, 'Verbo', 'Sílabas são fonemas emitidos de uma só vez. Isso é percebido mais facilmente quando 
fazemos exercícios de separação silábica e dividimos as palavras conforme elas são 
pronunciadas. 
Assim, a palavra mar tem uma sílaba, enquanto on-da tem duas;  
bi-quí-ni, três e  
bra-si-lei-ros, quatro sílabas. 
Em cada sílaba há sempre uma vogal, por isso, lembre-se: as vogais são um elemento 
obrigatório; não existe sílaba sem vogal! 
Classificação das palavras quanto ao número de sílabas 
As palavras são classificadas conforme o número de sílabas: 
• monossílabas: palavras que têm apenas uma sílaba. Exemplos: mão, pai, pé. 
• dissílabas: palavras que têm duas sílabas. Exemplos: pa-pai, sal-to, ta-to. 
• trissílabas: palavras que têm três sílabas. Exemplos: cor-ti-na, sa-co-la, sa-pa-to. 
• polissílabas: palavras que têm quatro ou mais sílabas. Exemplos: bi-lhe-te-ri-a, 
com-pu-ta-dor, fo-to-gra-fi-a. 
Classificação das palavras quanto ao acento tônico 
As sílabas são classificadas conforme a intensidade e a localização da sílaba tônica. 
Classificação conforme a INTENSIDADE com que são pronunciadas: 
• sílabas tônicas: sílabas emitidas com intensidade maior, por exemplo, ge-ne-ro
si-da-de. 
• sílabas subtônicas: sílabas emitidas com intensidade média, por exemplo, ge
ne-ro-si-da-de. 
• sílabas átonas: sílabas emitidas com intensidade menor, por exemplo, ge-ne-ro
si-da-de. 
Classificação conforme a LOCALIZAÇÃO DA SÍLABA TÔNICA: 
• oxítonas: a sílaba mais forte é a última sílaba da palavra. Exemplos: a-tum, cha
péu, vo-cê. 
• paroxítonas: a sílaba mais forte é a penúltima sílaba da palavra. Exemplos: ca
dei-ra, ja-ne-la, te-cla-do 
• proparoxítonas: a sílaba mais forte é a antepenúltima sílaba da palavra. 
Exemplos: ár-vo-re, aus-trí-a-co, lâm-pa-da. 
Sílabas canônicas e não canônicas 
As sílabas canônicas são aquelas formadas por uma consoante e uma vogal (C + V), 
seguindo sempre essa ordem. 
As sílabas não canônicas não seguem essa disposição. Elas podem ser formadas 
somente por vogal (V) ou por vogal e consoante (V + C), entre outras opções, tal como 
acontece com os encontros consonantais. 
Exemplos: ad-je-ti-vo, ca-ne-ta, e-la, es-co-la. 
• São sílabas canônicas: -je, -ti, -vo (da palavra adjetivo); ca-,-ne,-ta (da palavra 
caneta); -la (da palavra ela); -co,-la (da palavra escola). 
• São sílabas não canônicas: ad- (da palavra adjetivo); e-(da palavra ela). 
Sílabas abertas e fechadas 
As sílabas abertas terminam por uma vogal, enquanto as fechadas terminam por 
consoante. 
• Exemplos de sílabas abertas: a-ba-ca-te, ci-da-de, ma-la. 
• Exemplos de sílabas fechadas: ad-ver-tir, al-tar, op-tar. ', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(9, 'Advérbio', 'Encontros vocálicos são encontros de vogais ou semivogais, sem consoantes 
intermediárias. 
Eles acontecem na mesma ou em outra sílaba, sendo classificados 
em: ditongo, tritongo e hiato. 
Isso quer dizer que quando vogais ou semivogais (sons vocálicos ditos com menos 
força) aparecem umas ao lado das outras numa palavra, acontece um encontro 
vocálico. Se uma consoante aparecer entre as vogais ou semivogais, elas deixam de 
estar juntas e não ocorre o encontro vocálico. 
Exemplos: lua, madeira, Uruguai. 
Nos hiatos, ocorre apenas o encontro de vogais (nunca de semivogais), e quando 
fazemos a separação das suas sílabas, cada vogal fica numa sílaba diferente. Exemplos: 
álcool (ál-co-ol), navio (na-vi-o), saída (sa-í-da). 
Nos ditongos, ocorre o encontro de uma vogal com uma semivogal, e quando fazemos 
a separação das suas sílabas, as duas ficam na mesma sílaba. Exemplos: papai (pa
pai), oi (a palavra "oi" não se separa), sabão (sa-bão). 
Nos tritongos, ocorre o encontro semivogal, vogal e semivogal (sempre nessa ordem), e 
quando fazemos a separação das suas sílabas, as três ficam na mesma sílaba. 
Exemplos: iguais (i-guais), saguão (sa-guão), uruguaio (u-ru-guai-o). 
Ditongo 
Ditongo é o encontro vocálico em que uma vogal e uma semivogal ficam juntas, mesmo 
quando se faz a separação de sílabas. Exemplos: céu (céu), tranquilo (tran-qui-lo), boi 
(boi). 
De acordo com a posição da vogal e da semivogal, os ditongos podem ser: crescentes 
ou decrescentes. 
Ditongos crescentes são aqueles em que a semivogal vem antes da vogal (sv + v). 
Exemplos: igual (i-gual), quota (quo-ta), pátria (pá-tria). 
Ditongos decrescentes são aqueles em que a vogal vem antes da semivogal (v + sv). 
Exemplos: meu (meu), herói (he-rói), cai (cai). 
De acordo com a pronúncia, os ditongos podem ser orais ou nasais. 
Ditongos orais são os pronunciados apenas pela boca. É o caso de ai, ia, iu, ui, eu, éu, 
ue, ei, éi, ie, oi, ói, io, au, ua, ao, oa, ou, uo, oe, eo, ea. Exemplos: mau (mau), sei (sei), 
viu (viu). 
Ditongos nasais são os pronunciados pela boca e pelo nariz. É o caso de ão, ãe, õe, am, 
an, em, en, ãi, ui (ocorre apenas na palavra "muito"). Exemplos: mãe (mãe), levem (le
vem), muito (mui-to). 
Palavras com ditongo 
• automóvel (au-to-mó-vel) 
• boi (boi) 
• cai (cai) 
• céu (céu) 
• deus (deus) 
• eu (eu) 
• frequente (fre-quen-te) 
• gratuito (gra-tui-to) 
• herói (he-rói) 
• igual (i-gual) 
• jeito (jeito) 
• levem (le-vem) 
• madeira (ma-dei-ra) 
• mãe (mãe) 
• mau (mau) 
• meu (meu) 
• muito (mui-to) 
• noite (noi-te) 
• oi (oi) 
• outro (ou-tro) 
• papai (pa-pai) 
• pátria (pá-tria 
• quota (quo-ta) 
• respeito (res-pei-to) 
• sabão (sa-bão) 
• sei (sei) 
• tranquilo (tran-qui-lo) 
• viu (viu) 
Tritongo 
Tritongo é o encontro vocálico em que semivogal + vogal + semivogal ficam juntas, 
mesmo quando se faz a separação de sílabas. Exemplos: Uruguai (U-ru-guai), saguão 
(sa-guão), enxaguam (en-xa-guam). 
Os tritongos podem ser orais ou nasais. 
Tritongos orais são os pronunciados apenas pela boca. Exemplos: Paraguai (Pa-ra-guai), 
enxaguei (en-xa-guei), iguais (i-guais). 
Tritongos nasais são os pronunciados pela boca e pelo nariz. As consoantes "m" e "n" 
podem acompanhar os tritongos. Quando isso acontecer, os tritongos são classificados 
como tritongos nasais. Exemplos: quão (quão), saguões (sa-guões), enxaguem (en-xa
guem). 
Palavras com tritongo 
• apaziguou (a-pa-zi-guou) 
• desaguou (de-sa-guou) 
• enxaguam (en-xa-guam) 
• enxaguei (en-xa-guei) 
• enxaguem (en-xa-guem) 
• iguais (i-guais) 
• minguem (min-guem) 
• Paraguai (Pa-ra-guai) 
• paraguaio (pa-ra-guai-o) 
• quais (quais) 
• quão (quão) 
• saguão (sa-guão) 
• saguões (sa-guões) 
• Uruguai (U-ru-guai) 
• uruguaio (u-ru-guai-o) 
• uruguaiano (u-ru-guai-a-no) 
Hiato 
Hiato é o encontro vocálico em que duas vogais aparecem juntas numa palavra, mas 
f
icam em sílabas diferentes quando se faz a separação de sílabas. Exemplos: raiz (ra-iz), 
Saara (Sa-a-ra), país (pa-ís). 
Palavras com hiato 
• afiado (a-fi-a-do) 
• águia (á-gui-a) 
• álcool (ál-co-ol) 
• baú (ba-ú) 
• coelho (co-e-lho) 
• dia (di-a) 
• elogio (e-lo-gi-o) 
• faísca (fa-ís-ca) 
• gênio (gê-ni-o) 
• hiato (hi-a-to) 
• iate (i-a-te) 
• juiz (ju-iz) 
• karaokê (ka-ra-o-kê) 
• leão (le-ão) 
• lua (lu-a) 
• moeda (mo-e-da) 
• navio (na-vi-o) 
• oceano (o-ce-a-no) 
• país (pa-ís) 
• quieto (qui-e-to) 
• raiz (ra-iz) 
• Saara (Sa-a-ra) 
• saída (sa-í-da) 
• tio (ti-o) 
• unicórnio (u-ni-cór-ni-o) 
• voo (vo-o) 
• zoológico (zo-o-ló-gi-co) 
Atenção! 
Os ditongos e os tritongos não se separam, somente os hiatos. 
Encontros vocálicos e consonantais 
Os encontros vocálicos são o encontro de vogais ou semivogais, sem consoantes entre 
elas. Exemplos: mãe, poeta, piada. 
Os encontros vocálicos são classificados em ditongo, tritongo e hiato. 
Os encontros consonantais são a sequência de duas ou mais consoantes, sem a 
presença de vogais entre elas. Exemplos: Brasil, cacto, flor, objetivo, psicologia. 
Os encontros consonantais podem ser separáveis ou inseparáveis. 
Encontros consonantais separáveis: quando a palavra é separada, as consoantes ficam 
em sílabas diferentes. Exemplos: advogado (ad-vo-ga-do), sorte (sor-te), torta (tor-ta). 
Encontros consonantais inseparáveis: quando a palavra é separada, as consoantes 
f
icam na mesma sílaba. Exemplos: blusa (blu-sa), livro (li-vro), trem (trem). ', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(9, 'Preposição', 'Substantivo é a classe de palavras usada para dar nome aos seres, objetos, fenômenos, 
lugares, qualidades, ações, dentre outros. 
Exemplos: menino, João, Portugal, caneta, ventania, coragem, corrida. 
Os substantivos podem ser flexionados em gênero (masculino e 
feminino), número (singular e plural) e grau (aumentativo e diminutivo). 
Classificação dos substantivos 
Os substantivos são classificados em: comum, próprio, simples, composto, concreto, 
abstrato, primitivo, derivado e coletivo. 
1. Substantivos comuns 
Os substantivos são comuns se eles dão nome a seres de forma genérica. 
Exemplos: pessoa, gente, país. 
2. Substantivos próprios 
Os substantivos são próprios quando eles dão nome a seres de forma particular. Eles 
são escritos com letra maiúscula. 
Exemplos: Maria, São Paulo, Brasil. 
3. Substantivos simples 
Os substantivos simples são formados por apenas um radical (radical é a parte da 
palavra que contém o seu significado básico). 
Exemplos: casa, carro, camiseta. 
4. Substantivos compostos 
Os substantivos compostos são formados por mais de um radical (radical é a parte da 
palavra que contém o seu significado básico). 
Exemplos: guarda-chuva, passatempo, beija-flor. 
5. Substantivos concretos 
Os substantivos concretos designam as palavras reais, concretas, sejam elas pessoas, 
objetos, animais ou lugares. 
Exemplos: menina, homem, cachorro. 
6. Substantivos abstratos 
Os substantivos abstratos são aqueles relacionados aos sentimentos, estados, 
qualidades e ações. 
Exemplos: beleza, alegria, bondade. 
7. Substantivos primitivos 
Os substantivos primitivos, como o próprio nome indica, são aqueles que não derivam 
de outras palavras. 
Exemplos: casa, folha, chuva. 
8. Substantivos derivados 
Os substantivos derivados são aquelas palavras que derivam de outras. 
Exemplos: casarão (derivado de casa), folhagem (derivado de folha), chuvarada 
(derivado de chuva). 
9. Substantivos coletivos 
Os substantivos coletivos são aqueles que se referem a um conjunto de seres. 
Exemplos: flora (conjunto de plantas), álbum (conjunto de fotos), colmeia (conjunto de 
abelhas). 
Flexão de gênero dos substantivos 
Conforme o gênero (feminino e masculino) dos substantivos, eles são classificados em: 
biforme e uniforme. 
Substantivos biformes - apresentam duas formas, ou seja, uma para o masculino e 
outra para o feminino. Exemplos: professor e professora; amigo e amiga. 
Substantivos uniformes - somente um termo especifica os dois gêneros (masculino e 
feminino), sendo classificados em: epiceno, sobrecomum e comum de dois gêneros. 
• Epicenos: apresenta somente um gênero e refere-se aos animais. Exemplo: foca 
(macho ou fêmea). 
• Sobrecomum: apresenta somente um gênero e refere-se às pessoas. Exemplo: 
criança (masculino e feminino). 
• Comum de dois gêneros: termo que se refere aos dois gêneros (masculino e 
feminino), identificado por meio do artigo que o acompanha. Exemplo: 
"o artista" e "a artista". 
Os substantivos de origem grega terminados em "ema" e "oma" são masculinos, por 
exemplo: teorema, poema. 
Há os substantivos chamados de "gênero duvidoso ou incerto", ou seja, aqueles 
utilizados para os dois gêneros sem alteração do significado, por exemplo: o 
personagem e a personagem. 
Existem alguns substantivos que, variando de gênero, mudam seu significado, por 
exemplo: "o cabeça" (líder), "a cabeça" (parte do corpo humano). 
Flexão de número dos substantivos 
Conforme o número do substantivo, eles são classificados em: singular e plural. 
Singular - designa uma única coisa, pessoa ou um grupo. Exemplo: bola, mulher. 
Plural - designa várias coisas, pessoas ou grupos. Exemplo: bolas, mulheres. 
Flexão de grau dos substantivos 
Conforme o grau dos substantivos, eles são classificados em: aumentativo e 
diminutivo. 
Aumentativo - indica o aumento do tamanho de algum ser ou alguma coisa. 
Diminutivo - indica a diminuição do tamanho de algum ser ou alguma coisa. 
Os graus aumentativo e diminutivo podem ser analíticos e sintéticos. 
O aumentativo analítico é acompanhado de um adjetivo que indica grandeza. 
Exemplo: casa grande. 
O aumentativo sintético recebe o acréscimo de um sufixo indicador de aumento. 
Exemplo: casarão. 
O diminutivo analítico é acompanhado de um adjetivo que indica pequenez. Exemplo: 
casa pequena. 
O diminutivo sintético recebe o acréscimo de um sufixo indicador de diminuição. 
Exemplo: casinha. 
Relação entre adjetivos e substantivos 
Os adjetivos correspondem à classe de palavras que indicam qualidades e estados aos 
substantivos, por exemplo: casa bonita. Aqui, o termo "bonita" atribui uma qualidade 
ao substantivo "casa". ', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(9, 'Conjunção', 'O adjetivo é uma classe de palavras que atribui características aos substantivos, ou 
seja, ele indica suas qualidades e estados. 
Essas palavras variam em gênero (feminino e masculino), número (singular e plural) e 
grau (comparativo e superlativo). 
Exemplos de adjetivos: 
• garota bonita 
• garotas bonitas 
• criança obediente 
• crianças obedientes 
Tipos de adjetivos 
Os adjetivos podem variar em gênero (masculino/feminino), número (singular/plural) e 
grau (aumentativo/diminutivo) para concordar com o substantivo a que se referem. 
Além disso, também são classificados de acordo com sua função e formação. 
Adjetivo simples 
São formados por apenas um radical, ou seja, uma única parte que carrega o 
significado básico da palavra. 
Exemplos: pobre, magro, triste, lindo, bonito, feio. 
Adjetivo composto 
São adjetivos formados por mais de um radical, ou seja, resultam da junção de duas ou 
mais palavras. Eles podem ser escritos com hífen ou sem, dependendo das regras 
ortográficas. A formação desses adjetivos pode ocorrer por justaposição (palavras 
unidas sem alteração) ou por aglutinação (palavras unidas com alteração fonética). 
Exemplos: luso-brasileiro (português + brasileiro), superinteressante (super + 
interessante), rosa-claro (rosa + claro), amarelo-ouro (amarelo + ouro), socioeconômico 
(social + econômico). 
Adjetivo primitivo 
Adjetivos que dão origem a outras palavras, como substantivos ou outros adjetivos. 
Eles são a base para a formação de derivados. 
Exemplos: bom (origina bondade), alegre (origina alegria), puro (origina pureza), triste 
(origina tristeza), notável (origina notabilidade). 
Adjetivo derivado 
São adjetivos que derivam de outras palavras, como substantivos, verbos ou até 
mesmo outros adjetivos. Eles são formados por meio de processos de derivação, como 
acréscimo de sufixos ou prefixos. 
Exemplos: articulado (verbo articular), visível (verbo ver), formoso (substantivo 
formosura), tristonho (substantivo tristeza). 
Adjetivo pátrio (adjetivo gentílico) 
Indicam a origem geográfica, nacionalidade ou localidade de uma pessoa, animal ou 
coisa. Eles são utilizados para identificar a procedência de algo ou alguém. Os adjetivos 
pátrios podem variar conforme a região ou o país. Por exemplo, quem nasce no Brasil é 
"brasileiro", enquanto quem nasce em São Paulo é "paulista". 
Exemplos: brasileiro, carioca, paulista, europeu, espanhol. 
O gênero dos adjetivos 
Em relação aos gêneros (masculino e feminino), os adjetivos são divididos em dois 
t
ipos: 
1. Adjetivos uniformes - apresentam uma forma para os dois gêneros (feminino e 
masculino). Exemplo: menino feliz; menina feliz. 
2. Adjetivos biformes - a forma varia conforme o gênero (masculino e feminino). 
Exemplo: homem carinhoso; mulher carinhosa. 
O número dos adjetivos 
Os adjetivos podem estar no singular ou no plural, concordando com o número do 
substantivo a que se referem. Assim, a sua formação se assemelha à dos substantivos. 
Exemplos: 
• Pessoa feliz - pessoas felizes 
• Vale formoso - vales formosos 
• Casa enorme - casas enormes 
• Problema socioeconômico - problemas socioeconômicos 
• Menina afro-brasileira - meninas afro-brasileiras 
• Estudante mal-educado - estudantes mal-educados 
O grau dos adjetivos 
Quanto ao grau, os adjetivos são classificados em dois tipos: 
1. Comparativo: utilizado para comparar qualidades. 
2. Superlativo: utilizado para intensificar qualidades. 
Grau comparativo 
• Comparativo de Igualdade - O professor de matemática é tão bom quanto o de 
geografia. 
• Comparativo de Superioridade - Marta é mais habilidosa do que a Patrícia. 
• Comparativo de Inferioridade - João é menos feliz que Pablo. 
Grau superlativo 
• Superlativo Absoluto: refere-se a um substantivo somente, sendo classificados 
em: 
o Analítico - A moça é extremamente organizada. 
o Sintético - Luiz é inteligentíssimo. 
o Superlativo Relativo: refere-se a um conjunto, sendo classificados em: 
o Superioridade - A menina é a mais inteligente da turma. 
o Inferioridade - O garoto é o menos esperto da classe. 
A locução adjetiva 
A locução adjetiva é o conjunto de duas ou mais palavras que possuem valor de 
adjetivo. 
Exemplos: 
• Amor de mãe - Amor maternal 
• Doença de boca - doença bucal 
• Pagamento do mês - pagamento mensal 
• Férias do ano - férias anual 
• Dia de chuva - dia chuvoso 
O pronome adjetivo 
Os pronomes adjetivos são aqueles em que o pronome exerce a função de adjetivo. 
Surgem acompanhados do substantivo, modificando-os. Exemplos: 
• Este livro é muito bom. 
Acompanha o substantivo "livro", especificando-o. 
• Aquela é a empresa onde ele trabalha. 
Acompanha o substantivo "empresa", especificando-o.', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(9, 'Vozes Verbais', 'Em breve', '2025-12-07', 5);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(9, 'Gêneros Textuais', 'Em breve', '2025-12-07', 6);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(9, 'Memórias', 'Em breve', '2025-12-07', 7);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(9, 'Diário', 'Em breve', '2025-12-07', 8);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(9, 'Artigo de Opinião', 'Em breve', '2025-12-07', 9);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(9, 'Períiodo Simples', 'Em breve', '2025-12-07', 10);

-- MATEMÁTICA 7° (ID 10)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(10, 'Números Inteiros', 'Os Números Naturais N = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12...} 
são números inteiros positivos (não-negativos) que se agrupam num conjunto 
chamado de N, composto de um número ilimitado de elementos. Se um número é 
inteiro e positivo, podemos dizer que é um número natural. 
Quando o zero não faz parte do conjunto, é representado com um asterisco ao lado da 
letra N e, nesse caso, esse conjunto é denominado de Conjunto dos Números Naturais 
Não-Nulos: N* = {1, 2, 3, 4, 5, 6, 7, 8, 9...}. 
• Conjunto dos Números Naturais Pares = {0, 2, 4, 6, 8...} 
• Conjunto dos Números Naturais Ímpares = {1, 3, 5, 7, 9...} 
O conjunto de números naturais é infinito. Todos possuem um antecessor (número 
anterior) e um sucessor (número posterior), exceto o número zero (0). Assim: 
• o antecessor de 1 é 0 e seu sucessor é o 2; 
• o antecessor de 2 é 1 e seu sucessor é o 3; 
• o antecessor de 3 é 2 e seu sucessor é o 4; 
• o antecessor de 4 é 3 e seu sucessor é o 5. 
Cada elemento é igual ao número antecessor mais um, exceptuando-se o zero. Assim, 
podemos notar que: 
• o número 1 é igual ao anterior (0) + 1 = 1; 
• o número 2 é igual ao anterior (1) + 1 = 2; 
• o número 3 é igual ao anterior (2) + 1 = 3; 
• o número 4 é igual ao anterior (3) + 1 = 4. 
A função dos números naturais é contar e ordenar. Nesse sentido, vale lembrar que os 
homens, antes de inventarem os números, tinham muita dificuldade em realizar a 
contagem e ordenação das coisas. 
Segundo a história, essa necessidade começou com a dificuldade apresentada pelos 
pastores dos rebanhos em contarem suas ovelhas. 
Assim, alguns povos antigos, desde os egípcios e babilônios, utilizaram diversos 
métodos, desde acumular pedrinhas ou marcar as ovelhas. 
Algumas propriedades dos números naturais: 
• Ordem: Os números naturais são ordenados, o que significa que podemos 
compará-los entre si. Por exemplo, 5 é maior que 3. 
• Adição: A adição de números naturais é sempre um número natural. Por 
exemplo, 5 + 3 = 8. 
• Multiplicação: A multiplicação de números naturais é sempre um número 
natural. Por exemplo, 5 x 3 = 15. 
• Primo e composto: um número natural é primo se tiver apenas dois divisores: 1 
e ele mesmo. Caso contrário, é composto. 
Na matemática, as frações correspondem a uma representação das partes de um todo. 
Ela determina a divisão de partes iguais sendo que cada parte é uma fração do inteiro. 
Como exemplo podemos pensar numa pizza dividida em 8 partes iguais, sendo que 
cada fatia corresponde a 1/8 (um oitavo) de seu total. Se eu como 3 fatias, posso dizer 
que comi 3/8 (três oitavos) da pizza. 
Importante lembrar que nas frações, o termo superior é chamado 
de numerador enquanto o termo inferior é chamado de denominador. 
Tipos de Frações 
Fração Própria 
São frações em que o numerador é menor que o denominador, ou seja, representa um 
número menor que um inteiro. Ex: 2/7 
Fração Imprópria 
São frações em que o numerador é maior, ou seja, representa um número maior que o 
inteiro. Ex: 5/3 
Fração Aparente 
São frações em que o numerador é múltiplo ao denominador, ou seja, representa um 
número inteiro escrito em forma de fração. Ex: 6/3= 2 
Fração Mista 
É constituída por uma parte inteira e uma fracionária representada por números 
mistos. Ex: 1 2/6. (um inteiro e dois sextos) 
Obs: Há outros tipos de frações, são elas: equivalente, irredutível, unitária, egípcia, 
decimal, composta, contínua, algébrica. 
Você também pode se interessar por O que é fração? 
Operações com Frações 
Adição 
Para somar frações é necessário identificar se os denominadores são iguais ou 
diferentes. Se forem iguais, basta repetir o denominador e somar os numeradores. 
Contudo, se os denominadores são diferentes, antes de somar devemos transformar as 
frações em frações equivalentes de mesmo denominador. 
Neste caso, calculamos o Mínimo Múltiplo Comum (MMC) entre os denominadores das 
frações que queremos somar, esse valor passa a ser o novo denominador das frações. 
Além disso, devemos dividir o MMC encontrado pelo denominador e o resultado 
multiplicamos pelo numerador de cada fração. Esse valor passa a ser o novo 
numerador. 
Exemplos: 
Subtração 
A) 5/9 + 2/9 = 7/9 
B) 1/5 + 2/3 = 3.1 + 5.2/15 = 3+10/15 = 13/15 
C) 1/3 + ½ + 2/5 = 10.1 +15.1 + 6.2/30 = 10 + 15 + 12/30 = 37/30 
Para subtrair frações temos que ter o mesmo cuidado que temos na soma, ou seja, 
verificar se os denominadores são iguais. Se forem, repetimos o denominador e 
subtraímos os numeradores. 
Se forem diferentes, fazemos os mesmos procedimentos da soma, para obter frações 
equivalentes de mesmo denominador, aí sim podemos efetuar a subtração. 
Exemplos: 
A) 3/8 – 2/8 = 1/8 
B) 6/7 – 1/3 = 3.6 – 7.1/21 = 18 – 7/21 = 11/21 
Multiplicação 
A multiplicação de frações é feita multiplicando os numeradores entre si, bem como 
seus denominadores. 
Exemplos: 
A) ¾.1/5 = 3.1/4.5 = 3/20 
B) 7/8.3/5 = 21/40 
C) ½.1/3.5/7 = 1.1.5/2.3.7 = 5/42 
Divisão 
Na divisão entre duas frações, multiplica-se a primeira fração pelo inverso da segunda, 
ou seja, inverte-se o numerador e o denominador da segunda fração. 
Exemplos: 
A) 3/4: 3/2 = 3/4. 2/3 = 6/12 = ½ 
B) 15/8: 3 = 15/8. 1/3 = 14/24 = 5/8 
C) 3/8: 15/2 = 3/8.2/15 = 6/120 = 1/20 
História das Frações 
A história das frações remonta o Antigo Egito (3.000 a.C.) e traduz a necessidade e a 
importância para o ser humano acerca dos números fracionários. 
Naquele tempo, os matemáticos marcavam suas terras para delimitá-las. Com isso, nas 
épocas chuvosas o rio passava do limite e inundava muitas terras e, 
consequentemente, as marcações. 
Diante disso, os matemáticos resolveram demarcá-las com cordas a fim de resolver o 
problema inicial das enchentes. 
Contudo, notaram que muitos terrenos não eram compostos somente por números 
inteiros, havia os terrenos que mediam partes daquele total. 
Foi a partir disso, que os geômetras dos faraós do Egito, começaram a utilizar os 
números fracionários. Note que a palavra Fração é proveniente do latim fractus e 
significa “partido”. ', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(10, 'Razão e Proporção', 'Os números decimais são números racionais (Q) não inteiros expressos por vírgulas e 
que possuem casas decimais, por exemplo: 1,54; 4,6; 8,9, etc. Eles podem ser positivos 
ou negativos. 
As casas decimais são contadas a partir da vírgula, por exemplo o número 12,451 
possui três casas decimais, ou seja, três algarismos após a vírgula. 
Números Inteiros 
Diferente dos números decimais, os números inteiros são números reais (positivos ou 
negativos) representados pela letra Z. Eles não possuem vírgula, por exemplo: 1; 2; -3; 
4, etc. 
Números Fracionários 
Embora possam ter um valor correspondente, os números fracionários são expressos 
da seguinte maneira: 
• ½ (um meio) que corresponde ao decimal 0,5 
• ¾ (três quartos) que corresponde ao decimal 0,75 
• ¼ (um quarto) que corresponde a 0,25 
Logo, todos os números decimais podem ser expressos por frações. 
Leitura de Números Decimais 
A leitura dos números decimais é feita pela união da parte inteira do número (expressa 
antes da vírgula) e a quantidade de casas decimais (depois da vírgula) que corresponde 
a parte fracionária: décimo, centésimo, milésimo, décimo de milésimo, centésimo de 
milésimo, milionésimo, etc. 
Para compreender melhor, veja abaixo alguns exemplos: 
• 0,1: um décimo 
• 0,4: quatro décimos 
• 0,01: um centésimo 
• 0,35: trinta e cinco centésimos 
• 0,125: cento e vinte e cinco milésimos 
• 1,50: um inteiro e cinquenta centésimos 
• 2,1: dois inteiros e um décimo 
• 4,8: quatro inteiros e oito décimos 
Operações com Números Decimais 
Para realizar as operações dos números decimais, devemos alinhar os números 
segundo a vírgula e as casas decimais que possuem. 
Adição 
A) 0,2 + 0,9 = 1,1 
B) 2,35 + 0,17 = 2,52 
C) 89,36 + 0,035 + 97,89 = 187,285 
Subtração 
A) 0,3 – 0,1 = 0,2 
B) 25,4 – 13,2 = 12,2 
C) 356,85 – 114,3 – 0,35 = 242,2 
Multiplicação 
A) 3,2. 2,1 = 32 + 64 = 6,72 
B) 5,12. 0,8 = 4096 + 0 = 4,096 
C) 1,75. 3,11 = 175 + 175 + 525 = 5,4425 
Divisão 
A) 48,7: 0,8 = 68,875 ', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(10, 'Regra de Três Simples e Composta', 'A geometria plana ou euclidiana é a parte da matemática que estuda as figuras que 
não possuem volume. 
A geometria plana também é chamada de euclidiana, uma vez que seu nome 
representa uma homenagem ao geômetra Euclides de Alexandria, considerado o “pai 
da geometria”. 
Curioso notar que o termo geometria é a união das palavras “geo” (terra) e “metria” 
(medida); assim, a palavra geometria significa a "medida de terra". 
Conceitos de Geometria Plana 
Alguns conceitos são de suma importância para o entendimento da geometria plana, a 
saber: 
Ponto 
Conceito adimensional, uma vez que não possui dimensão. Os pontos determinam 
uma localização e são indicados com letras maiúsculas. 
Reta 
A reta, representada por letra minúscula, é uma linha ilimitada unidimensional (possui 
o comprimento como dimensão) e pode se apresentar em três posições: 
• horizontal 
• vertical 
• inclinada 
Dependendo da posição das retas, quando elas se cruzam, ou seja, possuem um ponto 
em comum, são chamadas de retas concorrentes. 
Por outro lado, as que não possuem ponto em comum, são classificadas como retas 
paralelas. 
Segmento de Reta 
Diferente da reta, o segmento de reta é limitado pois corresponde a parte entre dois 
pontos distintos. 
A semirreta é limitada somente num sentido, visto que possui início e não possui fim. 
Plano 
Corresponde a uma superfície plana bidimensional, ou seja, possui duas dimensões: 
comprimento e largura. Nessa superfície que se formam as figuras geométricas. 
Ângulos 
Os ângulos são formados pela união de dois segmentos de reta, a partir de um ponto 
comum, chamado de vértice do ângulo. São classificados em: 
• ângulo reto (Â = 90º) 
• ângulo agudo (0º 
• ângulo obtuso (90º 
Área 
A área de uma figura geométrica expressa o tamanho de uma superfície. Assim, quanto 
maior a superfície da figura, maior será sua área. 
Perímetro 
O perímetro corresponde a soma de todos os lados de uma figura geométrica. 
Figuras da Geometria Plana 
Triângulo 
Polígono (figura plana fechada) de três lados, o triângulo é uma figura geométrica 
plana formada por três segmentos de reta. 
Segundo a forma dos triângulos, eles são classificados em: 
• triângulo equilátero: possui todos os lados e ângulos internos iguais (60°); 
• triângulo isósceles: possui dois lados e dois ângulos internos congruentes; 
• triângulo escaleno: possui todos os lados e ângulos internos diferentes. 
No tocante aos ângulos que formam os triângulos, eles são classificados em: 
• triângulo retângulo: possui um ângulo interno de 90°; 
• triângulo obtusângulo: possui dois ângulos agudos internos, ou seja, menor que 
90°, e um ângulo obtuso interno, maior que 90°; 
• triângulo acutângulo: possui três ângulos internos menores que 90°. 
Saiba mais sobre os triângulos com a leitura dos artigos: 
Quadrado 
Polígono de quatro lados iguais, o quadrado ou quadrilátero é uma figura geométrica 
plana que possuem os quatro ângulos congruentes: retos (90°). 
Retângulo 
Figura geométrica plana marcada por dois lados paralelos no sentido vertical e os 
outros dois paralelos, no horizontal. Assim, todos os lados do retângulo formam 
ângulos reto (90°). 
Círculo 
Figura geométrica plana caracterizada pelo conjunto de todos os pontos de um plano. 
O raio (r) do círculo corresponde a medida da distância entre o centro da figura até sua 
extremidade. 
Trapézio 
Chamado de quadrilátero notável, pois a soma dos seus ângulos internos corresponde 
a 360º, o trapézio é uma figura geométrica plana. 
Ele possui dois lados e bases paralelas, donde uma é maior e outra menor. São 
classificados em: 
• trapézio retângulo: possui dois ângulos de 90º; 
• trapézio isósceles ou simétrico: os lados não paralelos possuem a mesma 
medida; 
• trapézio escaleno: todos os lados de medidas diferentes. 
Losango 
Quadrilátero equilátero, ou seja, formado por quatro lados iguais, o losango, com o 
quadrado e o retângulo, é considerado um paralelogramo. 
Ou seja, é um polígono de quatro lados os quais possuem lados e ângulos opostos 
congruentes e paralelos. 
Geometria Espacial 
A Geometria Espacial é a área da matemática que estuda as figuras que possuem mais 
de duas dimensões. 
Assim, o que a difere da geometria plana (que apresenta objetos bidimensionais) é o 
volume que essas figuras apresentam, ocupando um lugar no espaço. ', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(10, 'Equação do Primeiro Grau', 'As equações de primeiro grau são sentenças matemáticas que estabelecem relações 
de igualdade entre termos conhecidos e desconhecidos, representadas sob a forma: 
ax+b = 0 
Donde a e b são números reais, sendo a um valor diferente de zero (a ≠ 0) e x 
representa o valor desconhecido. 
O valor desconhecido é chamado de incógnita que significa "termo a determinar". As 
equações do 1º grau podem apresentar uma ou mais incógnitas. 
As incógnitas são expressas por uma letra qualquer, sendo que as mais utilizadas são x, 
y, z. Nas equações do primeiro grau, o expoente das incógnitas é sempre igual a 1. 
As igualdades 2.x = 4, 9x + 3 y = 2 e 5 = 20a + b são exemplos de equações do 1º grau. 
Já as equações 3x2+5x-3 =0, x3+5y= 9 não são deste tipo. 
O lado esquerdo de uma igualdade é chamado de 1º membro da equação e o lado 
direito é chamado de 2º membro. 
Como resolver uma equação de primeiro grau? 
O objetivo de resolver uma equação de primeiro grau é descobrir o valor 
desconhecido, ou seja, encontrar o valor da incógnita que torna a igualdade 
verdadeira. 
Para isso, deve-se isolar os elementos desconhecidos em um dos lados do sinal de igual 
e os valores constantes do outro lado. 
Contudo, é importante observar que a mudança de posição desses elementos deve ser 
feita de forma que a igualdade continue sendo verdadeira. 
Quando um termo da equação mudar de lado do sinal de igual, devemos inverter a 
operação. Assim, se estiver multiplicando, passará dividindo, se estiver somando, 
passará subtraindo e vice-versa. 
Exemplo 
Qual o valor da incógnita x que torna a igualdade 8x - 3 = 5 verdadeira? 
Solução 
Para resolver a equação, devemos isolar o x. Para isso, vamos primeiro passar o 3 para 
o outro lado do sinal de igual. Como ele está subtraindo, passará somando. Assim: 
8x = 5 + 3 
8x = 8 
Agora podemos passar o 8, que está multiplicando o x, para o outro lado dividindo: 
x = 8/8 
x = 1 
Outra regra básica para o desenvolvimento das equações de primeiro grau determina o 
seguinte: 
Se a parte da variável ou a incógnita da equação for negativa, devemos multiplicar 
todos os membros da equação por –1. Por exemplo: – 9x = – 90. (-1) 
9x = 90 
x = 10 ', '2025-12-07', 5);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(10, 'Período Simples', 'Em breve', '2025-12-07', 5);

-- CIÊNCIAS 7º (ID 11)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(11, 'Microscopia e Célula', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(11, 'Protozoários, Doenças e Bactérias', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(11, 'Reino Fungi (Fungos)', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(11, 'Verminoses e Prevenção', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(11, 'Biomas Brasileiros e Ecossistemas', 'Em breve', '2025-12-07', 5);

-- HISTÓRIA 7º (ID 12)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(12, 'Feudalismo e Idade Média', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(12, 'Renascimento Cultural e Científico', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(12, 'Expansão Marítima e Comercial', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(12, 'Colonização da América Espanhola e Inglesa', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(12, 'Brasil Colônia (Estrutura e Economia)', 'Em breve', '2025-12-07', 5);

-- GEOGRAFIA 7º (ID 13)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(13, 'Formação Territorial Brasileira', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(13, 'Dinâmica e Crescimento Populacional', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(13, 'Migrações (Internas e Externas)', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(13, 'Estrutura Etária e Pirâmides', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(13, 'Setores da Economia (Primário, Secundário, Terciário)', 'Em breve', '2025-12-07', 5);

-- ARTES 7º (ID 14)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(14, 'Perspectiva e Ilusionismo na Arte', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(14, 'Introdução à Fotografia e ao Cinema', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(14, 'Gêneros Musicais', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(14, 'Cultura de Massa e Indústria Cultural', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(14, 'Análise de Gêneros Textuais e Midiáticos', 'Em breve', '2025-12-07', 5);

-- INGLÊS 7º (ID 15)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(15, 'Rotina e Expressão de Preferências', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(15, 'Simple Present (Estrutura e Usos)', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(15, 'Present Continuous', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(15, 'Pronomes Possessivos e Vocabulário de Rotina', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(15, 'Reading: Compreensão de Textos sobre Rotina', 'Em breve', '2025-12-07', 5);

-- EDUCAÇÃO FÍSICA 7º (ID 16)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(16, 'Danças Folclóricas e Regionais Brasileiras', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(16, 'Danças Indígenas e de Matriz Africana', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(16, 'Esportes de Rede/Parede (Vôlei, Tênis)', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(16, 'Esportes de Campo/Taco (Beisebol)', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(16, 'Lutas de Matriz Indígena e Lutas do Mundo', 'Em breve', '2025-12-07', 5);

-- 8° ANO CONTEUDO

-- PORTUGUÊS 8º (ID 17)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(17, 'Termos Essenciais da Oração (Sujeito e Predicado)', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(17, 'Complementos Verbais e Predicativos', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(17, 'Concordância Verbal e Nominal', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(17, 'Regência Verbal e Nominal', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(17, 'Gêneros Expositivos (Blog, Notícia, Artigo)', 'Em breve', '2025-12-07', 5);

-- MATEMÁTICA 8º (ID 18)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(18, 'Monômios, Polinômios e Produtos Notáveis', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(18, 'Fatoração de Expressões Algébricas', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(18, 'Sistemas de Equações do 1º Grau', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(18, 'Teorema de Pitágoras e Relações Métricas', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(18, 'Funções de 1º Grau (Conceitos e Gráficos)', 'Em breve', '2025-12-07', 5);

-- CIÊNCIAS 8º (ID 19)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(19, 'Corpo Humano: Sistemas Reprodutor e Endócrino', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(19, 'Puberdade e Adolescência', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(19, 'Drogas, Efeitos e Sistemas', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(19, 'Hereditariedade e Genética Básica', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(19, 'Vacinas, DSTs e Prevenção', 'Em breve', '2025-12-07', 5);

-- HISTÓRIA 8º (ID 20)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(20, 'Iluminismo e Absolutismo', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(20, 'Revoluções Inglesa e Francesa', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(20, 'Independência dos EUA e da América Latina', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(20, 'Brasil: 1º e 2º Reinado', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(20, 'Guerra do Paraguai e Proclamação da República', 'Em breve', '2025-12-07', 5);

-- GEOGRAFIA 8º (ID 21)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(21, 'O Processo de Globalização', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(21, 'Capitalismo e Socialismo (União Soviética)', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(21, 'Doutrinas e Crises (Guerra Fria)', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(21, 'Questões Ambientais e Sustentabilidade', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(21, 'Organização do Espaço Mundial', 'Em breve', '2025-12-07', 5);

-- ARTES 8º (ID 22)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(22, 'Impressionismo e Pós-Impressionismo', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(22, 'Vanguardas Europeias (Cubismo, Surrealismo)', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(22, 'Arte Contemporânea', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(22, 'Arte como Crítica e Protesto', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(22, 'Cultura Hip Hop e Graffiti', 'Em breve', '2025-12-07', 5);

-- INGLÊS 8º (ID 23)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(23, 'Simple Past e Past Continuous', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(23, 'Past Perfect', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(23, 'Modal Verbs (Can, Must, Should)', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(23, 'Future Tenses (Will e Going To)', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(23, 'Comparativos e Superlativos', 'Em breve', '2025-12-07', 5);

-- EDUCAÇÃO FÍSICA 8º (ID 24)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(24, 'Lutas Regionais Brasileiras', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(24, 'Ginástica de Condicionamento Físico', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(24, 'Ginástica de Competição (Artística, Rítmica)', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(24, 'Exercício, Alimentação e Saúde', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(24, 'Primeiros Socorros no Esporte', 'Em breve', '2025-12-07', 5);

-- 9º ANO CONTEUDOS

-- PORTUGUÊS 9º (ID 25)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(25, 'Funções Sintáticas (Termos da Oração)', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(25, 'Orações Subordinadas Substantivas', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(25, 'Orações Subordinadas Adjetivas e Adverbiais', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(25, 'Classificação Gramatical e Filosófica da Linguagem', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(25, 'Análise Sintática do Período Composto', 'Em breve', '2025-12-07', 5);

-- MATEMÁTICA 9º (ID 26)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(26, 'Equações de 2º Grau e Fórmula de Bhaskara', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(26, 'Funções do 2º Grau (Parábola e Vértice)', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(26, 'Geometria Espacial (Sólidos)', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(26, 'Estatística Básica (Média, Moda, Mediana)', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(26, 'Noções de Trigonometria (Triângulo Retângulo)', 'Em breve', '2025-12-07', 5);

-- CIÊNCIAS 9º (ID 27)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(27, 'Célula, Organelas e Metabolismo', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(27, 'Ecologia e Relações com o Meio Ambiente', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(27, 'Genética, Hereditariedade e DNA', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(27, 'Tabela Periódica e Estrutura Atômica', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(27, 'Ligações Químicas e Reações Químicas', 'Em breve', '2025-12-07', 5);

-- HISTÓRIA 9º (ID 28)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(28, 'As Grandes Guerras (1ª e 2ª GM)', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(28, 'Guerra Fria e a Nova Ordem Mundial', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(28, 'Era Vargas e o Populismo', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(28, 'Ditadura Militar no Brasil', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(28, 'Redemocratização e Brasil Contemporâneo', 'Em breve', '2025-12-07', 5);

-- GEOGRAFIA 9º (ID 29)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(29, 'Conflitos no Oriente Médio', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(29, 'Conflitos na África Subsaariana', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(29, 'Nova Ordem Mundial e Globalização', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(29, 'Urbanização e Megacidades', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(29, 'Organizações Internacionais e Blocos Econômicos', 'Em breve', '2025-12-07', 5);

-- ARTES 9º (ID 30)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(30, 'Arte Figurativa e Arte da Antiguidade', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(30, 'Instrumentos Musicais e Famílias', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(30, 'Espaço Cênico e Construção de Personagem', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(30, 'Danças Folclóricas e Tradicionais Brasileiras', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(30, 'A Linguagem do Corpo e da Cena', 'Em breve', '2025-12-07', 5);

-- INGLÊS 9º (ID 31)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(31, 'Expressão de Opinião e Argumentação', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(31, 'Present Perfect Simple e Continuous', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(31, 'Conditional Sentences (Tipos 0 e 1)', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(31, 'Voz Passiva (Passive Voice)', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(31, 'Vocabulário Avançado e Textos Argumentativos', 'Em breve', '2025-12-07', 5);

-- EDUCAÇÃO FÍSICA 9º (ID 32)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(32, 'Esportes Coletivos de Alto Nível', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(32, 'Práticas Corporais de Aventura (Natureza e Urbana)', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(32, 'Mídia e a Espetacularização do Esporte', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(32, 'Dopagem, Ética e Regras do Jogo', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(32, 'Treinamento Físico e Performance', 'Em breve', '2025-12-07', 5);


-- 1° SERIE CONTEUDOS

-- PORTUGUÊS 1° (ID 33)
INSERT INTO conteudos
(id_materia, titulo, texto, data_criacao, ordem) values
(33, 'Gênero Textual','Tipos e gêneros textuais:
Gêneros textuais são as diferentes formas de texto usadas para transmitir as 
mensagens que pretendemos aos seus receptores. São exemplos de gêneros 
textuais: crônicas, contos, notícias, bilhetes, listas de compras e receitas.
Tipos e gêneros textuais:
Os gêneros textuais são classificados conforme a sua função comunicativa. 
Eles são produzidos com linguagens e estruturas diferentes, ou seja, cada 
gênero textual recorre a um tipo de texto.
Há muitos gêneros textuais, enquanto há cinco tipos de texto: narrativo, 
descritivo, argumentativo, expositivo e injuntivo.
Exemplos de gêneros textuais narrativos:
Os textos narrativos apresentam ações de personagens no tempo e no espaço. 
A estrutura da narração é dividida em: apresentação, desenvolvimento, clímax 
e desfecho.
Novela;
Romance;
Crônica;
Conto;
Contos de Fada;
Fábula;
Lenda;
Biografia;
Autobiografia;
Anedota.
Exemplos de gêneros textuais descritivos:

Os textos descritivos se ocupam em relatar e expor determinada pessoa, 
objeto, lugar, acontecimento. Dessa forma, são textos repletos de adjetivos, os 
quais descrevem ou apresentam imagens a partir das percepções sensoriais 
do locutor (emissor).
Relato (viagens, históricos, etc.);
Diário;
Notícia;
Currículo;
Lista de compras;
Cardápio;
Anúncio de classificados.
Exemplos de gêneros textuais argumentativos: 
Os textos argumentativos são aqueles encarregados de expor um tema ou 
assunto por meio de argumentações. São marcados pela defesa de um ponto 
de vista, ao mesmo tempo que tentam persuadir o leitor. Sua estrutura textual é 
dividida em três partes: tese (apresentação), antítese (desenvolvimento), nova 
tese (conclusão).
Editorial Jornalístico;
Resenha;
Artigo de opinião;
Ensaio;
Monografia, dissertação de mestrado e tese de doutorado.
Exemplos de gêneros textuais expositivos: 
Os textos expositivos possuem a função de expor determinada ideia, por meio 
de recursos como: definição, conceituação, informação, descrição e 
comparação.
Seminários:
Palestras;
Conferências;
Entrevistas;
Trabalhos acadêmicos;
Enciclopédia;
Verbetes de dicionários;
Ata.
Exemplos de gêneros textuais injuntivos:
O texto injuntivo, também chamado de texto instrucional, é aquele que indica 
uma ordem, de modo que o locutor (emissor) objetiva orientar e persuadir o 
interlocutor (receptor). Por isso, geralmente apresenta verbos no imperativo.
Propaganda;
Receita culinária;
Bula de remédio;
Manual de instruções;
Regulamento.','2025-11-14',1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(33, 'Interpretação de Textos','Interpretação de texto é o processo de compreensão e de percepção dos 
detalhes explícitos e implícitos de um texto, além do ato de explicar um texto 
após a sua compreensão. Para isso, é necessário que, antes, o(a) leitor(a) o 
tenha compreendido. Nesse percurso, entre o processo inconsciente de 
compreensão e a ação consciente de interpretação da obra, ele(a) vai 
depender do conhecimento de mundo, além dos conhecimentos linguísticos 
e/ou literários para encontrar o(s) sentido(s) do texto e o explicar.
Para fazer uma boa interpretação de texto, é preciso considerar os objetivos de 
seu autor (emissor ou enunciador). No entanto, isso não pode ser feito por 
meio de suposições, pois estão no texto todos os elementos necessários para 
a sua compreensão e para a sua interpretação. É o texto que nos diz qual é a 
intenção comunicativa de seu autor.
A interpretação de texto é um processo racional de análise do texto. Isso 
3
significa que qualquer afirmação que o(a) leitor(a) fizer sobre o que leu deve 
ser passível de comprovação a partir de elementos textuais. Se o(a) leitor(a) 
não consegue comprovar sua leitura por meio de argumentos sustentados pelo 
texto lido, sua interpretação é uma invenção.
É claro que existem textos plurissignificativos, que, portanto, permitem mais de 
uma leitura. Porém, elas também necessitam de comprovação. Então, o(a) 
leitor(a) precisa analisar, criticar e fazer perguntas ao texto, para buscar 
elementos que comprovem a sua interpretação. O bom leitor e a boa leitora não 
são ingênuos, são críticos e, portanto, questionadores:
Quem é o enunciador?
Qual é o seu objetivo?
Por que ele fez essa ou aquela afirmação?
Ele tem uma segunda intenção?
Em que contexto ele escreveu o texto?
Além disso, a interpretação de um texto também vai depender do repertório 
do(a) leitor(a), ou seja, do conhecimento de mundo. É isso que permite que 
determinada leitora entenda certo trecho de um texto, enquanto outro leitor 
não o compreende. Ressalta-se, ainda, que os textos vivem em constante 
diálogo uns com os outros, o que é chamado de intertextualidade.','2025-12-07',2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(33, 'Funções da Linguagem','As funções da linguagem são formas de utilização da linguagem segundo a 
intenção do falante.
Elas são classificadas em seis tipos: função referencial, função emotiva, 
função poética, função fática, função conativa e função metalinguística.
Cada uma desempenha um papel relacionado com os elementos presentes na 
comunicação: emissor, receptor, mensagem, código, canal e contexto. Assim, 
elas determinam o objetivo dos atos comunicativos.
Também chamada de função informativa, a função referencial tem como 
objetivo principal informar, referenciar algo.
Voltada para o contexto da comunicação, esse tipo de texto é escrito na 
terceira pessoa (singular ou plural) enfatizando seu caráter impessoal.
Como exemplos de linguagem referencial podemos citar os materiais didáticos, 
textos jornalísticos e científicos. Todos eles, por meio de uma linguagem 
denotativa, informam a respeito de algo, sem envolver aspectos subjetivos ou 
emotivos à linguagem.
Também chamada de função expressiva, na função emotiva o emissor tem 
como objetivo principal transmitir suas emoções, sentimentos e subjetividades 
por meio da própria opinião. Esse tipo de texto, escrito em primeira pessoa, 
está voltado para o emissor, uma vez que possui um caráter pessoal.
Como exemplos podemos destacar: os textos poéticos, as cartas, os diários. 
Todos eles são marcados pelo uso de sinais de pontuação, por exemplo, 
reticências, ponto de exclamação, etc.
A função poética é característica das obras literárias que possui como marca a 
utilização do sentido conotativo das palavras.
Nessa função, o emissor preocupa-se na maneira como a mensagem será 
transmitida por meio da escolha das palavras, das expressões, das figuras de 
linguagem. Por isso, aqui o principal elemento comunicativo é a mensagem.
Note que esse tipo de função não pertence somente aos textos literários. 
Também encontramos a função poética na publicidade ou nas expressões 
cotidianas em que há o uso frequente de metáforas (provérbios, anedotas, 
trocadilhos, músicas).
A função fática tem como objetivo estabelecer ou interromper a comunicação 
de modo que o mais importante é a relação entre o emissor e o receptor da 
mensagem. Aqui, o foco reside no canal de comunicação. Esse tipo de função 
é muito utilizada nos diálogos, por exemplo, nas expressões de cumprimento, 
saudações, discursos ao telefone, etc.
Também chamada de apelativa, a função conativa é caracterizada por uma 
linguagem persuasiva que tem o intuito de convencer o leitor ou o ouvinte. Por 
isso, o grande foco é no receptor da mensagem.
Essa função é muito utilizada nas propagandas, publicidades e discursos 
políticos, de modo a influenciar o receptor por meio da mensagem transmitida.
Esse tipo de texto costuma se apresentar na segunda ou na terceira pessoa 
com a presença de verbos no imperativo e o uso do vocativo.
A função metalinguística é caracterizada pelo uso da metalinguagem, ou seja, 
a linguagem que se refere a ela mesma. Dessa forma, o emissor explica um 
código utilizando o próprio código.
Um texto que descreva sobre a linguagem textual ou um documentário 
cinematográfico que fala sobre a linguagem do cinema são alguns exemplos.
Nessa categoria, os textos metalinguísticos que merecem destaque são as 
gramáticas e os dicionários.','2025-12-07',3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(33, 'Elementos da narrativa','Os elementos da narrativa - enredo, narrador, personagens, tempo e espaço - 
são essenciais para fazer uma narração.
A narração é o relato de um fato ou de um acontecimento. Sem os elementos 
da narrativa na sua estrutura, a narração não existe, porque sem eles não 
conseguimos contar uma história.
Romance, novela, fábula e conto são exemplos de narrativa.
Enredo é o conjunto de acontecimentos da narração. O enredo dá sequência a 
uma história, porque em torno dele se desenvolvem tudo o que acontece nela.
A principal característica do enredo é o conflito, que cria a tensão na narrativa.
As partes do enredo são:
exposição (introdução);complicação (desenvolvimento);clímax, que é o 
momento de maior tensão;desfecho (conclusão).Exemplo de enredo: Na 
história da Chapeuzinho Vermelho, o Lobo é o conflito. Ele engana a menina, 
depois faz se passar por ela para enganar a sua avó e devorá-la. Por fim, o 
Lobo faz se passar pela avó para devorar a menina também.
Narrador é aquele que conta uma história. Ele é o principal elemento da 
estrutura de uma narrativa.
Também chamado de foco narrativo, representa a voz do texto. Dependendo 
de como atua na narração, o narrador pode ser classificado em:
narrador personagem ou narrador primeira pessoanarrador observador ou 
narrador terceira pessoaO NARRADOR PERSONAGEM participa da história 
como um personagem da narração. Ele pode ser o personagem secundário ou 
principal.
Se o texto tiver esse tipo de narrador, a história será narrada em 1ª pessoa do 
singular (eu) ou do plural (nós).
As variantes do narrador personagem são: narrador testemunha, quando narra 
acontecimentos em que participou, geralmente como personagem secundário, 
e narrador protagonista, quando é o personagem central.
O NARRADOR OBSERVADOR sabe tudo sobre a história, porque observa tudo e 
faz o relato daquilo que observa.
Diferente do narrador personagem, o narrador observador não participa da 
história. Esse tipo de narração é feita na 3ª pessoa do singular (ele, ela) ou 
plural (eles, elas).
As variantes do narrador observador são: narrador intruso, quando conversa 
com o leitor, expressando a sua opinião, e narrador parcial, quando se 
identifica com um personagem, dando-lhe mais destaque na narração.
Exemplo de narrador: O narrador personagem de Memórias Póstumas de Brás 
Cubas, de Machado de Assis. Essa história é narrada em primeira pessoa, por 
um defunto, que narra acontecimentos em que participou.
Personagens são aqueles que atuam na narração, falando ou agindo.
De acordo com o papel que desempenham, os personagens são classificados 
em:
protagonista, quando é o principal, ou seja, o mais importante;antagonista, 
quando se opõe ao protagonista;secundário, quando não tem muito destaque, 
ou seja, é menos importante.Exemplo de personagens: Os personagens da 
história da Chapeuzinho Vermelho são a menina, que é a protagonista; o lobo, 
que é o antagonista; a avô e o caçador, que são os personagens secundários.
Tempo é o período em que a história se passa, considerando a época, a 
duração, a ordem da narração.
De acordo com a ordem da narração, o tempo pode ser:
cronológico, quando segue uma ordem natural dos acontecimentos - do início 
para o fimpsicológico, quando não segue uma ordem natural dos 
acontecimentos e mistura passado, presente e futuro, podendo narrar do fim 
para o começo, por exemplo.Exemplo de tempo: Em Memórias Póstumas de 
Brás Cubas, de Machado de Assis, o tempo é psicológico, porque não segue 
uma ordem natural dos acontecimentos. A história começa com o enterro do 
narrador que, depois, narra a sua infância e juventude.
Espaço é o local onde a narrativa se desenvolve. O espaço pode ser:
físico, quando se passa a história é indicado seja uma fazenda, uma cidade, 
uma praia, etc. São classificados em espaços fechados (casa, quarto, hospital, 
etc.) ou abertos (ruas, vilas, cidades, etc.).psicológico, quando não é revelado 
um espaço físico, mas sim, um ambiente caraterizado econômica ou 
moralmente.Exemplo de espaço: Na história da Chapeuzinho Vermelho, os 
espaço físicos onde se passa a história são a floresta e a casa da avó.','2025-12-07',4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(33, 'Coesão e Coerência','A Coesão e a Coerência são mecanismos fundamentais na construção textual.
Para um texto ser eficaz na transmissão da sua mensagem, é essencial fazer 
sentido para o leitor. Além disso, deve ser harmonioso, para a mensagem fluir 
de forma segura, natural e agradável aos ouvidos.
A coesão é resultado da disposição e da correta utilização das palavras que 
propiciam a ligação entre frases, períodos e parágrafos de um texto. Ela 
colabora com sua organização e pode ocorrer por meio de palavras chamadas 
de conectivos. A coesão pode ser obtida através de elementos anafóricos e 
catafóricos. A anáfora e a catáfora se referem à informação expressa no texto 
e, por esse motivo, são qualificadas como endofóricas. Enquanto a anáfora 
retoma um componente, a catáfora o antecipa, contribuindo com a ligação e a 
harmonia textual. 
Mecanismos de coesão: Os mecanismos de coesão são:
referência;
substituição;
elipse;
conjunção;
coesão lexical.
Referência: Utilizar outros elementos (pronomes pessoais, pronomes 
demonstrativos e comparações) para evitar repetições.
Referência pessoal: utilização de pronomes pessoais e possessivos, por 
exemplo: João e Maria casaram. ELES são pais de Ana e Beto. Referência 
pessoal anafórica)
Referência demonstrativa: utilização de pronomes demonstrativos e advérbios, 
por exemplo: Fiz todas as tarefas, com exceção DESTA arquivar a 
correspondência. Referência demonstrativa catafórica)
Referência comparativa: utilização de comparações através de semelhanças, 
por exemplo: Mais um dia IGUAL AOS outros. Referência comparativa 
endofórica)
Substituir um elemento (nominal, verbal, frasal) por outro é uma forma de evitar 
as repetições.
EXEMPLO Vamos à prefeitura amanhã, eles irão na próxima semana.
Observe que a diferença entre a referência e a substituição está expressa 
especialmente no fato de que a substituição acrescenta uma informação nova 
ao texto.
No caso de “João e Maria casaram. Eles são pais de Ana e Betoˮ, o pronome 
pessoal referencia as pessoas João e Maria, não acrescentando informação 
adicional ao texto.
ElipseUm componente textual, quer seja um nome, um verbo ou uma frase, 
pode ser omitido através da elipse.
EXEMPLO Temos ingressos a mais para o concerto. Você os quer?
A segunda oração é perceptível mediante o contexto. Assim, sabemos que o 
que está sendo oferecido são ingressos para o concerto.)
ConjunçãoA conjunção liga orações estabelecendo relação entre elas.
EXEMPLO Nós não sabemos quem é o culpado, MAS ele sabe. (adversativa)
A coesão lexical consiste na utilização de palavras que possuem sentido 
aproximado ou que pertencem a um mesmo campo lexical. São elas: 
sinônimos, hiperônimos, nomes genéricos, entre outros.
EXEMPLO Aquela escola não oferece as condições mínimas de trabalho. A 
INSTITUIÇÃO está literalmente caindo aos pedaços.
Coerência textualA coerência é a relação lógica das ideias de um texto que 
decorre da sua argumentação - resultado especialmente dos conhecimentos 
do transmissor da mensagem.
Um texto contraditório e redundante, ou cujas ideias iniciadas não são 
concluídas, é um texto incoerente. A incoerência compromete a clareza do 
discurso, a sua fluência e a eficácia da leitura.
Assim, a incoerência não é só uma questão de conhecimento, decorre também 
do uso de tempos verbais e da emissão de ideias contrárias.
Exemplos:
O relatório está pronto, porém o estou finalizando até agora. (processo verbal 
acabado e inacabado)Ele é vegetariano e gosta de um bife muito malpassado. 
(os vegetarianos são assim classificados pelo fato de se alimentar apenas de 
vegetais)Ana foi ao evento, todavia, porque não tinha sido convidada. (foram 
usados dois conectivos - todavia e porque que não expressam sentido)Fatores 
de coerênciaSão inúmeros os fatores que contribuem para a coerência de um 
texto, tendo em vista a sua abrangência, tais como:
conhecimento de mundoinferênciasfatores de 
contextualizaçãoinformatividadeConhecimento de mundoÉ o conjunto de 
conhecimento que adquirimos ao longo da vida e que são arquivados na nossa 
memória.
São os chamados frames (rótulos), esquemas (planos de funcionamento, como 
a rotina alimentar: café da amanhã, almoço e jantar), planos (planejar algo com 
um objetivo, tal como jogar um jogo), scripts (roteiros, tal como normas de 
etiqueta).
EXEMPLO Peru, Panetone, frutas e nozes. Tudo a postos para o Carnaval!
Uma questão cultural nos leva a concluir que a oração acima é incoerente. Isso 
porque “peru, panetone, frutas e nozesˮ (frames) são elementos que 
pertencem à celebração do Natal e não à festa de carnaval.
InferênciasAtravés das inferências, as informações podem ser simplificadas se 
partimos do pressuposto que os interlocutores partilham do mesmo 
conhecimento.
EXEMPLO Quando os chamar para jantar, não esqueça que eles são indianos. 
(ou seja, em princípio, esses convidados não comem carne de vaca)
Há fatores que inserem o interlocutor na mensagem providenciando a sua 
clareza, como os títulos de uma notícia ou a data de uma mensagem.
EXEMPLO Está marcado para às 10h. O que está marcado para às 10h? 
Não sei sobre o que está falando.
InformatividadeQuanto maior informação não previsível um texto tiver, mais 
rico e interessante ele será. Assim, dizer o que é óbvio ou insistir numa 
informação e não desenvolvê-la, com certeza desvaloriza o texto.
EXEMPLO O Brasil foi colonizado por Portugal.
Princípios básicos de coerênciaApós termos visto os fatores acima, é essencial 
ter em atenção os seguintes princípios para se obter um texto coerente:
Princípio da Não Contradição - ideias contraditóriasPrincípio da Não Tautologia - ideias redundantesPrincípio da Relevância - ideias que se 
relacionamDiferença entre coesão e coerênciaA diferença entre coesão e 
coerência é a relação que elas têm com o texto: interna (questões gramaticais), 
no caso da coesão, e externa (questões lógicas), no caso da coerência.
Coesão e coerência são coisas diferentes, de modo que um texto coeso pode 
ser incoerente. Ambas têm em comum o fato de estarem relacionadas com as 
regras essenciais para uma boa produção textual.','2025-12-07',4);

-- MATEMÁTICA 1° (ID 34)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(34, 'Conjuntos', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(34, 'Função 1º grau', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(34, ' Função 2º grau', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(34, ' Geometria plana', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(34, 'Fatoraçãos', 'Em breve', '2025-12-07', 5);

-- HISTÓRIA 1° (ID 35)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(35, 'Antiguidade', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(35, 'Idade Média', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(35, 'Expansões', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(35, 'Colonização', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(35, 'Brasil Colônia', 'Em breve', '2025-12-07', 5);

-- GEOGRAFIA 1° (ID 36)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(36, 'Cartografia', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(36, 'Terra', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(36, 'Climas', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(36, 'Biomas', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(36, 'População', 'Em breve', '2025-12-07', 5);

-- FÍSICA 1° (ID 39)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(39, 'Grandezas físicas', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(39, 'Movimento uniforme', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(39, 'Movimento uniformemente variado', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(39, 'Vetores', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(39, 'Dinâmica', 'Em breve', '2025-12-07', 5);

-- QUÍMICA 1° (ID 40)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(40, 'Matéria', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(40, 'Ligações químicas', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(40, 'Tabela periódica', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(40, 'Funções inorgânicas', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(40, 'Reações químicas', 'Em breve', '2025-12-07', 5);

-- ARTES 1° (ID 43)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(43, 'Elementos da arte', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(43, 'Arte antiga', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(43, 'Arte medieval e renascentista', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(43, 'Linguagens artísticas', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(43, 'Análise de obras de arte', 'Em breve', '2025-12-07', 5);

-- INGLÊS 1° (ID 42)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(42, 'To be', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(42, 'Present', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(42, 'Vocabulário', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(42, 'Reading', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(42, 'Pronomes', 'Em breve', '2025-12-07', 5);

-- EDUCAÇÃO FÍSICA 1° (ID 44)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(44, 'Condicionamento físico', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(44, 'Saúde', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(44, 'Esportes coletivos', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(44, 'Alongamento', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(44, 'Biomecânica', 'Em breve', '2025-12-07', 5);

-- 2° serie conteudos
-- PORTUGUÊS 2º (ID 45)
INSERT INTO conteudos(id_materia, titulo, texto, data_criacao, ordem) VALUES
(45,'Figuras de linguagem','Figuras de linguagem são recursos expressivos que vão além do sentido literal 
das palavras, usadas para dar mais ênfase, beleza ou emoção à comunicação, 
explorando a criatividade e os efeitos de sentido em textos e falas cotidianas, 
literatura e música. Elas se dividem em categorias como Figuras de 
Pensamento (ironia, hipérbole), Figuras de Palavras/Semântica (metáfora, 
metonímia), Figuras de Construção/Sintaxe (elipse, polissíndeto) e Figuras de 
Som/Harmonia (aliteração, assonância).
1. Figuras de Pensamento Sentido/Ideia)Ironia: Dizer o contrário do que se 
pensa, com intenção de zombar ou criticar (ex: "Que inteligente!" para alguém 
que fez besteira). Hipérbole: Exagero intencional para enfatizar (ex: "Chorei 
rios de lágrimas"). Eufemismo: Suavizar uma ideia desagradável (ex: "Ele 
partiu" em vez de "morreu"). Prosopopeia Personificação): Atribuir 
características humanas a seres inanimados (ex: "O vento sussurrava 
segredos"). Antítese: Aproximação de palavras com sentidos opostos (ex: 
"Amor e ódio"). 
2. Figuras de Palavras/Semântica Significado)Metáfora: Comparação implícita, 
sem conectivo (ex: "Seus olhos são estrelas"). Metonímia: Substituição de um 
termo por outro com relação de proximidade (ex: "Beber um copo" em vez de 
beber o líquido). Sinestesia: Mistura de sensações (ex: "Cheiro doce e 
quente"). Catacrese: Uso de uma palavra por falta de termo específico (ex: "Pé 
da mesa", "Dente de alho"). 
3. Figuras de Construção/Sintaxe Estrutura da Frase) Elipse/Zeugma: Omissão 
de um termo fácil de identificar (ex: "Ele estudava muito. Eu, menos"). 
Polissíndeto: Repetição de conectivos (ex: "Nem um, nem outro, nem 
ninguém"). Anáfora: Repetição de palavra no início de frases ou versos (ex: 
"Amor é fogo que arde sem se ver..."). Pleonasmo: Redundância para dar 
ênfase (ex: "Subir para cima"). 
4. Figuras de Som/Harmonia Sons) Aliteração: Repetição de sons 
consonantais (ex: "O rato roeu a roupa do rei...").Assonância: Repetição de 
sons vocálicos (ex: "A amara-las"). Exemplos no dia a dia"Aquela pessoa é um 
coração de ouro." Metáfora: pessoa bondosa)."Ele tem um cheiro de chuva." 
Sinestesia: sensação ligada ao cheiro)."O sol beijava a terra." Prosopopeia: sol
personificado). 
Por que são importantes?
Tornam a comunicação mais rica, expressiva e cativante.','2025-12-07',1);
INSERT INTO conteudos(id_materia, titulo, texto, data_criacao, ordem) VALUES
(45,' Concordância verbal','Concordância verbal é a relação estabelecida de forma harmônica entre sujeito 
e verbo. Isso quer dizer que quando o sujeito está no singular, o verbo também 
deve estar; quando o sujeito estiver no plural, o verbo também estará.
Exemplos:
Eu adoro quando as flores desabrocham na Primavera;
Elas adoram quando as flores desabrocham na Primavera;
Cristina e Eva entraram no hospital.
Parece simples, mas há várias situações que provocam dúvidas não só nos 
alunos, mas em qualquer falante da língua portuguesa. Vamos a elas!
Regras de concordância verbal:
1. Concordância com sujeito coletivo:
Quando o sujeito é coletivo, o verbo fica sempre no singular. Exemplos:
A multidão ultrapassou o limite;
O elenco era muito competente.
Por outro lado, se o coletivo estiver especificado, o verbo pode ser conjugado 
no singular ou no plural. Exemplos:
A multidão de fãs ultrapassou o limite;
A multidão de fãs ultrapassaram o limite.
2. Concordância com coletivos partitivos:
O verbo pode ser usado no singular ou no plural em coletivos partitivos, tais 
como "a maioria de", "a maior parte de", "grande número de". Exemplos:
Grande número dos presentes se retirou;
Grande número dos presentes se retiraram.
3. Concordância com as expressões "mais de", "menos de", "cerca de":
Nas expressões "mais de", "menos de", "cerca de", o verbo concorda com o 
numeral. Exemplos:
Mais de uma mulher quis trocar as mercadorias;
Mais de duas pessoas chegaram antes do horário.
Nos casos em que “mais deˮ é repetido, indicando reciprocidade, o verbo vai 
para o plural. Exemplos:
Mais de uma professora se abraçaram;
Mais de um funcionário se ajudaram.
4. Concordância com nomes próprios:
Com nomes próprios, a concordância deve ser feita considerando a presença 
ou não de artigos. Exemplos:
Os Estados Unidos influenciam o mundo;
Estados Unidos influencia o mundo.
5. Concordância com pronome relativo "que":
O verbo deve concordar com o antecedente do pronome “queˮ. Exemplos:
Fui eu que levei;
Foste tu que levaste;
Foi ele que levou.
6. Concordância com pronome relativo "quem":
O verbo pode ser conjugado na terceira pessoa do singular ou pode concordar 
com o antecedente do pronome "quem". Exemplos:
Fui eu quem afirmou;
Fui eu quem afirmei.
7. Concordância com expressão "um dos que":
Com a expressão "um dos que", o verbo pode ser conjugado no singular ou no 
plural. Exemplos:
Ele foi um dos que mais contribuiu;
Ele foi um dos que mais contribuíram.
8. Concordância com sujeitos formados por sinônimos:
Na concordância com sujeitos formados por sinônimos, o verbo pode: ir para o 
plural, ficar no singular ou concordar com o núcleo mais próximo. Exemplos:
Preguiça e lentidão destacaram aquela gerência;
Preguiça e lentidão destacou aquela gerência.
9. Concordância com sujeito formado por palavras em graduação e 
enumeração:
Na concordância com sujeito formado por palavras em graduação e 
enumeração, o verbo pode flexionar para o plural ou pode concordar com o 
núcleo mais próximo. Exemplos:
Um mês, um ano, uma década de poder não supriu a saúde;
Um mês, um ano, uma década de poder não supriram a saúde.
10. Concordância com sujeito formado por pessoas gramaticais diferentes:
Na concordância com sujeito formado por pessoas gramaticais diferentes, o 
verbo vai para o plural e concorda com a pessoa, por ordem de prioridade. 
Exemplos:
Eu, tu e Cássio só chegaremos ao fim da noite.(eu, 1.ª pessoa + tu, 2.ª 
pessoa + ele, 3.ª pessoa), ou seja, a 1.ª pessoa do singular tem prioridade 
e, no plural, ela equivale a nós, ou seja, "nós chegaremos";
Jair e eu conseguimos comprar um apartamento.(eu, 1.ª pessoa  Jair, 3.ª 
pessoa). Aqui também é a 1.ª pessoa do singular que tem prioridade. No 
plural, ela equivale a nós, ou seja, "nós conseguimos".
11. Concordância com sujeitos ligados por "ou":
Os verbos ligados pela partícula "ou" vão para o plural quando a ação verbal 
estiver se referindo a todos os elementos do sujeito. Exemplos:
Doces ou chocolate desagradam ao menino;
Água ou suco refrescam neste calor.
Quando a partícula “ouˮ é utilizada como retificação, o verbo concorda com o 
último elemento. Exemplos:
A menina ou as meninas esqueceram muitos acessórios;
A mãe ou o pai não lhe deu educação.
Mas, quando a ação verbal é aplicada a apenas um dos elementos, o verbo 
permanece no singular. Exemplos:
Laís ou Elisa ganhará mais tempo;
O marido ou a mulher vai ao supermercado hoje.
12. Concordância com sujeitos ligados por "nem":
Quando os sujeitos são ligados por "nem", o verbo vai para o plural. Exemplos:
Nem chuva nem frio são bem recebidos;
Nem futebol nem natação são os seus esportes preferidos.
13. Concordância com sujeitos ligados por "com":
Quando os sujeitos são ligados pela palavra "com" com sentido de "e", o verbo 
vai para o plural. Exemplos:
O ator com seus convidados chegaram às 6 horas;
O patrão com o funcionário saíram para almoçar.
Mas, quando "com" representar “em companhia deˮ, o verbo concorda com o 
antecedente e o segmento "com" é grafado entre vírgulas. Exemplos:
O patrão, com o funcionário, saiu para almoçar;
O pintor, com todos os auxiliares, resolveu mudar a data da exposição.
14. Concordância com sujeitos ligados por "não só, mas também", "tanto, 
quanto", "não só, como":
Quando os sujeitos são ligados por "não só, mas também", "tanto, quanto", 
"não só, como", o verbo vai para o plural ou concorda com o núcleo mais 
próximo. Exemplos:
Tanto Rafael como Marina participaram da mostra;
Tanto Rafael como Marina participou da mostra.
15. Concordância com a partícula "se":
No caso em que a palavra "se" é índice de indeterminação do sujeito, o verbo 
deve ser conjugado na 3.ª pessoa do singular. Exemplos:
Confia-se em todos;
Alegra-se com tudo.
No caso em que a palavra "se" é partícula apassivadora, o verbo deve ser 
conjugado concordando com o sujeito da oração. Exemplos:
Construiu-se uma igreja;
Construíram-se novas igrejas.
16. Concordância com verbos impessoais:
Os verbos impessoais - haver, com sentido de existir, fazer, com sentido de 
tempo decorrido, e verbos que manifestam fenômenos naturais - sempre são 
conjugados na 3.ª pessoa do singular. Exemplos:
Havia muitos copos naquela mesa;
Houve dois meses sem mudanças.
17. Concordância com sujeito seguido por "tudo", "nada", "ninguém", 
"nenhum", "cada um":
Na concordância com sujeito seguido por "tudo", "nada", "ninguém", 
"nenhum", "cada um", o verbo fica no singular. Exemplos:
Amélia, Camila, Pedro, ninguém o convenceu de mudar a opinião;
Diretor, professores e funcionários, cada um pensa de um jeito.
18. Concordância com sujeitos ligados por "como", "assim como", "bem 
como":
Na concordância com sujeitos ligados por "como", "assim como", "bem como", 
o verbo é conjugado no plural. Exemplos:
O trabalho, assim como a confiança, fizeram dela uma mulher forte;
O atleta, bem como o treinador, foram homenageados.
19. Concordância com locuções "é muito", "é pouco", "é mais de", "é menos 
de":
Na concordância com locuções "é muito", "é pouco", "é mais de", "é menos 
de", que indicam preço, peso e quantidade, o verbo fica sempre no singular. 
Exemplos:
Três vezes é muito;
Dois quilos de laranja é pouco para fazer o suco.
20. Concordância com verbos "dar", "soar" e "bater" + hora(s)Com horas, os 
ver
bos "dar", "soar" e "bater" sempre concordam com o sujeito. Exemplos:
Deu uma hora que espero;
Soaram duas horas.
21. Concordância nas indicações de datas:
O verbo deve concordar com a indicação numérica da data. Exemplos:
Hoje são 2 de maio.Amanhã é 1 de dezembro.
Mas o verbo também pode concordar com a palavra dia. Exemplos:
Hoje é dia 2 de maio;
Anteontem foi dia 20 de agosto.
22. Concordância com verbos no infinitivo:
Verbos no infinitivo IMPESSOAL não devem ser flexionados nas seguintes 
situações:
a) Quando têm valor de substantivo. Exemplo: Comer é o melhor que há.
b) Quando têm valor imperativo. Exemplo: Vá dormir!
c) Quando são os verbos principais de uma locução verbal. Exemplo: Íamos 
sair quando você chegou.
d) Quando são regidos por preposição. Exemplo: Começamos a cantar.
Verbos no infinitivo PESSOAL devem ser flexionados quando os sujeitos são 
diferentes e queremos defini-los. Exemplos:
Comprei a pizza para eles comerem;
Ouvi os vizinhos chamarem.
2° ano  Concordância nominal:
Concordância nominal é a harmonização em gênero (masculino/feminino) e 
número (singular/plural) entre o substantivo e seus termos modificadores, 
como artigos, adjetivos, pronomes e numerais que o acompanham, ajustando
os para que todos sigam a mesma forma do nome principal, garantindo clareza 
e coesão na frase. 
Regra geral:
Os modificadores (artigos, adjetivos, etc.) devem concordar em gênero e 
número com o substantivo ao qual se referem.Exemplo: 
As nossas duas lindas casas (feminino plural) concorda com "casas". 
Casos comuns e específicos:
Adjetivo antes de dois substantivos: Pode concordar com o mais próximo 
(ex: "O garfo e a faca dourada") ou com ambos, no plural (ex: "O garfo e a 
faca dourados");
Adjetivo depois de dois substantivos: Concorda com ambos, no plural (ex: 
"A faca e o garfo dourados");
Palavras como "é proibido", "é necessário" Se não houver artigo ou 
pronome antes do nome: "É proibido entrada", "É necessário paciência" 
(concorda com o substantivo no singular, como um conceito abstrato).Se 
houver artigo ou pronome: "É proibida a entrada", "É necessária a 
paciência" (concorda com o artigo/pronome);
Pronomes demonstrativos: "Meio", "meia", "só", "junto", "pronto", 
"bastante" (quando advérbios, ficam invariáveis; quando 
adjetivos/pronomes, concordam);
Adjetivo antes de substantivos próprios: Concorda com o mais próximo ou 
vai para o plural (ex: "O belo rio Tietê", "Os rios Tietê e Pinheiros").
Exemplo prático:
Frase: "As alunas esforçadas aprenderam o conteúdo novo.";
Análise: "As", "esforçadas", "o", "novo" concordam com "alunas" (feminino 
plural) e "conteúdo" (masculino singular) respectivamente. 
2° ano  Regência verbal:
Regência verbal é o estudo da relação entre o verbo (termo regente) e seus 
complementos (termos regidos), definindo se o verbo precisa ou não de 
preposição para ter sentido completo, o que é fundamental para a clareza e 
correção na norma culta, com verbos transitivos (diretos, indiretos, diretos e 
indiretos) e intransitivos. A escolha da preposição (ou a falta dela) pode mudar 
completamente o significado do verbo, sendo crucial para evitar ambiguidades 
e garantir a fluidez do texto, como nos exemplos dos verbos "avisar" (algo a 
alguém ou alguém de algo) ou "lembrar/esquecer" (com ou sem pronome). 
O que é Regência Verbal?
Relação de dependência: O verbo (regente) comanda a forma como seus 
complementos (regidos) se conectam na frase;
Preposição: A presença ou ausência de preposição (a, de, em, com, etc.) é 
o ponto central da regência verbal.
Tipos de Verbos:
Intransitivos VTI Não precisam de complemento, têm sentido completo 
Ex: "Ele nasceu");
Transitivos Diretos VTD Ligam-se ao complemento sem preposição 
obrigatória Ex: "Ela leu o livro");
Transitivos Indiretos VTI Exigem preposição obrigatória Ex: "Ele 
obedeceu ao regulamento");
Transitivos Diretos e Indiretos VTDI Pedem dois complementos, um com 
e outro sem preposição Ex: "Entreguei o relatório ao chefe"). 
Exemplos Comuns e Destaques:
Avisar: Avisar algo a alguém; Avisar alguém de algo;
Implicar: Implicar com alguém (importunar); Implicar em algo (envolver);
Lembrar/Esquecer: "Esqueci o celular" VTD; "Esqueci-me do celular" 
VTI;
Assistir: Assistir ao filme (ver); Assistir o doente (ajudar);
Namorar: Namorar (sem preposição, ao contrário do uso popular).
Importância:
Garante a clareza e precisão da comunicação, evita ambiguidades e mal-entendidos e demonstra domínio da norma culta da língua portuguesa. ','2025-12-07',2);
INSERT INTO conteudos(id_materia, titulo, texto, data_criacao, ordem) VALUES
(45,'Regência Nominal',' nominal é a relação de dependência entre um nome (substantivo, 
adjetivo ou advérbio) e seu complemento, que geralmente é introduzido por 
uma preposição, definindo qual preposição usar para completar o sentido da 
palavra, como em "medo de algo" ou "atento a algo". Essa regra gramatical 
garante a correção e clareza da frase, assim como a regência verbal faz com 
os verbos, mas focada nos nomes.
Como funciona:
Termo Regente: O nome (substantivo, adjetivo ou advérbio) que pede o 
complemento;
Termo Regido: O complemento que se liga ao termo regente, quase sempre 
por uma preposição;
Preposições Comuns: As preposições mais usadas são a, de, com, em, 
para, por, mas outras podem aparecer. 
Exemplos práticos:
Substantivo: 
Medo de altura;
Adesão à causa (a + a);
Capacidade para o cargo.
Adjetivo:
Orgulhoso de sua vitória (orgulhoso de algo/alguém);
Acessível a todos (acessível a alguém);
Contente com o resultado.
Advérbio:
Perto de mim (segue a regência do adjetivo "perto");
Longe do trabalho (segue a regência do adjetivo "longe"). ','2025-12-07',3);

-- MATEMÁTICA 2º (ID 46)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(46, 'Expressões', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(46, 'Logaritmos', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(46, 'Trigonometria', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(46, 'Probabilidade', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(46, 'Estatística', 'Em breve', '2025-12-07', 5);

-- GEOGRAFIA 2º (ID 48)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(48, 'Globalização', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(48, 'Industrialização', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(48, 'Urbanização', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(48, 'Agricultura', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(48, 'Impactos ambientais', 'Em breve', '2025-12-07', 5);

-- HISTÓRIA 2º (ID 47)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(47, 'Idade Moderna', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(47, 'Revoluções', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(47, 'Iluminismo', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(47, 'Independência', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(47, 'Império', 'Em breve', '2025-12-07', 5);

-- FÍSICA 2º (ID 51)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(51, 'Leis de Newton', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(51, 'Trabalho e energia', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(51, 'Impulso e quantidade de movimento', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(51, 'Hidrostática', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(51, 'Termologia', 'Em breve', '2025-12-07', 5);

-- QUÍMICA 2º (ID 52)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(52, 'Estequiometria', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(52, 'Termoquímica', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(52, 'Cinética química', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(52, 'Equilíbrio químico', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(52, 'pH e soluções', 'Em breve', '2025-12-07', 5);

-- ARTES 2º (ID 55)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(55, 'Barroco', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(55, 'Classicismo', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(55, 'Romantismo', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(55, 'Modernismo', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(55, 'Vanguardas artísticas', 'Em breve', '2025-12-07', 5);

-- INGLÊS 2º (ID 54)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(54, 'Past', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(54, 'Future', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(54, 'Modals', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(54, 'Narrativas', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(54, 'Listening', 'Em breve', '2025-12-07', 5);

-- EDUCAÇÃO FÍSICA 2º (ID 56)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(56, 'Cardiologia aplicada', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(56, 'Aptidão física', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(56, 'Esportes individuais', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(56, 'Lesões esportivas', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(56, 'Nutrição esportiva', 'Em breve', '2025-12-07', 5);

-- 3° serie conteudos
-- PORTUGUÊS 3º (ID 57)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(57,'Análise argumentativa', 'A análise argumentativa é o processo de examinar um texto ou discurso para 
identificar e avaliar a tese (ponto de vista), os argumentos que a sustentam e 
as estratégias usadas para persuadir o público. Ela se concentra na linguagem 
natural e na lógica informal, analisando como a argumentação funciona na 
comunicação cotidiana e em gêneros como artigos de opinião e provas 
dissertativas, usando marcadores linguísticos e estratégias como 
exemplificação, comparação e contraposição. 
O que é e para que serve:
Defesa de um ponto de vista: A análise busca entender como uma tese é 
apresentada e defendida em um texto;
Persuasão e convencimento: O objetivo é entender as técnicas usadas para 
convencer o leitor ou ouvinte, como nos debates públicos e em textos de 
opinião;
Avaliação de textos: É um modelo de avaliação usado em exames e 
concursos para verificar a capacidade de um candidato de construir um 
raciocínio claro e lógico; 
Prática social: A argumentação é vista como uma prática social onde se 
defendem teses por meio de justificativas racionais.
Como funciona:
Identificação da tese: O primeiro passo é identificar o ponto de vista central 
do autor;
Reconhecimento de argumentos: É preciso identificar as proposições que 
sustentam a tese. Isso pode ser feito com base em marcadores linguísticos 
que sinalizam uma argumentação, como "portanto", "porque", "além disso";
Análise das estratégias: A análise investiga as estratégias argumentativas 
utilizadas, que podem incluir: exemplificação, enumeração, comparação e 
analogia, causas e consequências, evolução histórica, citação e 
contraposição.
Níveis de análise:
Linguagem natural: A análise se limita à linguagem natural, como o 
português, e não aborda linguagens artificiais ou simbólicas da lógica 
formal;
Foco no texto: A análise se concentra na estrutura e nos componentes dos 
argumentos dentro de um texto específico.', '2025-12-07',1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(57,'Intertextualidade', 'Intertextualidade é a relação e o "diálogo" entre um texto e outros textos pré
existentes, usando referências (explícitas ou implícitas) para criar novos 
significados, como citações, paráfrases, paródias, alusões, ou a apropriação 
de um estilo (estilização).
Ela ocorre em diversas mídias (livros, filmes, músicas, charges, pinturas, 
publicidade) e pode ser verbal, não verbal ou mista, sendo fundamental para a 
construção cultural e literária, mas diferente do plágio, que é cópia sem crédito.
O que é: 
Diálogo entre textos: Um texto se apropria de elementos (ideias, frases, 
personagens, estilos) de outro texto já conhecido pelo público;
Sentido amplo de texto: Inclui não só escritos, mas também músicas, 
filmes, pinturas, charges, propagandas, etc..;
Construção de novos sentidos: Permite reafirmar, contestar ou ressignificar 
ideias do texto original.
Tipos comuns:
Citação: Inserção direta de um trecho de outro texto (com aspas);
Paráfrase: Reescrita de uma ideia de outro texto com outras palavras;
Paródia: Imitação cômica ou irônica de um texto, mudando seu sentido 
original;
Alusão: Referência indireta a uma obra ou personagem conhecido (ex: uma 
tirinha sobre o Jardim do Éden);
Epígrafe: Uso de uma citação no início de um texto para fundamentá-lo;
Tradução/Versão: Passagem de um texto para outro idioma, mantendo o 
sentido. 
Exemplos:
A inclusão de versos da "Canção do Exílio" no Hino Nacional Brasileiro;
Músicas como "Admirável Chip Novo" Pitty) dialogando com o livro 
"Admirável Mundo Novo" Huxley);
Uma charge que referencia um quadro famoso, como "A Criação de Adão" 
de Michelangelo, para comentar um evento atual.', '2025-12-07',2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(57,'Análise de discursos', 'A Análise do Discurso AD é um campo interdisciplinar que estuda como a 
língua produz sentidos em contextos históricos e sociais, indo além do texto 
para investigar ideologias, poder e subjetividades, analisando falas, textos, 
mídias e até gestos para revelar as condições de produção e as relações de 
poder subjacentes, fundamental para entender como a linguagem molda a 
realidade e nossas identidades, e não apenas a reflete. 
O que é Análise do Discurso? Não é só gramática! Diferente de análises que 
focam na estrutura da frase, a AD se concentra no funcionamento do sentido e 
na ideologia por trás das palavras e construções. 
Linguagem em ação: A língua é vista não como um espelho neutro, mas como 
um meio de construir realidades e relações sociais. 
Foco no contexto: Analisa como o significado é moldado por fatores históricos, 
sociais, culturais e pelas condições de produção de um texto ou fala. 
Principais objetivos da AD 
Desvendar ideologias: Revelar as crenças, valores e interesses que se 
escondem na linguagem, muitas vezes naturalizados;
Analisar o poder: Entender como o discurso reproduz ou desafia relações 
de poder, dominação e alienação;
Compreender a subjetividade: Investigar como os sujeitos se formam e se 
posicionam através da linguagem;
Ir além do literal: Mostrar que não há sentido literal, pois todo sentido é um 
efeito de luta e cristalização ideológica. 
Como funciona (em linhas gerais):
Interdisciplinaridade: Utiliza conceitos da linguística, sociologia, filosofia, 
história e psicanálise;
Conceitos-chave: Explora gêneros discursivos, hegemonia, modalidade, e 
cognição social para interpretar as mensagens;
Análise crítica: Examina como práticas discursivas (mídias, política, 
conversas) organizam o social e constroem nossas visões de mundo. 
Exemplos de aplicação:
Análise de notícias;
Discursos políticos;
Postagens em redes sociais;
Filmes;
Obras de arte;
Linguagem corporal.', '2025-12-07',3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(57,'Produção textual dissertativo- argumentativa', 'O texto dissertativo-argumentativo é um tipo textual que consiste na defesa de 
uma ideia por meio de argumentos, opinião e explicações fundamentadas.
Este tipo de texto tem como objetivo central a formação de opinião do leitor. 
Assim, ele é caracterizado por tentar convencer ou persuadir o interlocutor da 
mensagem através da argumentação.
No Exame Nacional do Ensino Médio Enem) esse é o tipo de texto solicitado 
aos alunos, cujo tema aborda questões atuais de ordem social, científica, 
cultural ou política.
A estrutura do texto dissertativo-argumentativo:
O texto dissertativo-argumentativo é dividido em três partes: introdução, 
desenvolvimento e conclusão.
1. Introdução:
Na introdução devem ser mencionado o tema central que será abordado no 
texto de modo a situar o interlocutor.
Esta parte deve compreender cerca de 25% da dimensão global do texto.
2. Desenvolvimento:
Todas as ideias mencionadas na introdução devem ser desenvolvidas de forma 
opinativa e argumentativa nessa parte do texto, cuja dimensão deve 
compreender cerca de 50% do mesmo.
3. Conclusão:
A conclusão deve ser uma síntese do problema abordado, mas com 
considerações que expressam o resultado do que foi pensado ao longo do 
texto. A sua dimensão contempla cerca de 25% do texto.
Como fazer um texto dissertativo argumentativo?
1. Escolha do tema e do problema:
Escolher um tema para dissertar é o primeiro passo para produzir um texto 
dissertativo-argumentativo.
Nos vestibulares e provas do Enem, o tema da redação é apresentado através 
dos textos motivadores (de apoio) que costumam trazer assuntos relacionados 
com o contexto atual.
Depois de escolhido o tema, faz-se necessário refletir sobre o assunto para 
entender quais conhecimentos temos sobre isso. Além disso, fazer um recorte 
sobre o que se pretende dissertar é essencial. Ou seja, imagine que o tema é 
sobre o aborto. O que iremos dissertar sobre esse tema?
O recorte é isso, a escolha de um tópico sobre a tese (tema central) e que pode 
ser, nesse exemplo: o significado do aborto; a legislação atual do aborto; 
causas e consequências do aborto; o aborto na sociedade brasileira.
Por isso, além de escolher o tema, é importante ter um recorte, isto é, a busca 
de um problema para desenvolver na redação.
Em resumo: Qual o tema escolhido?Quais os conhecimentos sobre esse tema? 
Qual o problema específico sobre o tema que se pretende dissertar?
2. Busca da opinião e argumentos sobre o tema:
O texto dissertativo-argumentativo possui a opinião do autor sobre 
determinado tema. No entanto, essa opinião não deve estar expressa em 
primeira pessoa do singular (Eu) e sim na primeira ou terceira pessoa do plural 
Nós, Eles).
O mais importante de um texto dissertativo-argumentativo é a organização, 
clareza e exposição dos argumentos.
Para isso, é necessário refletir sobre o tema, buscando assim uma verdade 
pessoal ou juízo de valor sobre o assunto abordado. Isso porque a opinião 
sobre o tema reforçará a argumentação.
Assim, selecione exemplos, fatos e provas de modo a assegurar a validade de 
sua opinião, sem deixar de justificar cada parte. Uma dica é fazer um esboço 
da estrutura do texto e anotar tudo em um rascunho para ir organizando melhor 
as ideias.
Em resumo: Qual sua opinião sobre o tema dissertado? Quais argumentos, 
exemplos e fatos serão utilizados na redação?
3. Finalização do texto:
Na finalização de um texto dissertativo-argumentativo, busca-se a solução 
para o problema exposto na dissertação.
Assim, é hora de apresentar uma síntese da discussão exposta, onde se retoma
a tese (ideia principal) propondo uma solução ao problema e adicionando as 
observações finais.
Em resumo: Quais as possíveis soluções para o problema exposto Quais 
caminhos podem ser eleitos para solucionar o problema?', '2025-12-07',4);

-- MATEMÁTICA 3º (ID 58)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(58, 'Progressão aritmética', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(58, 'Progressão geométrica', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(58, 'Geometria espacial', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(58, 'Probabilidade avançada', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(58, 'Combinatória', 'Em breve', '2025-12-07', 5);

-- GEOGRAFIA 3º (ID 60)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(59, 'Geopolítica', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(59, 'Conflitos', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(59, 'Organizações internacionais', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(59, 'Economia global', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(59, 'Sustentabilidade', 'Em breve', '2025-12-07', 5);

-- HISTÓRIA 3º (ID 59)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(60, 'Guerras mundiais', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(60, 'Guerra Fria', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(60, 'Ditadura', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(60, 'Redemocratização', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(60, 'Período contemporâneo', 'Em breve', '2025-12-07', 5);

-- FÍSICA 3º (ID 63)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(61, 'Ondas', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(61, 'Eletricidade', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(61, 'Eletromagnetismo', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(61, 'Óptica', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(61, 'Física moderna', 'Em breve', '2025-12-07', 5);

-- QUÍMICA 3º (ID 64)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(62, 'Química orgânica', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(62, 'Isomeria', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(62, 'Reações orgânicas', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(62, 'Polímeros', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(62, 'Química ambiental', 'Em breve', '2025-12-07', 5);

-- ARTES 3º (ID 67)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(63, 'Arte contemporânea', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(63, 'Mídias artísticas', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(63, 'Cinema', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(63, 'Crítica de arte', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(63, 'Produção artística', 'Em breve', '2025-12-07', 5);

-- INGLÊS 3º (ID 66)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(64, 'Present perfect', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(64, 'Voice passive', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(64, 'Argumentação', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(64, 'Reading avançado', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(64, 'Vocabulário', 'Em breve', '2025-12-07', 5);

-- EDUCAÇÃO FÍSICA 3º (ID 68)
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(65, 'Sociedade e esporte', 'Em breve', '2025-12-07', 1);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(65, 'História do esporte', 'Em breve', '2025-12-07', 2);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(65, 'Treino físico', 'Em breve', '2025-12-07', 3);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(65, 'Movimento corporal', 'Em breve', '2025-12-07', 4);
INSERT INTO conteudos (id_materia, titulo, texto, data_criacao, ordem) VALUES
(65, 'Danças', 'Em breve', '2025-12-07', 5);

INSERT INTO video_aula (nome_video, video_url) VALUES
-- Português
('Tipos Textuais', 'uploadvideos/tipost-p1.mp4'),
('Regência Verbal e Nominal', 'uploadvideos/rv-p2.mp4'),
('Intertextualidade e Paráfrase', 'uploadvideos/inter-p3.mp4'),
-- Matemática
('Construção de Parábola', 'uploadvideos/parab-m1.mp4'),
('Logaritmo', 'uploadvideos/log-m2.mp4'),
('Progressão Aritimética e Geométrica', 'uploadvideos/pa-m3.mp4'),
-- Geografia
('Cartografia', 'uploadvideos/carto-g1.mp4'),
('Urbanização', 'uploadvideos/urb-g2.mp4'),
('Blocos Econômicos', 'uploadvideos/blocos-g3.mp4'),
-- História
('Brasil Colônia', 'uploadvideos/bc-h1.mp4'),
('Iluminismo', 'uploadvideos/ilu-h2.mp4'),
('Redemocratização do Brasil', 'uploadvideos/remo-h3.mp4'),
-- Física
('Cinemática', 'uploadvideos/cine-f1.mp4'),
('Leis de Newton', 'uploadvideos/new-f2.mp4'),
('Onda e Luz', 'uploadvideos/onda-f3.mp4'),
-- Química
('Funções Inorgânicas', 'uploadvideos/fi-q1.mp4'),
('Reações Térmicas, Endo e Exo', 'uploadvideos/exo-q2.mp4'),
('Isomeria', 'uploadvideos/iso-q3.mp4'),
-- Artes
('Arte Medieval', 'uploadvideos/am-a1.mp4'),
('Arte Barroca', 'uploadvideos/barro-a2.mp4'),
('Arte Contemporânea', 'uploadvideos/cont-a3.mp4'),
-- Inglês
('Simple Present', 'uploadvideos/pres-i1.mp4'),
('Modal Verbs', 'uploadvideos/modal-i2.mp4'),
('Voz Passiva em Inglês', 'uploadvideos/voz-i3.mp4'),
-- Ed. Física
('Alongamento de Superiores', 'uploadvideos/condf-ed1.mp4'),
('Aptidão Cardiovascular', 'uploadvideos/ac-ed2.mp4'),
('Conceitos e História da Dança', 'uploadvideos/conc-ed3.mp4');