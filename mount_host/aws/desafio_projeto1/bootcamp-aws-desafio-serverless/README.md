# AWS - Desafio de projeto 1
## API Node.js com Serverless Framework em ambiente AWS

Este repositório contém o código fonte do desafio de projeto do bootcamp aws. Criar uma infraestrutra em nuvem AWS com API Gateway, DynamoDB, AWS Lambda e AWS CloudFormation utilizando o framework Serverless.

## Etapas

Pré requisitos: 
 - possuir uma conta na AWS e instalar Node.js na máquina.
 - Instalar o AWS CLI: https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html

### Setup Inicial

#### Credenciais AWS

- Criar usuário: AWS Management Console -> IAM Dashboard -> Create New User -> <nome do usuário> -> Permissions "Administrator Access" -> Programmatic Access -> Dowload Keys
- No terminal: ```$ aws configure``` -> colar as credenciais geradas anteriormente

#### Configurar o framework Serverless
```$ npm i -g serverless```

Instalar dependências

`$ npm i uuid aws-sdk`

### Deploy
completo e verboso

```$ serverless deploy --verbose```

Apenas um função e verboso

```$ serverless deploy -f insertItem --verbose```