#!/bin/bash

#
# Script: cromai_bash.sh
# Verifica se o script cromaipy.py está ativo, se não estiver executa o mesmo.
# Data de criação: 14/12/2019
# Criado por Christiane Cardoso
# schriscar@gmail.com
#

[ -e "cromai.log" ] && rm cromai.log

laco_infinito()
while true; do
executa=true
	
# Lista de pids python ativos.   
lista=$(pidof -x python 2>> cromai.log |sed 's/ /\n/g' 2>> cromai.log)
echo $lista
# Se a lista tem pids ativos então
if [[ ! -z "$lista" ]] 2>> cromai.log; then
	#procura nesta lista   
	for item in $lista; do
		# o número do pid que está gravado no arquivo 'pid' (cat pid).
		# Se encontrar pid gravado no arquivo igual a um pid python ativo (`cat pid` == "$item" ) então
		if [[ `cat pid` == "$item" ]] 2>> cromai.log; then
			# variável executa recebe o valor "false"
			executa=false
			# imprime a frase "1: It is alive".
			echo "1: It is alive"
			# Finaliza esse loop.
			break
		fi
	done
fi

#
#Se a variável executa é true então, não existe programa python ativo (lista vazia) ou 
#nenhum dos programas em python ativo é o cromaipy.py, então uma msg será impressa e o
#programa cromaipy.py será executado.
#

if [[ $executa = true ]] 2>> cromai.log; then
	echo "1: It is dead"
	python cromaipy.py & 2>>cromai.log | tee
sleep 2
fi
done

# Se arquivo pid não existe grava erro no arquivo de erro "cromai.log".
if [ ! -e "pid" ] 2>> cromai.log ; then
	echo -e "Arquivo não encontrado, o arquivo 'pid' precisa estar na pasta corrente." >>  cromai.log 
	echo -e "Arquivo não encontrado, log salvo em cromai.log."
else
	laco_infinito 2>> cromai.log
fi