# Made by Shashwat Pandey in Fall 2018 for UT EE 460N - Computer Architecture, Lab 3, taught by Dr Yale Patt
# Please don't use it without my permission or claim it as your own.

SHELL := /bin/bash

CC=gcc
CFLAGS=-std=c99 -Wall -Wextra -ansi
FNAME=assembler.c
ONAME=assemble

OUTPUT=output.obj

ASSEMBLER=assembler.linux
INPUT=program.asm
COUT=obj

DIR=/EE460N/test
KAMEK=spandey1@mario.ece.utexas.edu


LAB2FNAME=lc3bsim2.c
LAB2KASIM=simulate
LAB2INAME=obj
LAB2ONAME=dumpsim
pass=''

LAB3FNAME=lc3bsim3.c
LAB3KASIM=simulate
LAB3MICRO=ucode3
LAB3ONAME=dumpsim

#las: ${ASSEMBLER}
#	while IFS= read -r -s -n1 char; do
#	  [[ -z ${char} ]] && { printf '\n'; break; }
#	  if [[ ${char} == $'\x7f' ]]; then
#	      [[ -n $pass ]] && pass=${pass%?}
#	      printf '\b \b'
#	  else
#	    pass+=$char
#	    printf '*'
#	  fi
#	done

test:
	./test.sh
	pass=`cat out.txt`
	#rm out.txt
	echo "******IT WORKED ${pass} lol"


push: ${ASSEMBLER} ${INPUT} ${COUT}
	dos2unix ${INPUT}
	dos2unix ${COUT}
	scp ${ASSEMBLER} ${INPUT} ${COUT} ${KAMEK}:~${DIR}
	ssh ${KAMEK} ".${DIR}/${ASSEMBLER} ~${DIR}/${INPUT} ~${DIR}/${COUT}"
	scp ${KAMEK}:~${DIR}/${COUT} ./

lab3: push ${LAB3FNAME} ${LAB3MICRO} ${LAB3ONAME}
	${CC} ${CFLAGS} -o ${LAB3KASIM} -g ${LAB3FNAME}
	dos2unix ${LAB3MICRO}
	./${LAB3KASIM} ${LAB3MICRO} ${COUT} ${LAB3ONAME



lab2: ${LAB2FNAME} ${LAB2INAME} ${LAB2ONAME}
	${CC} ${CFLAGS} -o ${LAB2KASIM} -g ${LAB2FNAME}
	./${LAB2KASIM} ${LAB2INAME}



assemblermake: ${FNAME}
	${CC} ${CFLAGS} -g ${FNAME} -o ${ONAME}


deleteout:
	touch ${OUTPUT}
	rm ${OUTPUT}
	touch ${OUTPUT}

run: assemblermake ${ONAME} ${INPUT} deleteout
	./${ONAME} ${INPUT} ${OUTPUT}


deletecout:
	touch ${COUT}
	rm ${COUT}
	touch ${COUT}

ass: ${ASSEMBLER} ${INPUT} deletecout
	./${ASSEMBLER} ${INPUT} ${COUT}


diff: ass run
	diff ${COUT} ${OUTPUT}

clean: ${ONAME}
	rm ${ONAME} ${OUTPUT} ${COUT}
