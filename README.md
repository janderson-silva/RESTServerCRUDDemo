Este projeto implementa um **servidor REST** utilizando o **Framework** [Horse](https://github.com/HashLoad/horse) e **Middlewares** [Johnson](https://github.com/HashLoad/jhonson). O servidor é projetado para gerenciar registros de clientes com suporte completo para operações CRUD (Criar, Ler, Atualizar e Excluir). As principais funcionalidades do servidor são:

1. **Listagem de Clientes:**
   - O servidor fornece um endpoint para listar todos os clientes cadastrados, retornando uma lista completa em resposta a solicitações GET.

2. **Cadastro de Clientes:**
   - Permite adicionar novos registros de clientes ao banco de dados através de solicitações POST, com validação e processamento de dados utilizando os middlewares Johnson.

3. **Edição de Clientes:**
   - Oferece um endpoint para atualizar informações de clientes existentes. As solicitações PUT são utilizadas para modificar registros no banco de dados.

4. **Exclusão de Clientes:**
   - Permite a remoção de registros de clientes com solicitações DELETE, excluindo entradas específicas do banco de dados.

**Tecnologias Utilizadas:**

- **Framework** [Horse](https://github.com/HashLoad/horse): Utilizado para criar e gerenciar o servidor REST, facilitando o desenvolvimento de APIs eficientes e escaláveis.
- **Middlewares** [Johnson](https://github.com/HashLoad/jhonson): Aplicados para adicionar funcionalidades adicionais, como validação de dados, autenticação e controle de fluxo.

O projeto visa proporcionar uma solução robusta e eficiente para a gestão de dados de clientes, integrando o Framework Horse com middlewares para um gerenciamento completo e seguro de informações.
