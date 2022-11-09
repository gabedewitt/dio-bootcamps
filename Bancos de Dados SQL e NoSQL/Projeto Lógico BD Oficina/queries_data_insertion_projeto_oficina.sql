use oficina_os;

insert into pessoa_física (Fname, Minit, Lname, CPF, endereço, contato) values 
            ('Maria', 'M', 'Silva', 12345678911, 'rua silva de prata 29, Carangola - Cidade das Flores', 01175429542),
			('Jorge', 'E', 'Lancelotti', 12345888214, 'rua machado de assis 1875, Marabá - Cidade das Águas', 01711112131),
            ('Roberto', 'C', 'Pereira', 78965412311, 'rua dandara 29, Indaponhangava - Liripólis', 40973213123),
            ('Leticia', 'S', 'Montes', 23125621456, 'rua francisca gonzaga 1899, Carambolas - Madureira', 51999912417),
            ('Kevin', 'V', 'Lima', 79985153213, 'rua antonio conselheiro 1896, Laranjeiras - Cidade do Ferro', 01233512472),
            ('Lorenço', 'S', 'Médici', 87893545321, 'rua ezio firenzi 779, Palmares - Nova Florença', 02286530653),
            ('João', 'L', 'Silva', 45632112357, 'rua silva de prata 29, Carangola - Plambinópolis', 12395492425),
            ('Leandra', 'L', 'Alves', 12435685211, 'avenida paes de lima 2927, Limoeiro - Antarcalândia', 11774212331),
            ('Bernardo', 'A', 'Ribeiro', 23571287433, 'alameda dos laranjais 852, Palmeiral - Minamilópolis', 11975521437),
            ('Jonas', 'C', 'Gonçalves', 27867213156, 'travessa das laranjeiras 117, Hamburgueses - Antarcalândia', 11975521437),
            ('Ingrid', 'V', 'Pimentel', 47721247237, 'travessa das laranjeiras 117, Hamburgueses - Antarcalândia', 11923121314),
            ('Renata', 'S', 'Camargo', 13145789421, 'rua jardim bonito 789, Vargem Nova - Novo Rio Limpo', 11923121314);


insert into clientes (idCPessoa) values 
            (1),(2),(3),(6),(7),(8),(9),(10);


insert into mecanicos (idMPessoa, especialidade, códigoId) values 
            (4,'motor',123123326474),
            (5,'hidráulica',891231324561),
            (6,'funilaria',456789456123),
            (10,'eletrônica',103121544984),
            (11,'transmissão',107871203789),
            (12,'freios',457869123021);

insert into equipeOS (códEquipe, descrEquipe) values 
            (101, 'Reparo Motor'),
            (258, 'Manutenção preventiva'),
            (602, 'Reparo simples'),
            (703, 'Reparos eletrônicos');

insert into veiculo (idVCliente, placa, modelo, fabricante, ano) values 
            (1,'LKQ8851','Fox','Volkswagen',2008),
            (2,'YUP9C33','Uno','Fiat',2022),
            (3,'ASQ3C12','Corolla','Toyota',2023),
            (4,'KAQ9B21','Fit','Honda',2010),
            (5,'JWA7841','Passat','Volkswagen',1998),
            (6,'ALP3458','Fusca','Volkswagen',1972),
            (7,'HBV7Y92','Civic','Honda',2021),
            (8,'NMZ8E74','Voyage','Volkswagen',2020),
            (7,'UAS7Z39','i30','Hyundai',2023),
            (8,'AFR1Q10','Voyage','Volkswagen',2019);

insert into mecanicoEquipe (idME_Mecanico, idME_Equipe) values 
            (1,1),
            (4,1),
            (1,2),
            (2,2),
            (4,2),
            (5,2),
            (6,2),
            (3,3),
            (5,3),
            (6,3),
            (4,4),
            (3,4),
            (5,4);


insert into ordemServiço (idEquipeResp, idOSVeiculo, statusOS, dataEmissao, previsaoConclusao) values 
            (2,1,'Concluída','2022-10-12','2022-10-20'),
            (1,6,'Em processamento','2022-11-09','2022-11-16'),
            (3,8,'Concluída','2022-10-20','2022-10-27'),
            (2,3,'Concluída','2022-11-01','2022-11-08'),
            (4,10,'Em processamento','2022-11-01','2022-11-10'),
            (2,2,'Concluída','2022-10-18','2022-10-22'),
            (1,5,'Atrasada','2022-10-26','2022-11-01'),
            (3,4,'Em processamento','2022-11-05','2022-11-12');
            
insert into peças (nomeP, fabricante, precoUnit) values 
            ('Filtro de combustível', 'LTG LTDA', 35),
            ('Bateria', 'Touro', 150.1),
            ('Correia dentada', 'FGB engrenagens', 50),
            ('Disco de freio', 'KTA SA',18.2),
            ('Filtro de Ar', 'AM Filtros', 40);

insert into custoServiço (descrServ, valorServ) values 
            ('Troca de óleo', 235),
            ('Troca de correia dentada', 150),
            ('Manutenção preventiva', 250),
            ('Retificar o motor', 2000),
            ('Reparo eletrônico', 350);

insert into peçasOS (idPOS_Peça, idPOS_OS, quantidade) values 
            (3,7,1),
            (1,1,1),
            (1,4,1),
            (5,4,1),
            (5,6,1),
            (2,3,1);

insert into custoServOS (idCSOS_Custo, idCSOS_OS) values 
            (2,7),
            (3,1),
            (3,4),
            (3,6),
            (4,7),
            (3,2),
            (3,5),
            (5,3),
            (5,8);
use oficina_os;

-- Quantos mecânicos compõem cada equipe?
select count(*) as nro_mecanicos,idME_Equipe as idEquipe from mecanicoEquipe group by idME_Equipe;

-- Existe alguma OS atrasada?
select * from ordemServiço where statusOS = 'Atrasada';

-- Algum mecânico já usou os serviços da oficina?
select concat(p.Fname,' ',p.Minit,'. ',p.Lname) as Cliente, p.endereço, p.contato from 
			pessoa_física p inner join (clientes c inner join mecanicos m on c.idCPessoa = m.idMPessoa)
            on p.idPessoa = c.idCPessoa;
            
-- Quais OS custaram mais de 1000 reais?
-- v.placa, v.modelo, v.fabricante, 
select os.idOS, os.idEquipeResp, (ppos.custo_peças + ccs.custo_serviço) as custo_OS 
		from ordemServiço os
			right join (
					(select pos.idPOS_OS, ROUND(pos.quantidade * p.precoUnit, 2) as custo_peças 
						from peçasOS pos, peças p 
						where pos.idPOS_Peça = p.idPeças) ppos
						join 
					(select cos.idCSOS_OS, ROUND(cs.valorServ, 2) as custo_serviço 
						from custoServOS cos, custoServiço cs 
						where cos.idCSOS_Custo = cs.idCustoServ) ccs on ccs.idCSOS_OS = ppos.idPOS_OS)
			on ccs.idCSOS_OS = os.idOS
			order by custo_OS desc;	
            
-- Quais OS's levaram mais de 5 dias?
select idOS, DATEDIFF(previsaoConclusao, dataEmissao) as Dias_OS from ordemServiço
			having Dias_OS > 5
            order by Dias_OS desc;