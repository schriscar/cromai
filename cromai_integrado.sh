#!/bin/bash

#
# Script: cromai_bash.sh
# Verifica se o script cromaipy.py está ativo, se não estiver executa o mesmo.
# Data de criação: 14/12/2019
# Criado por Christiane Cardoso
# schriscar@gmail.com
#

# Carregar script com a função
source cromai_bash.sh

# Remover arquivo de log caso ele existir.
[ -e "cromai.log" ] && rm cromai.log

# Cria arquivo "pid" caso ele não exista.
[[ ! -e "pid" ]] 2>> cromai.log && touch pid

# Chama função
laco_infinito 2>> cromai.log
