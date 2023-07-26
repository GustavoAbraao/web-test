#Etapa de configuração
*** Settings ***
Documentation    Essa suíte testa o site da Amazon.com.br 
Resource         amazon_resources.robot    #É aonde fica a implementação das Keywords dos casos de teste
Test Setup       Abrir o navegador         #Configuração dos comandos que executam antes dos casos de teste
Test Teardown    Fechar o navegador        #Configuração dos comandos que executam depois dos casos de teste

#Etapa em que os casos de testes vão ser escritos
*** Test Cases ***
Caso de teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]  Esse teste verifica o menu eletrônicos do site da Amazon.com.br
    ...              e verifica a categoria Computadores e Informática
    [Tags]           menus  categorias
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."
    Entrar no menu "Eletrônicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a categoria "Computadores e Informática"
    Verificar se aparece a categoria "Tablets"

Caso de teste 02 - Pesquisa de um Produto
    [Documentation]  Esse teste verifica a busca de um produto
    [Tags]           busca_produtos  lista_busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa está listando o produto "Console Xbox Series S"

Caso de teste 03 - Adiciona um Produto no carrinho de compras
    [Documentation]    Esse teste adiciona um produto no carrinho de compras
    [Tags]             produto_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa está listando o produto "Console Xbox Series S"
    Selecionar o produto "Console Xbox Series S" para o carrinho
    Clicar para adicionar o produto ao carrinho de compras
    Ir para o "Carrinho" de compras
    Verificar o produto "Console Xbox Series S" no carrinho
    Verificar a quantidade no carrinho "Qtd:1"