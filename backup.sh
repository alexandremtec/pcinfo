#!/bin/bash
DATA=$(date +%d-%m-%Y__%H:%M:%S)
LOG_DIR=/var/log/backup
ORIGEM=$2
DESTINO=$3

function verificar(){
	if [ ! -d $LOG_DIR ]
	then
		echo "Script executado pela primeira vez, você não tem o diretório de logs $LOG_DIR."
		echo "execute como root 'mkdir -m 777 -p /var/log/backup'"
		exit 0
	fi

}

function full(){
	echo "Backup iniciado em $DATA." >> $LOG_DIR/backup-full
	tar -cvf $2".tar" $1 >> $LOG_DIR/backup-full 2> $LOG_DIR/backup-erro
	if [ $? == 0 ] 
	then
		echo "Backup finalizado em $DATA." >> $LOG_DIR/backup-full
	else
		echo "OPS, ocorreu algum imprevisto, favor visualizar o arquivo de erro."
	fi
}

function inc(){
	echo "Backup iniciado em $DATA." >> $LOG_DIR/backup-incremental
	rsync -Cravzp $1 $2 >> $LOG_DIR/backup-incremental 2> $LOG_DIR/backup-erro
	if [ $? == 0 ]
	then
		echo "Backup finalizado em $DATA." >> $LOG_DIR/backup-incremental
	else
		echo "OPS, ocorreu algum imprevisto, favor visualizar o ar
    quivo de erro."
 	 fi
}


verificar
case $1 in
	"full") full $ORIGEM $DESTINO;;
	"incremental") inc $ORIGEM $DESTINO;;
	*) echo "Use ./backup [opção] [origem] [destino]"
esac
