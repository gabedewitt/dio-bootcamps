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
            ('Bernardo', 'A', 'Ribeiro', 12435685211, 'alameda dos laranjais 852, Palmeiral - Minamilópolis', 11975521437),
            ('Jonas', 'C', 'Gonçalves', 27867213156 'travessa das laranjeiras 117, Hamburgueses - Antarcalândia', 11975521437),
            ('Ingrid', 'V', 'Pimentel', 47721247237 'travessa das laranjeiras 117, Hamburgueses - Antarcalândia', 11923121314),
            ('Renata', 'S', 'Camargo', 13145789421 'rua jardim bonito 789, Vargem Nova - Novo Rio Limpo', 11923121314);


insert into clientes (idCPessoa) values 
            (1),(2),(3),(6),(7),(8),(9),(10);


insert into mecanicos (idMPessoa, especialidade, códigoId) values 
            (4,'motor',123123326474),
            (5,'hidráulica',891231324561),
            (6,'eletrônica',456789456123),
            (10,'eletrônica',103121544984),
            (11,'transmissão',107871203789),
            (12,'motor',457869123021);

insert into equipeOS (códEquipe) values 
            (101),
            (102),
            (103),
            (232),
            (258),
            (602);

insert into veiculo (idVCliente, placa, modelo, fabricante, ano, idEquipeV) values 
            ();

insert into mecanicoEquipe (idME_Mecanico, idME_Equipe) values 
            ();

insert into ordemServiço (idEquipeResp, numOS, statusOS, dataEmissao, previsaoConclusao) values 
            ();
insert into peças (nomeP, fabricante, precoUnit) values 
            ();

insert into custoServiço (descrServ, valorServ) values 
            ();

insert into peçasOS (idPOS_Peça, idPOS_OS, quantidade) values 
            ();

insert into custoServOS (idCSOS_Custo, idCSOS_OS) values 
            ();
use oficina_os;

