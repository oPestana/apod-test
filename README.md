# Astronomy Picture of the Day (APOD) App

O aplicativo **Astronomy Picture of the Day** exibe imagens astronômicas diárias utilizando a API da NASA. Desenvolvido em Flutter, o aplicativo permite que os usuários visualizem uma lista de fotos com seus respectivos títulos e datas. Além disso, ao clicar em uma das imagens, o usuário é direcionado para uma página de detalhes onde pode ver a foto em tamanho maior, junto com o título, a data e uma explicação sobre a imagem.

## Funcionalidades

- **Página Inicial**
    - Exibe uma lista de imagens astronômicas, com título e data de cada fotografia.
    - As imagens são carregadas a partir da API da NASA.
    - Possui uma campo de pesquisa na perte superior da tela inicial.

- **Página de Detalhes**
    - Ao clicar em uma imagem na página inicial, o usuário é redirecionado para uma página de detalhes.
    - A página de detalhes exibe a imagem em tamanho maior, juntamente com o título, a data e uma explicação detalhada sobre a imagem.

## Tecnologias Utilizadas

- **Flutter**: Framework utilizado para o desenvolvimento do aplicativo.
- **http**: Pacote utilizado para fazer as chamadas à API da NASA.
- **flutter_secure_storage**: Pacote utilizado para armazenar os dados da resposta da API de forma segura no dispositivo do usuário.

## Como Executar o Projeto

1. **Clone o Repositório**

  ```bash
    git clone https://github.com/seu-usuario/nome-do-repositorio.git
  ```

2. **Navegue até o Diretório do Projeto**

  ```bash
    cd nome-do-repositorio
  ```

3. **Instale as Dependências**

  ```bash
    flutter pub get
  ```

4. **Execute o Projeto**

  ```bash
    flutter run
  ```

## Configuração da API da NASA

Para utilizar a API da NASA, você precisará de uma chave de API. Acesse [API da NASA](https://api.nasa.gov/),crie uma conta e obtenha sua chave. Substitua a variável `key` no código pela sua chave de API.
