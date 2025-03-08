# Projeto Banco de Dados para Estacionamento (SENAC - RioOn)

## Descricao do Projeto

Este projeto tem como objetivo a criacao de um banco de dados para gerenciamento de um estacionamento, permitindo o controle de entrada e saida de veiculos, registro de clientes, tarifas aplicadas e outras informacoes essenciais para a gestao eficiente do negocio.

## Índice

- [Requisitos do Banco de Dados](#requisitos-do-banco-de-dados)
- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Principais Objetivos do Projeto](#principais-objetivos-do-projeto)
- [Capturas de Tela](#capturas-de-tela)
- [Contribuição](#contribuição)
- [Contato](#contato)

## Requisitos do Banco de Dados

- Os usuários possuem nome e matrícula.
- Os clientes possuem nome e contato.
- Os veículos possuem tipo (carro ou moto), marca, modelo, placa e qual o cliente é seu proprietário.
- O estacionamento identificará que é o operador; os clientes; os veículos; data e hora de entrada dos veículos no estacionamento (referenciar pelo proprietário, ou seja, o cliente); e o status que informará se os veículos estão ou não estacionados nas vagas do estacionamento.
- Todas as tabelas tem chave primária.


## Tecnologias Utilizadas

- **DrawDB**: Ferramenta online e gratuita que permite criar diagramas de entidades de banco de dados (DBER) e gerar scripts SQL.
- **MySQL Workbench**: Ferramenta visual unificada para arquitetos de banco de dados, desenvolvedores e DBAs.

## Principais Objetivos do Projeto

- Criação do Diagrama do MER: Feito no DrawDB, cumprindo os requisitos listados, verificar as chaves primárias do Banco de Dados.
- Criação do Banco de Dados: Desenvolver um sistema de Banco de Dados para um sistema de estacionamento que tem o operador do sistema, os clientes, veículos desses clientes (donos(as)) e o estacionamento (local que vai centralizar as informações).
- Criação das Tabelas: Criar as tabelas de funcionamento do Banco de Dados: Usuário, Clientes, Veículos e Estacionamento respeitando as chaves primárias e estrangeiras.
- Inserção de Dados: Inserir os dados passados no arquivo em Excel, através de código SQL.
- Consultas e Updates: Realizar consultas e updates no banco de dados.

## Capturas de Tela

<p align="center">
  <img src="https://github.com/victor-hmds/Projeto-Banco-de-Dados-Estacionamento/blob/main/Projeto%20Final%20-%20Banco%20de%20Dados%20-%20Estacionamento.png" width="70%" />
</p>

## Contribuição

Contribuições são bem-vindas! Se você deseja melhorar este projeto, siga os passos abaixo:

1. **Faça um fork deste repositório.**
2. **Crie uma branch para sua feature:** `git checkout -b minha-feature`
3. **Commit suas alterações:** `git commit -m 'Adiciona minha feature'`
4. **Envie para a branch principal:** `git push origin minha-feature`
5. **Abra um Pull Request.**

## Contato

Para dúvidas ou sugestões:

- **Nome:** Victor Hugo Martins de Souza
- **LinkedIn:** [victor-martins-rs](https://www.linkedin.com/in/victor-martins-rs/)
