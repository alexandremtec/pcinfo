#!/bin/bash

APP_DIR=""
# identidade do proprietário da chave
OWNER="login"
# domínio da empresa
MAIL="@dominio.com.br"

# timestamp é a expiração da chave, no caso amanhã 7h quando ela será gerada novamente
TIMESTAMP=$(date -d '7:00 tomorrow' +%s)
mkdir -p /tmp/auth-tmp
cd /tmp/auth-tmp

# identidade dos usuário que serão autenticados 
enderecos+=([0]="informatica" [1]="umsu" [2]="umac" [3]="umax" [4]="umju" [5]="umma" [6]="umpb" [7]="umrm" [8]="umya" [9]="crc" [10]="umss")


function cria_json(){
	echo "{" > $1".txt"
	echo "  \"email\":\"$1$MAIL\"," >> $1".txt"
	echo "  \"validity\": $TIMESTAMP" >> $1".txt"	
	echo "}" >> $1".txt"
}

function cria_gpg(){
	# login@dominio.com.br é fixo aqui porque é o propietário da chave, que vai ser assinada por um usuário
	gpg --armor -u $OWNER$MAIL --output "signed"$1".txt" --sign $1".txt"	
}

function encript_gpg(){
	# --trust-model always serve para forçar o Yes caso tenha alguma pergunta
	gpg --trust-model always --armor --output "enc"$1".txt" --encrypt --recipient "security@gooddata.com" "signed"$1".txt" 		
}

for i in "${enderecos[@]}"
do
	cria_json $i
	cria_gpg $i
	encript_gpg $i
echo $i
done

cp -p enc* $APP_DIR
cd /tmp
rm -rf /tmp/auth-tmp
