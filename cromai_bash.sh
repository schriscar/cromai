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
	# Procura por pid python ativo e verifica se um deles corresponde ao pid gravado no arquivo "pid". 
	x=$(pidof -x python |sed 's/ /\n/g'| grep -e "`cat pid`$")
	# Se achar imprime "It's alive caso, contrário imprime "It's dead e executa script python
	if [[ ! -z "$x" ]]; then
		echo "1: It is alive"
	else
		echo -e "1: It is dead"; python cromaipy.py & 2>>cromai.log | tee
		sleep 2
	fi
	done
# Cria arquivo "pid" caso ele não exista.
[[ ! -e "pid" ]] 2>> cromai.log && touch pid

# Chama função
laco_infinito 2>> cromai.log
