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