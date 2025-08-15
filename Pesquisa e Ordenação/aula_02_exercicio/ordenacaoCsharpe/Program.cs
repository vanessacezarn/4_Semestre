using ordenacaoCsharpe;

List<int> listaNumeros = new List<int>();
List<int> lista2Numeros = new List<int>();

List<string> listaPalavras = new List<string>();
List<string> listaPalavras2 = new List<string>();


Util.popularAleatorioNumeros(listaNumeros, 10, 100, 500);
Console.WriteLine("Lista populada com numeros aleatorios");
Util.exibirListaNumeros(listaNumeros);
Console.WriteLine("--------");

Util.popularAleatorioPalavras(listaPalavras, 10, 6);
Console.WriteLine("Lista populada com palavras aleatorias");
Util.exibirListaPalavras(listaPalavras);
Console.WriteLine("--------");

Util.popularNumArquivo(lista2Numeros, "numeros.txt");
Console.WriteLine("Lista populada com numeros vindo de um arquivo .txt");
Util.exibirListaNumeros(lista2Numeros);
Console.WriteLine("---------");

Util.popularPalArquivo(listaPalavras2, "palavras.txt");
Console.WriteLine("Lista populada com palavras vindo de um arquivo .txt");
Util.exibirListaPalavras(listaPalavras2);
Console.WriteLine("---------");

