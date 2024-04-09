# Pokedex Flutter APP

Projeto com intuito de demonstrar a utilização do [Mobx](https://pub.dev/packages/mobx) com [Dart Clean Architecture](https://github.com/Flutterando/Clean-Dart)

![Demonstration](https://github.com/JonatasDPorto/pokedex/blob/main/github_assets/pokedex_video.gif)

# Screens
## SplashScreen

Utilizada para carregar recursos da [PokeApi](https://pokeapi.co/).

Para evitar sobrecarregar tanto a API quanto a interface do usuário, todos os recursos são carregados em lotes de até cinco por vez. Além disso, é adicionado um atraso de 100ms entre cada carga para garantir uma distribuição uniforme do processamento e proporcionar uma melhor experiência de uso, evitando que a interface fique sobrecarregada.

Após carregar pelo menos 10 pokemons (antes era 100 mas algumas pessoas não sabem ler), avança para a tela da Pokedex e continua o carregamento em background.

<img src="https://github.com/JonatasDPorto/pokedex/blob/main/github_assets/splash_screen.png" alt="PokedexScreen" width="200"/>


## PokedexScreen

Demonstra todos os pokemons ordenados por **ID**

<img src="https://github.com/JonatasDPorto/pokedex/blob/main/github_assets/pokedex_screen.png" alt="PokedexScreen" width="200"/>


## PokemonScreen

Mostra informações de um pokemon especifico.

<img src="https://github.com/JonatasDPorto/pokedex/blob/main/github_assets/pokemon_screen.png" alt="PokedexScreen" width="200"/><img src="https://github.com/JonatasDPorto/pokedex/blob/main/github_assets/pokemon_screen_2.png" alt="PokedexScreen" width="200"/>


# Packages utilizados

## equatable
O pacote equatable fornece uma maneira simples de fazer objetos em Dart serem comparáveis ​​sem ter que substituir manualmente os métodos == e hashCode. Ele ajuda a garantir que objetos possam ser comparados de forma eficiente e precisa.

## either_dart
O pacote either_dart implementa o tipo de dados Either, que representa um valor que pode ser de um de dois tipos possíveis. Ele é útil para modelar operações que podem resultar em sucesso ou falha, proporcionando uma maneira limpa e expressiva de lidar com ambos os casos.

## dio
O pacote dio é uma poderosa biblioteca HTTP para Flutter e Dart, que oferece suporte para requisições HTTP, intercepção de solicitações e respostas, autenticação, cancelamento de solicitações e muito mais. É amplamente utilizado para fazer chamadas de API em aplicativos Flutter.

## flutter_modular
O pacote flutter_modular é uma estrutura de roteamento e gerenciamento de estado para aplicativos Flutter, baseada em injeção de dependência. Ele permite modularizar seu código, facilitando a organização, teste e reutilização de diferentes partes do aplicativo.

## mobx
O pacote mobx é uma biblioteca de gerenciamento de estado reativa e orientada a objetos para Dart e Flutter. Ele oferece uma maneira simples e eficiente de gerenciar o estado do aplicativo, permitindo que os desenvolvedores criem aplicativos reativos com menos boilerplate.

## flutter_mobx
O pacote flutter_mobx é uma extensão do mobx especificamente projetada para integração com aplicativos Flutter. Ele fornece widgets reativos que podem ser facilmente conectados ao estado gerenciado pelo mobx, permitindo que a interface do usuário seja atualizada automaticamente em resposta a mudanças no estado.

## pulsator
O pacote pulsator é usado para criar efeitos de pulsação animados em widgets Flutter. Ele oferece uma maneira fácil de adicionar animações de pulsação a elementos da interface do usuário, como botões, ícones ou indicadores de carregamento.

## cached_network_image
O pacote cached_network_image fornece um widget Flutter que carrega e exibe imagens de uma URL de forma eficiente, armazenando em cache as imagens para melhorar o desempenho e reduzir a latência de carregamento. Ele é amplamente utilizado para exibir imagens em aplicativos Flutter que recuperam imagens de fontes remotas, como servidores da web.

# Atribuições de Assets

<a href="https://www.flaticon.com/br/icones-gratis/pokemon" title="pokémon ícones">Pokémon ícones criados por Smashicons - Flaticon</a>

[PokemonFont](https://www.dafont.com/pt/pokemon.font?text=Pokedex&psize=s)

[PokemonPixelFont](https://pt.fonts2u.com/pokemon-pixel-font-regular.fonte)


