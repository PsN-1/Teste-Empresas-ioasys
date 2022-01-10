![N|Solid](logo_ioasys.png)

# Desafio Pessoa Desenvolvedora iOS

## Arquitetura e Tecnologias

### MVVM (Model, View, ViewModel)
Foi utilizado padrão MVVM, fortimente utilizada pela comunidade mobile dentro e fora do desenvolvimento iOS nativo.

### Coordinators
Foi utilizado o padrão de coordinator ligeiramente modificado para controlar o fluxo de telas do app.

### View Code
O view code foi utilizado para contruir todas as views, uma abordagem declarativa (apesar de ser imperativa), sem a utilização de interfaces builder.
Apesar do trabalho inicial ser maior, acaba sendo a abordagem mais fácil de se dar manutenção e trabalhar coletivamente.

### Singleton
Foi utilizado esse padrão para armazenar as credenciais do usuario e imagens através do app.

### Gerenciador de dependências
Apesar de já ter usado ferramentas como Cocoapods e SPM, não foi utilizada nenhuma biblioteca de terceiros nesse projeto.

### Logica de busca
Caso o usuário digite apenas texto no campo de busca, será utilizado o endpoint "Enterprises with Name Filter" para realizar a busca.
Caso o usuário digite apenas números no campo de busca, será utilizado o endpoint "Show by id" para realizar a busca.
Caso o usuário digite a palavra "type" + números, será utilizado o endpoint "Enterprise Index" para realizar a busca.
Caso o usuário digite a letras e números, será utilizado o endpoint "Enterprises Index with Filter" para realizar a busca.
Caso o usuário realize a busca com o campo vazio, será utilizado apenas o endpoint "enterprises" sem nenhum parâmetro, trazendo todos as empresas disponíveis.

Para as imagens da tela da home, foi utilizado um método para reduzir o tamanho da mesmo, aumento a performance do app.

## Rodar o projeto

1. navegue até a pasta do projeto
3. abra o arquivo com a extensão .xcodeproj 
4. pressione CMD+R

obs: Esse projeto foi desenvolvido utilizado a versão do xcode 13.1, recomenda-se utilizar a mesma ou versão mais nova se disponível



# Desafio Pessoa Desenvolvedora iOS

## 🏗  O que fazer?
Você deve fazer um fork deste repositório, criar o código e ao finalizar, enviar o link do seu repositório para a nossa equipe. Lembre-se, NÃO é necessário criar um Pull Request para isso, nós iremos avaliar e retornar por e-mail o resultado do seu teste. 

## 📱Escopo de projeto
Deve ser criado um aplicativo iOS utilizando Swift com as seguintes especificações:

* Login e acesso de Usuário já registrado
    * Para o login usamos padrões OAuth 2.0. Na resposta de sucesso do login a api retornará 3 custom headers (access-token, client, uid);
    * Para ter acesso as demais APIS precisamos enviar esses 3 custom headers para a API autorizar a requisição;
* Busca de Empresas
* Listagem de Empresas
* Detalhamento de Empresas

**Sinta-se a vontade para:**

* Escolher a arquitetura
* Usar ou não usar bibliotecas
* Estruturar seu layout com storyboards, xibs, view code (UIKit ou SwiftUI).

## 🕵 Itens a serem avaliados
Pense no desafio como uma oportunidade de mostrar todo o seu conhecimento. Independente de onde conseguiu chegar no teste, é importante disponibilizar sua implementação para analisarmos.

* Estrutura do projeto
* Consumo de APIs
* Lógicas de busca
* Estruturação de layout e fluxo de aplicação
* Utilização de código limpo e princípios SOLID
* Boas práticas da linguagem

## 🎁 Extra
Estes itens não são obrigatórios, porém desejados.

* Testes unitários
* Testes de UI
* Modularização

## 🚨 Informações Importantes
* Layout e recortes disponíveis no Figma (https://bit.ly/testeempresasios)
* Você deve fazer um cadastro no Figma para ter acesso ao layout.
* Integração disponível a partir de uma collection para Postman (https://www.getpostman.com/apps) disponível neste repositório.

## Dados para Teste
* Servidor: https://empresas.ioasys.com.br/api
* Versão da API: v1
* Usuário de Teste: testeapple@ioasys.com.br
* Senha de Teste : 12341234