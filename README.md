# Sistema de Gestão Contas Bancárias em Delphi

## Descrição
Este é um sistema de gestão desenvolvido em Delphi utilizando a arquitetura MVC. O sistema utiliza o banco de dados SQLite e o FortesReport para geração de relatórios.

## Funcionalidades
O sistema possui as seguintes funcionalidades:
- **Cadastros**
  - Clientes: Nome, Data de nascimento, Documento, Telefone e E-mail - **Regra de negócio**: Não pode excluir um cliente já vinculado à uma conta 
  - Contas: Cliente, Banco e Número da conta - **Regra de negócio**: Não pode excluir uma conta já vinculada à uma movimentação. Porém poderá inativar a conta para lançamentos futuros.
- **Lançamentos**
  - Movimento: Conta, Tipo de movimento, Data e Valores - **Regra de negócio**: Só poderá fazer movimentações com as contas Ativas.
- **Relatórios**
  - Consolidado: Movimentação agrupada por conta/cliente
  - Analítica: Movimentação detalhada por conta

## Tecnologias Utilizadas
- **Linguagem de Programação:** Delphi
- **Arquitetura:** MVC (Model-View-Controller)
- **Banco de Dados:** SQLite
- **Relatórios:** FortesReport

## Como Executar o Projeto
1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/seu-repositorio.git
2. Copia o executável juntamente com o banco de dados, que se encontra no caminho "Win64\Release", para pasta de sua preferencia; e execute o exe.

## Contribuição
Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e enviar pull requests.

## Licença
Este projeto está licenciado sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.
