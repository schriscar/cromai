#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Dec 14 01:54:42 2019

@author: chris

Identifica o pid do próprio script.

"""

import os
import time

# Abrir um arquivo de nome pid.
arquivo = open('pid' , 'w')
# Identificar o pid desse script e salvá-lo no arquivo pid.
arquivo.write(str(os.getpid()))
# Fechar arquivo.
arquivo.close()

'''
função que imprime três vezes a frase ""2: I am alive" e ao final do loop 
imprime "2: I gonna die now, bye"
'''
def vivomorto():
    for x in range(3):
        print ("2: I am alive")
        #agurdar 2 segundos..
        time.sleep(2)
    print ("2: I gonna die now, bye")

#chamar função
vivomorto() 