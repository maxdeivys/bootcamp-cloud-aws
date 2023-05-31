# Desafio projeto 2 - Roteiro para o desenvolvimento

> ## Descrição do Desafio
>
> Ofereça autenticação, autorização e gerenciamento de usuários para suas aplicações Web e Mobile com o Amazon Cognito.
> Tarefas que serão realizadas:
>
> - Utilizar os serviços Amazon Cognito, DynamoDB, API Gateway e AWS Lambda;
> - Criar uma API REST no Amazon API Gateway;
> - Criar tabela no Amazon DynamoDB;
> - Criar funções no AWS Lambda;
> - Integrar o API Gateway com o Lambda backend;
> - Utilizar a ferramenta No POSTMAN;
> - Criar um autorizador do Amazon Cognito para uma API REST no Amazon API Gateway.

## Serviços AWS utilizados

- Amazon Cognito
- Amazon DynamoDB
- Amazon API Gateway
- AWS Lambda

## Etapas do desenvolvimento

### 1 - Criando uma API REST no Amazon API Gateway

> Console AWS

#### 1.1 - Configurações gerais

> API Gateway Dashboard: Services -> Networking & Content Delivery -> API Gateway

- API Gateway Dashboard -> REST API -> Build
  - Choose the protocol: REST
  - Create new API: New API
  - Nome: bootcampAWSAPI
  - Descrição: API do desafio de projeto bootcamp AWS - DIO
  - Endpoint Type: Regional

#### 1.2 - Criar recursos

- API Gateway Dashboard -> bootcampAWSAPI -> Resources -> Actions -> Create Resource
  - Resource Name: Items

### 2 - Criar a tabeka no Amazon DynamoDB

> DynamoDB Dashboard: Services -> Database -> DynamoDB

- DynamoDB Dashboard -> Tables -> Create table
  - Table name: Items
  - Partition key: id (string)
  - Sort key: name (string)
  - Tags
    - client: bootcamp DIO

### 3 - Criar a AWS Lambda function

> Lambda Dashboard: Services -> Compute -> Lambda

#### 3.1 Função para inserir item

- Lambda Dashboard -> Create function
- Author from scratch
  - Name: put_item
  - Runtime: Node.js 14.x
  - Architecture: x86_64
  - Permissions: Create a new role with basic Lambda permissions
  - Advanced settings -> Enable tags
    - key: client
    - Value: bootcamp DIO
    - Inserir código da função ```src/put_item.js``` -> Deploy
    - Configuration -> Permissions ->Execution role -> Abrir a Role no console do IAM
      - Permissions -> Add permissions -> create inline policy
      - Service - DynamoDB -> Manual actions
      - dynamodb: putItem
      - Resources -> Add arn -> Selecionar o arn da tabela criada no DynamoDB -> Add
      - Review policy -> Name: ``putItem_policy`` -> Create policy

### Integrando o API Gateway com o Lambda backend

- API Gateway Dashboard -> Selecionar a API criada -> Resources -> Selecionar o resource criado -> Action -> Create method - POST
- Integration type -> Lambda function
- Use Lambda Proxy Integration: sim
- Lambda Region: us-east-1
- Lambda function: put_item (Selecionar a função Lambda criada) -> Save
- Add Permission to Lambda Function?: sim
- Actions -> Deploy API -> Deployment Stage -> New Stage [dev] -> Deploy

### No Amazon Cognito
> Cognito: Security, Identity, & Compliance
>
- Cognito Dashboard -> Manage User Pools -> Create a User Pool
    > Amazon Cognito -> User pools -> Create user pool
  - Pool name [TestPool]
- How do you want your end users to sign in? - Email address or phone number -> Next Step
- What password strength do you want to require?
- Do you want to enable Multi-Factor Authentication (MFA)? Off -> Next Step
- Do you want to customize your email verification messages? -> Verification type - Link -> Next Step
- Which app clients will have access to this user pool? -> App client name [TestClient] -> Create App Client -> Next Step
- Create Pool

- App integration -> App client settings -> Enabled Identity Providers - Cognito User Pool
- Callback URL(s) [https://example.com/logout]
- OAuth 2.0 -> Allowed OAuth Flows - Authorization code grant -Implicit grant
- Allowed OAuth Scopes	- email	- openid
- Save Changes

- Domain name -> Domain prefix [diolive] -> Save

### Criando um autorizador do Amazon Cognito para uma API REST no Amazon API Gateway

- API Gateway Dashboard -> Selecionar a API criada -> Authorizers -> Create New Authorizer
- Name [CognitoAuth] -> Type - Cognito -> Cognito User Pool [pool criada anteriormente] -> Token Source [Authorization]

- Resources -> selecionar o resource criado -> selecionar o método criado -> Method Request -> Authorization - Selecionar o autorizador criado

### No POSTMAN

- Add request -> Authorization
- Type - OAuth 2.0
- Callback URL [https://example.com/logout]
- Auth URL [https://diolive.auth.sa-east-1.amazoncognito.com/login]
- Client ID - obter o Client ID do Cognito em App clients
- Scope [email - openid]
- Client Authentication [Send client credentials in body]
- Get New Acces Token
- Copiar o token gerado

- Selecionar a request para inserir item criada -> Authorization -> Type - Bearer Token -> Inserir o token copiado
- Send
