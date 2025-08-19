## ✦ Text Area (txaTexto)
- coloca-se o texto da mesma forma que o TextField
```.java
  txa.Resultado.setTexto("escrita do texto");
```
- A diferença para text field é que aqui pode-se mudar a quantidade de colunas e linhas e ir adicionando dentro dele
  - em propiedades do componente na opção columns
- método **.append**
  - usado para adicionar, concatenar, texto no final de algo que já existe
```.java
  txaTexto.append(txtMensagem.getText()+"\n");
  txtMensagem.setText(""); //usado para limpar o textField
```
<div align="center">
  <img width="610" height="229" alt="image" src="https://github.com/user-attachments/assets/c2a04563-234d-4d11-a49d-2b79dffa55aa" />
</div>

## ✦  RadioButton(rad) e ButtonGroup
- utilizado para permitir que os usuários escolham uma única opção de um conjunto pré-definido de opções mutuamente exclusivas
<div align="center">
  <img width="249" height="36" alt="image" src="https://github.com/user-attachments/assets/5c25a197-ab76-4f59-9c89-b5f089b6d1d8" />
</div>

- apenas adicionar dois RadioButton não faz com que apenas uma opçõa possa ser escolhida é necessario adicionar um ButtonGroup, que não ficará visivel no formulario, e depois ir nas propiedades de cada RadioButton e selecionar o ButtonGroup criado
<div align="center">
  <img width="475" height="163" alt="image" src="https://github.com/user-attachments/assets/d09d158e-8fa3-4f24-ae96-5dfcc88acf81" />
</div>

- no codigo declar uma variavel global sexo 
```.java
if(radMasculino.isSelected()){
            sexo = 'M';
            JOptionPane.showMessageDialog(null, "Sexo selecionado:"+sexo, "Aleta!!!", JOptionPane.INFORMATION_MESSAGE);
        }else if(radFeminino.isSelected()){
            sexo = 'F';
           JOptionPane.showMessageDialog(null, "Sexo selecionado:"+sexo, "Aleta!!!", JOptionPane.INFORMATION_MESSAGE);
        }else{
           JOptionPane.showMessageDialog(null, "Selecione um sexo", "Erro!!!", JOptionPane.ERROR_MESSAGE);
        }
        
```
- método isSelected() é utilizado por componentes que podem ser "selecionados", ele retorna um valor boolean

## ✦ CheckBox (chk)
- permite ao usuário selecionar ou desmarcar uma ou mais opções de um conjunto de opões independentes
- frequentemente utilizados quando deseja-se que o usuário tenha a capacidade de escolher várias opções dentre várias disponíveis
  
<div align="center">
  <img width="319" height="37" alt="image" src="https://github.com/user-attachments/assets/2c0485b0-7049-485f-bad7-efb798bc564a" />
</div>

- no codigo declarar variavéis globais boolean e na ação do botão salvar fazer as modificações de true e false

```.java
        if(chkTecnologia.isSelected()){
            tecnologia = true;
        }else{
            tecnologia = false; // para o caso de deselecionar
        }
         if(chkAstronomia.isSelected()){
            astronomia = true;
        }else{
            astronomia = false; // para o caso de deselecionar
        }
          if(chkEsportes.isSelected()){
            esportes = true;
        }else{
            esportes = false; // para o caso de deselecionar
        }
        JOptionPane.showMessageDialog(null, "Tecnologia: "+tecnologia+"\nAstronomia: "+astronomia+"\nEsportes: "+esportes,"Alerta!!" , JOptionPane.INFORMATION_MESSAGE);      
```

## ✦ Combo Box (cmb)
- combina uma caixa de texto editável com uma lista suspensa de opções selecionáveis
  
<div align="center">
  <img width="149" height="127" alt="image" src="https://github.com/user-attachments/assets/0d7bf76b-77e2-4998-8a93-ef0004f61e10" />
</div>
  
- são usadas para permitir que o usuário escolha uma opção entre várias em um menu suspenso ou insiram um valor personalizado por meio da caixa de texto
- útil para quando deseja-se oferecer uma lista de opções predefinidas ou permitir que os usuários insiram dados personalizados
- para adicionar quais serão as opções disponíveis ➔ clicar com botão direito em cima do combo box e abrir as propiedades e então modificar a model
  
<div align="center">
  <img width="952" height="261" alt="image" src="https://github.com/user-attachments/assets/96e0e236-7337-4c85-a6f8-1693e7dbd7ed" />
</div>

- para deixar em branco a primeira opção, deixar a primeira linha apenas com espaço
    

## ✦ JTable (tbl)
- é um componente usado para exibir dados em forma de tabela
  
 <div align="center">
   <img width="737" height="171" alt="image" src="https://github.com/user-attachments/assets/a55877e2-baa5-4502-bab2-4195d1698fe9" />
 </div>
 
- permite a criação e exibição de tabelas de dados, semelhante a planilha ou aplicativo de banco de dados
- é altamente personalizável e oferece suporte para uma ampla gama de recursos, como ordenação, seleção de células, edição de células, ...
- para modificar a quantidade e o nome das colunas  ➔ clicar com botão direito em cima da JTabel e abrir as propiedades e então modificar a model
  
<div align="center">
  <img width="1047" height="344" alt="image" src="https://github.com/user-attachments/assets/b123eab4-9832-4480-aab3-2ea913f989b1" />
</div>
- codigo ➔ criar uma classe 
# Projeto final com todos os componentes
<img width="359" height="439" alt="{E6663B51-DDE5-45C8-AA1D-500A5C6386D2}" src="https://github.com/user-attachments/assets/2adfee0e-7759-4689-85e7-106622e3680d" />







