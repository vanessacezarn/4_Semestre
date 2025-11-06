## DESAFIO DA TELEFONIA
### Situação
  1) há um arquivo de log (telephony_sessions.txt) com  números de telefone celular mais dados da sessão de um cliente de uma operadora. Por exemplo:
```
5591999123456;{"session_id":"uuid","imsi":"123456789012345","imei":"356789012345678",
                    "mcc":"724","mnc":"01","cell_id":12345,"lac":54321,"bearer":"LTE",
                    "start_time":"2025-11-05T12:34:56Z","end_time":"2025-11-05T12:45:10Z",
                    "duration_s":614,"ip_addr":"10.23.5.6","sip_call_id":"uuid2","codec":"AMR-WB",
                    "bytes_up":12345,"bytes_down":456789,"lat":-23.550520,"lon":-46.633308,"encryption":"SRTP"}
```
  2) Construa um programa em modo texto (ou gráfico em Java se preferir), orientado a objetos que:
      - a) carregue a base de informações das sessões de telefones(telephony_sessions.txt)
      - b) armaze essa base em uma estrutura de dados do tipo HashSet
      - c) cada par, número de celular(string) e dados de sessão (string), deve ser convertido em um objeto a ser armazenado no HashSet, sendo que o número do celular é a chave para cálculo de endereçamento
      - d) tenha uma funcionalidade em que o usuário entra com o número de celular e o programa retorna a string contendo todos os dados da sessão
  3) Construa um menu para atender a demanda
      - a) ao abrir o menu o arquivo deve ser carregado 
