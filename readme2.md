Relatório Técnico - Avaliação N2 (E1)
Aluno: Marcos Vinicius Da Silva Zacchi
Disciplina: Desenvolvimento Mobile

1. Como a navegação foi implementada
A navegação do aplicativo foi estruturada utilizando a pilha nativa do Flutter por meio da classe Navigator. Para avançar na pilha de telas a partir da HomePage, utilizou-se o método Navigator.push(), envelopando o destino com um MaterialPageRoute para garantir a transição de tela padrão do sistema operacional. Para a ação de retorno (presente explicitamente na SobrePage), aplicou-se o método Navigator.pop(context), que destrói a tela atual na árvore de widgets e devolve o usuário à tela anterior, preservando o estado da navegação.

2. Qual pacote do pub.dev foi utilizado
Para cumprir o requisito de integração visual e componentes de UI, foi escolhido o pacote carousel_slider (disponível publicamente no repositório pub.dev). Este pacote fornece um widget altamente customizável para a criação de carrosséis interativos, suportando paginação nativa e animações de transição automáticas.

3. Como ele foi integrado ao app
A integração ocorreu em duas fases. Primeiro, a dependência foi declarada no arquivo de configuração do projeto (pubspec.yaml) através do comando de terminal flutter pub add carousel_slider, que realizou o download dos binários para o cache local. Em seguida, na camada de interface (lib/main.dart), o pacote foi importado e o componente CarouselSlider foi instanciado dentro do corpo da CuriosidadesPage. Ele foi alimentado com uma lista local de mapas (dicionários em Dart) contendo os textos e títulos das curiosidades. As propriedades do pacote foram parametrizadas para habilitar o modo autoPlay e aplicar um aspecto de expansão no item central (enlargeCenterPage: true), resultando em uma interface moderna e dinâmica.