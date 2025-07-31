using ordenacao_csharpe;

List<int> listaNumeros = new List<int>();
List<int> lista2Numeros = new List<int>();

List<string> listaPalavras = new List<string>();

Util.popularAleatorioNumeros(listaNumeros, 10, 100, 500);
Util.exibirListaNumeros(listaNumeros);

lista2Numeros.AddRange(listaNumeros);


Util.popularAleatorioPalavras(listaPalavras, 10, 6);
Util.exibirListaPalavras(listaPalavras);
