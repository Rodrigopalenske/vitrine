-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09-Maio-2024 às 02:56
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `vitrine3`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `banner` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `banner`
--

INSERT INTO `banner` (`id`, `banner`) VALUES
(1, 'banner1.jpg'),
(2, 'banner2.jpeg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`id`, `nome`) VALUES
(7, 'Tênis'),
(8, 'Camiseta');

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `id` int(11) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `logradouro` varchar(100) DEFAULT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `localidade` varchar(100) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `ibge` varchar(7) DEFAULT NULL,
  `gia` varchar(10) DEFAULT NULL,
  `ddd` int(2) DEFAULT NULL,
  `siafi` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`id`, `cep`, `logradouro`, `complemento`, `bairro`, `localidade`, `uf`, `ibge`, `gia`, `ddd`, `siafi`) VALUES
(6, '01001-000', 'Praça da Sé', 'lado ímpar', 'Sé', 'São Paulo', 'SP', '3550308', '1004', 11, '7107');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `valor` double NOT NULL,
  `descricao` text NOT NULL,
  `imagem1` varchar(100) NOT NULL,
  `imagem2` varchar(100) NOT NULL,
  `categoria_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id`, `nome`, `valor`, `descricao`, `imagem1`, `imagem2`, `categoria_id`) VALUES
(1, 'CAMISA CR FLAMENGO 1', 90, 'Seus jogadores pintam verdadeiras obras de arte em campo há mais de um século. Esta Camisa 1 juvenil reinventa as famosas cores vermelha e preta do Flamengo. O tecido macio remove o suor, para manter você confortável enquanto constrói sua própria história no futebol.', 'Camisa_CR_Flamengo_1_Preto_FH7589_01_laydown.jpeg', 'Camisa_CR_Flamengo_1_Preto_FH7589_02_laydown_hover.jpeg', 1),
(2, 'CAMISA FOOTBALL INSPIRED MESSI', 65, 'Preste homenagem a um dos maiores números 10 de todos os tempos com esta camisa de treino adidas do Messi. As costas exibem o nome e o número do maestro, enquanto a frente traz seu logotipo. A modelagem padrão com decote em V mantém seu corpo fresco e confortável no campo de treinamento ou na academia. Esta camisa é feita de materiais reciclados, parte dos esforços da adidas para ajudar a criar um futuro mais sustentável.', 'Camisa_Football_Inspired_Messi_Cinza_GD4748_01_laydown.jpeg', 'Camisa_Football_Inspired_Messi_Cinza_GD4748_02_laydown_hover.jpeg', 1),
(3, 'TÊNIS ZX 2K', 400, 'Cada minuto do dia é uma oportunidade para os pequenos se aventurarem. (A não ser que seja aquele raro momento de silêncio chamado hora da soneca, claro.) Calce as crianças com este tênis adidas e deixe-as explorar todos os cantos da nave espacial, submarino ou forte apache do dia. O amortecimento leve topa qualquer brincadeira.', 'Tenis_ZX_2K_Verde_H02366_01_standard.jpeg', 'Tenis_ZX_2K_Verde_H02366_04_standard.jpeg', 2),
(4, 'TÊNIS BREAKNET', 230, 'Este tênis reúne a inspiração no esporte e um look descontraído para as crianças usarem o dia todo. Estejam elas no caminho para se tornar as próximas estrelas das quadras ou apenas querendo um tênis de visual descolado feito para durar, vão eleger este tênis infantil adidas como seu campeão. Os cadarços recebem o suporte extra da tira de velcro, para maior segurança.', 'Tenis_Breaknet_Branco_GZ7643_01_standard.jpeg', 'Tenis_Breaknet_Branco_GZ7643_04_standard.jpeg', 2),
(5, 'MOCHILA LEGO', 200, 'Os construtores de hoje são os criadores de amanhã. Por isso, a adidas aliou-se à LEGO® para desenhar uma coleção que celebra a imaginação. Esta mochila infantil tem vários bolsos para guardar pequenos tesouros. A parte de trás acolchoada e as alças ajustáveis tornam o transporte confortável.', 'Mochila_LEGO(r)_Cinza_GM4534_01_standard.jpeg', 'Mochila_LEGO(r)_Cinza_GM4534_02_standard.jpeg', 3),
(6, 'BOLSA CONVERSÍVEL DUAS EM UMA LEGO', 130, 'Se é possível sonhar. É possível construir. Quando a adidas se uniu à LEGO®, elas criaram uma coleção que celebra a criatividade. As crianças podem usar esta bolsa duas em uma como pochete ou mochila. O bolso com zíper externo guarda pequenos objetos essenciais, e a tira frontal pode ser regulada para encontrar o ajuste perfeito.', 'Bolsa_Conversivel_Duas_em_Uma_LEGO(r)_Cinza_GM4536_01_standard.jpeg', 'Bolsa_Conversivel_Duas_em_Uma_LEGO(r)_Cinza_GM4536_04_standard.jpeg', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `login` varchar(30) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `ativo` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `email`, `login`, `senha`, `ativo`) VALUES
(1, 'Bill Gates', 'bill@microsoft.com', 'bill', '$2y$10$Uzz3LDbZgxxMMSzJ40yB8OeBeKZ2hoVopOpFHuWsoHs8J52393DzG', 'S'),
(2, 'Steve Jobs', 'steve@apple.com', 'steve', '$2y$10$lTL9YeO333b3IzjZm/1tROy5SA50ItlXtHTKVbgsv8MaazaSWLCpC', 'N');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
