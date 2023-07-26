#Etapa de configuração da biblioteca Selenium Library para testes Web
*** Settings ***
Library  SeleniumLibrary


#Variáveis globais que são armazenadas para acessar em qualquer caso de teste
*** Variables ***
${BROWSER}                     chrome
${URL}                         https://www.amazon.com.br/
${MENU_ELETRONICOS}            //a[@data-csa-c-slot-id='nav_cs_7']
${HEADER_ELETRONICOS}          //h1[contains(.,'Eletrônicos e Tecnologia')]  
${ADD_CARRINHO}                //input[@name='submit.add-to-cart']
${HEADLESS}                    --headless
#Etapa de implementação das Keywords definidas nos casos de teste
*** Keywords ***
Abrir o navegador
    Open Browser    browser=${BROWSER}    options=${HEADLESS}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}
    
Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITLE}"
    Title Should Be    title=${TITLE}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//a[@aria-label='${NOME_CATEGORIA}']

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button

Verificar o resultado da pesquisa está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO}')])[2]

Selecionar o produto "${PRODUTO}" para o carrinho
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO}')])[2]
    Click Element    locator=(//span[contains(.,'${PRODUTO}')])[2]
    
Clicar para adicionar o produto ao carrinho de compras
    Wait Until Element Is Visible    locator=${ADD_CARRINHO}
    Click Element    locator=${ADD_CARRINHO}

Ir para o "${CARRINHO}" de compras
    Wait Until Element Is Visible    locator=//span[contains(.,'${CARRINHO}')]
    Click Element    locator=//span[contains(.,'${CARRINHO}')]

Verificar o produto "${PRODUTO}" no carrinho
    Sleep    5
    Wait Until Element Is Visible    locator=//span[@class='a-truncate-cut'][contains(.,'${PRODUTO}')]
    Page Should Contain    text=${PRODUTO}

Verificar a quantidade no carrinho "${NUMERO}"
    Element Should Contain    locator=//span[@class='a-button-text a-declarative'][contains(.,'${NUMERO}')]    expected=${NUMERO}