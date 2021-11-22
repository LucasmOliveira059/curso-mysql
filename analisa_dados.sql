use cinema;

select count(*) from clientes;
select count(*) from clientes
where ultimo_nome = 'Smith'
and primeiro_nome is null;

select SUM(assento) from salas
where id > 1;

select filme, minutagem from filmes
group by filme
having filme = 'Blade Runner 2049';

select min(minutagem) from filmes;
/*o Average (AVG) calcula a média dos valores */
select avg(minutagem) from filmes;

-- tivemos 24 exibiçções de Blade Runner em Outubro de 2017
select count(*) from exibicoes e 
join filmes f on e.filme_id = f.id
where f.filme = 'Blade Runner 2049';

-- organizando tabelas para mostrar resultados relacionados
-- nome do filme, começo da sessão, nome do cliente e o id do catalogo
select f.filme, e.comeco_exib, c.primeiro_nome, c.ultimo_nome, count(b.id) from filmes f
join exibicoes e on f.id = e.filme_id
join catalogos b on e.id = b.exib_id
join clientes c on b.cliente_id = c.id
group by f.filme, c.primeiro_nome, c.ultimo_nome, e.comeco_exib
order by e.comeco_exib;

-- contando o número de exibições dos filmes com mais de duas horas de duração
select f.filme, f.minutagem, count(e.id) from filmes f
join exibicoes e on f.id = e.filme_id
group by f.filme, f.minutagem
having minutagem > 120
order by e.id;

-- selecionando através de subqueries não relacionadas
select primeiro_nome, ultimo_nome, email from clientes
where id in
(select cliente_id from catalogos
where exib_id = 1);

-- selecionando através de subqueries relacionais

select filme,
(select count(id) from exibicoes
where filme_id = f.id)
from filmes f;