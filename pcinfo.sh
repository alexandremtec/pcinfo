#!/bin/bash
mobo=$(inxi -M | grep -i mobo | cut -d":" -f2,3,4,5,6)
processador=$(cat /proc/cpuinfo | grep -i "model name" | uniq)
memoria=$(free -h | grep -vi total | awk '{print $2}' | head -n1)
hd=$(inxi -D | grep size)
so=$(cat /etc/issue.net)
kernel=$(uname -r)
arq=$(arch)

clear
echo "Olá destemido $USER, hoje é $(date +%d/%m/%Y) e são $(uptime | cut -d 'u' -f1)!)"

echo " "
echo "Seguem algumas informaçõos sobre seu equipamento:"
echo " "
echo " HARDWARE "
echo " "
echo "Placa Mãe: $mobo"
echo "Processador: $processador"
echo "Memória: $memoria GB"
echo "Disco Rígido: $hd" 
echo " "
echo " SOFTWARE "
echo ""
echo "Sistema Operacional: $so"
echo "Versão do Kernel: $kernel"
echo "Arquitetura: $arq"


