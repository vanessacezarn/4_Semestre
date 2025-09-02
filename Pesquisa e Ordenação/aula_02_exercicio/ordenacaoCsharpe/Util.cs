using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ordenacaoCsharpe
{
    class Util
    {
        /// <summary>
        /// método de classe que popula uma lista de números inteiros com valores aleatorios
        /// </summary>
        /// <param name="lista"> estrutura  de armazenamento dos números</param>
        /// <param name="quantidade">de números a serem gerados</param>
        /// <param name="inicio">valor inicial da extensão do numero gerado</param>
        /// <param name="fim">valor final da extensão do numero gerado</param>
        public static void popularAleatorioNumeros(List<int> lista, long quantidade, int inicio, int fim)
        {
            Random gerador = new Random();
            for (; quantidade > 0; quantidade--)
            {
                lista.Add(gerador.Next(inicio, fim));
            }
        }
        /// <summary>
        /// método de classe que gera palavras aleatórias
        /// </summary>
        /// <param name="lista">armazenam as palavras geradas</param>
        /// <param name="quantidade"> de palavras a serem geradas</param>
        /// <param name="tamanho"> das palavras a serem gerada</param>
        public static void popularAleatorioPalavras(List<string> lista, long quantidade, int tamanho)
        {
            string letras = "abcdefghijklmnopqrstuvwxyz";
            //System.out.println(letras);
            Random gerador = new Random();

            for (; quantidade > 0; quantidade--)
            {
                string palavraGerada = "";
                char letraSorteada;
                for (int i = 0; i < tamanho; i++)
                {
                    letraSorteada = letras[gerador.Next(letras.Length)];
                    palavraGerada = palavraGerada + letraSorteada;
                }

                lista.Add(palavraGerada);
            }
        }

        /// <summary>
        /// método de classe que exibe uma lista de números inteiro
        /// </summary>
        /// <param name="lista">contendo numeros inteiros</param>
        public static void exibirListaNumeros(List<int> lista)
        {
            foreach (int item in lista)
            {
                Console.WriteLine(item);
            }
        }

        /// <summary>
        /// método de classe que exibe uma lista de palavras
        /// </summary>
        /// <param name="lista">contendo palavras</param>
        public static void exibirListaPalavras(List<string> lista)
        {
            foreach (string item in lista)
            {
                Console.WriteLine(item);
            }
        }

        /// <summary>
        /// método de classe que popula uma lista com numeros presentes em um arquivo .txt
        /// </summary>
        /// <param name="lista">armazenam numeros vindos do arquivo</param>
        /// <param name="caminho"> caminho do arquivo</param>
        public static void popularNumArquivo(List<int> lista, string caminho)
        {

            if (!File.Exists(caminho))
            {
                Console.WriteLine("Arquivo não existe");
                return;
            }

            string[] linhas = File.ReadAllLines(caminho);

            foreach (string linha in linhas)
            {
                string valorLimpo = linha.Trim(); // remove espaços e quebras de linha
                int numero = int.Parse(valorLimpo);
                lista.Add(numero);
                
            }
        }
        /// <summary>
        /// método de classe que popula uma lista com palavras presentes em um arquivo .txt
        /// </summary>
        /// <param name="lista">armazenam palavras vindos do arquivo</param>
        /// <param name="caminho"> caminho do arquivo</param>
        public static void popularPalArquivo(List<string> lista, string caminho)
        {
            if (!File.Exists(caminho))
            {
                Console.WriteLine("Arquivo não existe");
                return;
            }
            string conteudo;
            conteudo = File.ReadAllText(caminho);
            lista.Add(conteudo);

        }



    }

}

