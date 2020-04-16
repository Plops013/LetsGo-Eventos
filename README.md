# LetsGo-Eventos
Projeto feito utilizando: <strong>Spring MVC, Spring Boot, Spring Security, PostgresSQL, Hibernate 
e JSP utilizando Bootstrap no CSS e JQuery para alguns detalhes.</strong>
<hr/>
<strong>Site para cadastro e compras de eventos seguindo essa descrição: </strong>

O desafio será passado em formato descritivo, sendo as únicas premissas técnicas:
•	Utilização do framework Spring<br/>
•	Utilização de algum framework CSS (Bootstrap e Materialize são os mais conhecidos)<br/>
•	Utilização do framework Hibernate (pode ser utilizado Spring Data JPA)<br/>

<strong>Descrição:</strong>
A Qintess foi contratada para desenvolver um site para uma grande empresa de eventos. A solução NÃO irá incluir o módulo de pagamento, pois será criado por outra empresa.
O desenvolvimento foi pensado em duas fases. Sendo a primeira voltada para configuração inicial, telas básicas e banco de dados. A segunda fase se trata de relatórios, APIs e segurança.
Primeira fase:
<br/>
# •	Menu para acesso às telas<br/>
<h2>•	Tela inicial</h2><br/>
o	Deve mostrar todos os eventos válidos e que tenham ingressos a venda<br/>
o	Cada evento deve conter um link ou botão de navegação para a tela de detalhes<br/>
<h2>•	Tela de detalhe do evento</h2><br/>
o	Deve conter os dados do evento (vide abaixo), botão de compra e voltar<br/>
<h2>•	Tela de cadastro de clientes</h2><br/>
o	Deve conter campos relacionados ao cadastro de cliente<br/>
<h2>•	Tela de cadastro de casas de show</h2><br/>
o	Deve conter no mínimo nome, endereço e capacidade<br/>
<h2>•	Tela de cadastro de eventos</h2><br/>
o	Deve conter no mínimo nome, descrição, casa de show, data, preço e quantidade disponível de ingressos<br/>
<h2>• Tela de compra de ingressos</h2><br/>
o	Será possível a compra de no máximo 4 ingressos por cliente<br/>
o	Não será permitida a venda de ingressos para eventos já lotados<br/>
o	A compra deve subtrair o número de ingressos disponíveis do evento<br/>

