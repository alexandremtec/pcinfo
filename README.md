# scripts-uteis
## Scripts úteis para sistemas GNU/Linux

### -PC Info 
Apresenta informações de hardware e Sistema operacional.

### -Backup
Automatiza a execução de cópias de segurança

Modo de uso:
```
./script [opção] [origem] [destino]
opções: full -> backup completo
        incremental -> backup incremental
```
### -Auth Script
Esse script tem por finalidade criar arquivos no formato JSON que são necessários para atualizar o tempo de sessão no sistema do Gooddata. Como o tempo de sessão é de no máximo 36 horas, nosso script gera um novo TIMESTAMP, encripta os dados via gpg e os deixa pronto para ser enviado para o servidor remoto.

Assim, a equipe de desenvolvimento implementa as rotinas backend de acordo com seu ambiente para fazer a integração.
