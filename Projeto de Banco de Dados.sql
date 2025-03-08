-- Criando as tabelas do banco de dados para o sistema de estacionamento
CREATE DATABASE projeto_final_db;

CREATE TABLE Usuarios (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE Clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    contato VARCHAR(15) NOT NULL
);

CREATE TABLE Veiculos (
    id INT PRIMARY KEY,
    tipo ENUM('carro', 'moto') NOT NULL,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    placa VARCHAR(10) UNIQUE NOT NULL,
    cliente_id INT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
);

CREATE TABLE Estacionamento (
    id INT PRIMARY KEY,
    operador_id INT NOT NULL,
    cliente_id INT NOT NULL,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    status ENUM('estacionado', 'vagou') NOT NULL,
    FOREIGN KEY (operador_id) REFERENCES Usuarios(id),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
);

-- Inserindo dados dos operadores
INSERT INTO Usuarios (id, nome, matricula) VALUES
(1, 'Ricardo', '8112024');

-- Inserindo dados dos clientes
INSERT INTO Clientes (id, nome, contato) VALUES
(1, 'Danielle', '997490929'),
(2, 'Fabio', '912309870'),
(3, 'Henrique', '987731230'),
(4, 'Tatiane', '999966770'),
(5, 'Jorge', '905439985'),
(6, 'Isabel', '977848854');

-- Inserindo dados dos veículos
INSERT INTO Veiculos (id, tipo, marca, modelo, placa, cliente_id) VALUES
(1, 'carro', 'Chevrolet', 'Onix', 'DN3E11', 1),
(2, 'moto', 'Honda', 'CB-500', 'FB4E11', 2),
(3, 'moto', 'Yamaha', 'Teneré', 'HQ2910', 3),
(4, 'moto', 'Honda', 'Bis', 'TT6D11', 4),
(5, 'carro', 'VW', 'Virtus', 'JR8D11', 5),
(6, 'carro', 'Renault', 'Sandeiro', 'IS6E11', 6);

-- Inserindo dados no estacionamento
INSERT INTO Estacionamento (id, operador_id, cliente_id, data, hora, status) VALUES
(1, 1, 2, '2024-11-02', '09:00:00', 'vagou'),
(2, 1, 4, '2024-11-02', '11:00:00', 'vagou'),
(3, 1, 6, '2024-11-02', '13:30:00', 'estacionado'),
(4, 1, 3, '2024-11-02', '15:25:00', 'estacionado'),
(5, 1, 1, '2024-11-03', '10:00:00', 'estacionado'),
(6, 1, 6, '2024-11-03', '12:00:00', 'vagou'),
(7, 1, 3, '2024-11-03', '14:00:00', 'estacionado'),
(8, 1, 5, '2024-11-04', '10:30:00', 'estacionado');


-- Consulta que lista os veículos no estacionamento
SELECT e.data, e.hora, c.nome AS proprietario, c.contato, v.tipo, v.placa, v.modelo, u.nome AS operador
FROM Estacionamento e
JOIN Clientes c ON e.cliente_id = c.id
JOIN Veiculos v ON c.id = v.cliente_id
JOIN Usuarios u ON e.operador_id = u.id
WHERE e.status = 'estacionado';

-- Cadastrar Matheus
INSERT INTO Clientes (id, nome, contato) VALUES
(7, 'Matheus', '993210589');

INSERT INTO Veiculos (id, tipo, marca, modelo, placa, cliente_id) VALUES
(7, 'moto', 'BMW', 'XXT', '', 7);

INSERT INTO Estacionamento (id, operador_id, cliente_id, data, hora, status) VALUES
(9, 1, 7, '2024-11-04', '16:00:00', 'estacionado');

-- Consulta para detalhes do segundo veículo estacionado no dia 02/11/2024
SELECT e.data, e.hora, e.status, c.nome AS proprietario, c.contato, v.tipo, v.placa, v.modelo, u.nome AS operador
FROM Estacionamento e
JOIN Clientes c ON e.cliente_id = c.id
JOIN Veiculos v ON c.id = v.cliente_id
JOIN Usuarios u ON e.operador_id = u.id
WHERE e.data = '2024-11-02'
ORDER BY e.hora
LIMIT 1 OFFSET 1;

-- Consulta para contar total de motos e carros no estacionamento
SELECT v.tipo, COUNT(*) AS total
FROM Estacionamento e
JOIN Veiculos v ON e.cliente_id = v.cliente_id
WHERE e.status = 'estacionado'
GROUP BY v.tipo;

-- Consulta para listar os clientes em ordem decrescente
SELECT * FROM Clientes ORDER BY nome DESC;

-- Atualizar status dos veículos estacionados no dia 02/11/2024 para 'vagou'
UPDATE Estacionamento
SET status = 'vagou'
WHERE data = '2024-11-02';

-- Atualizar status da moto do Matheus para 'vagou'
UPDATE Estacionamento
SET status = 'vagou'
WHERE cliente_id = (SELECT id FROM Clientes WHERE nome = 'Matheus');

-- Excluir o cadastro do Matheus e da sua moto
DELETE FROM Veiculos WHERE cliente_id = (SELECT id FROM Clientes WHERE nome = 'Matheus');
DELETE FROM Clientes WHERE nome = 'Matheus';
