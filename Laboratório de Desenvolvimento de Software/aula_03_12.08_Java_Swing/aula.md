# JAVA SWING
* biblioteca gráfica para criar interfaces gráficas de usuários (GUIs)
* permite criar aplicativos com uma aparência e comportamento visual atraente e interativo
* Swing é parte da Java Foundation Classes -JFC e oferece uma ampla gama de componentes GUI, como botões, caixa de texto, paineis e janelas que podem ser usados para construir interfaces ricas e dinâmicas
* é um método que facilmente poderemos compreender o desenvolvimento de software
   * utilizar uma conexão com banco de dados para integração e o desenvolvimento de software
   * utilizar componentes interação com o usuário    
* possibilidade de utilizar o eclipse e netbenas
    * netbeans o swing já vem instalado na versão tradicional
    * eclipse tem que baixar extensão do WindonwBuilder (ferramenta que possibilita a construção de telas empregrando APIs)

#### ✦ Vantagens do java Swing
- Plataforma independente ➔ as aplicações funcionam em várias plataformas sem a necessidade de reescrever o código
- Componentes personalizáveis ➔ personalizar a aparência e comportamento dos componentes Swing
- Rica variedade de componentes ➔ vasta gama de componentes que podem ser combinados para criar interfaces complexas
- Interface responsiva ➔ as aplicações são responsivas e rápidas
- Look and Feel Consistente (visual e interatividade) ➔ permite aplicar diferentes "look and feels" para adpatar a aparência da aplicação ao sistema operacional
#### ✦ Desvantagens do java Swing
- Aparência e Experiência de usuário ➔ não oferece uma aparência nativa em todas as plataformas
   - dependendo do sistema operacional, as interfaces criadas com Swing podem aparecer deslocadas e diferentes das interfaces nativas, afetando a experiência do usuário    
- Desempenho ➔ pode ser mais pesado em termos de recursos e desempenho em comparação com tecnologias de GUI mais modernas ➔ pode gerar menor responsividade e atrasos perceptíveis em interfaces mais complexas
- Falta de Recursos modernos ➔ o swing carece de recursos modernos de design e intera~çao presentes em outras bibliotecas e frameworks mais recentes ➔ pode limitar a capacidade de criar interfaces altamente interativas e visualmente atraentes

## ✦ Componentes para serem utilizados numa interface gráfica utilizando Swing
* Jpanel ➔ componente que serve como um contêiner leve e flexível para agrupar outros componentes,
  * usado para organizar e agrupar outros componentes em uma área comum dentro de uma interface gráfica
* JButton ➔ botão clicável que executa uma ação quando pressionado
* JLabel ➔ componente que exibe um texto ou uma imagem
* JTextField ➔ caixa de texto onde os usuarios podem inserir texto
* JCheckBox ➔ caixa de seleção que permite aos usuários escolher entre duas opções
* JRadioButton ➔ botões de opção que permitem aos usuários escolher uma única opção de um grupo
* JTextArea ➔ área de texto multilinha, permite que usuários insiram, visualizem e editem textos em um formato que vai além das limitações de um único campo de texto com o JTextField
* JTable ➔ oferece a capacidade de exibir e editar dados em forma de tabela
  * utilizado para exibir informações tabulares, como listas, tabelas de dados, planilhas,...   
## ✦ Padrão de nomenclatura 
* o nome do componente começa com um prefixo que indica o tipo de componente
  
|prefixo|função|componente|
|:--:|:--:|:--:|
|btn|botões | JButton|
|lbl|rótulos | JLabel|
|txt|campo de texto |JTextField|
|cmb|caixa de seleção |JComboBox|
|chk|caixa de seleção| JCheckBox|
|rad|botões de opção| JRadioButton|
|tbl|tabelas|JTable|
|pnl|painéis|JPanel|

* após o prefixo utiliza-se um nome descritivo para indicar a função ou finalidade do componente

## ✦ Layouts
### FlowLayout
- posiciona os componentes em uma única linha, em ordem de inserção
- se não couberem em uma linha, eles são distribuidos para a próxima linha
- adequado para caixas de diálogos simples ou barra de ferramentas
### BorderLayout
- divide o contêiner em cinco regiões: norte, sul, leste, oeste e centro
- cada região pode conter apenas um componente
- útil para layouts mais complexos, em que componentes podem se expandir ou contrair conforme espaço disponível
### GridLayout
- organiza os componentes em uma grade regular de células
- cada célula pode conter um único componente
- apropiado para criar interfaces e formato de tabelas, como calculadora ou jogos de tabuleiro
### BoxLayout
- posiciona os componentes em uma linha, horizontal ou vertical
- permite o alinhamento dos componentes no inicio, centro ou final da linha
- útil para quando precisa-se de um controle mais preciso sobre o alinhamento dos componentes
### GridBagLayout
- alto nível de flexibilidade e controle sobre a posição e o tamanho dos componentes
- útil para layouts personalizados onde o posicionamento exato dos componentes é crucial
- mais complexo de usar devido às muitas opções de configuração
### CardLayout
- permite alternar entre diferentes painéis, onde apenas um é visivel por vez
- adequado para criação de painéis de navegação ou etapas em aplicativos com várias telas
  
## ✦ Elementos de um componente
- todos os componentes possuem 3 elementos:
  - Properties:  alterar propiedades como cor, fonte, tamanho,...
  - Events: programar qualquer tipo de evento para cada componente
  - Code: verificar e alterar o nome do componente e seguir a convenção, alterar a visibilidade do botão, parâmetros nas chamadas de métodos 
