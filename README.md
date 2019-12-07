![N|Solid](logo_ioasys.png)

# README #

Estes documento README tem como objetivo fornecer as informações necessárias para realização do projeto Empresas.

### O QUE FAZER ? ###

* Você deve fazer um fork deste repositório, criar o código e ao finalizar, enviar o link do seu repositório para a nossa equipe. Lembre-se, NÃO é necessário criar um Pull Request para isso.
* Nós iremos avaliar e retornar por email o resultado do seu teste.

### ESCOPO DO PROJETO ###

* Deve ser criado um aplicativo iOS utilizando Objective C ou Swift com as seguintes especificações:
* Login e acesso de Usuário já registrado
	* Para o login usamos padrões OAuth 2.0. Na resposta de sucesso do login a api retornará 3 custom headers (access-token, client, uid);
	* Para ter acesso as demais APIS precisamos enviar esses 3 custom headers para a API autorizar a requisição;
* Listagem de Empresas
* Detalhamento de Empresas

### Informações Importantes ###

* Layout e recortes disponíveis no Zeplin (http://zeplin.io)
teste_ios
15ioasys86

* Integração disponível a partir de uma collection para Postman (https://www.getpostman.com/apps) disponível neste repositório.

* Independente de onde conseguiu chegar no teste é importante disponibilizar seu fonte para analisarmos.

### Dados para Teste ###

* Servidor: https://empresas.ioasys.com.br/api
* Versão da API: v1
* Usuário de Teste: testeapple@ioasys.com.br
* Senha de Teste : 12341234

### Dicas ###

* Temos um framework muito completo que pode te ajudar em tudo: https://github.com/JotaMelo/iOSHelpers-Swift ou https://github.com/JotaMelo/iOSHelpers
