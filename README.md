# Instalação do Robot Framework

O Robot Framework é uma estrutura de automação de teste de código aberto. Siga os passos abaixo para instalar o Robot Framework na sua máquina.

## Pré-requisitos

- Python (versão 3.x)
- pip (gerenciador de pacotes do Python)

## Instalação

1. Verifique a versão do Python instalada no seu sistema:
python --version

2. Atualize o pip para a versão mais recente:
python -m pip install --upgrade pip

3. Instale o Robot Framework:
python -m pip install robotframework

4. Verifique se o Robot Framework foi instalado corretamente:
robot --version

## Executando testes com o Robot Framework

Para executar testes com o Robot Framework, basta criar arquivos de teste com a extensão `.robot` e executá-los usando o comando `robot` no terminal. 
Por exemplo:

robot arquivo_de_teste.robot

