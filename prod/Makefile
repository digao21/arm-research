#
#numero de registradores: nvcc -c -Xptxas="-v" Poly.cu
#
CC=gcc
COMP=-c
CCFLAGS= -O3
CCLOAD= $(CCFLAGS)

EXEC=prod.exe

OBJ=prod.o 


$(EXEC):	$(OBJ) 
	$(CC) -o $(EXEC) $(CCLOAD) $(OBJ) 

clean:
	rm -f *.o $(EXEC)


.SUFFIXES	:	.o .c

.c.o:
	$(CC) $(COMP) $(CCFLAGS) prod.c 
	$(CC) -S $(CCFLAGS) prod.c -o prod.asm

