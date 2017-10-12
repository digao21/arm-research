#
#numero de registradores: nvcc -c -Xptxas="-v" Poly.cu
#
CC=gcc
COMP=-c
CCFLAGS= -O3
CCLOAD= $(CCFLAGS)

EXEC=Poly.exe

OBJ=Poly.o 


$(EXEC):	$(OBJ) 
	$(CC) -o $(EXEC) $(CCLOAD) $(OBJ) 

clean:
	rm -f *.o $(EXEC)


.SUFFIXES	:	.o .c

.c.o:
	$(CC) $(COMP) $(CCFLAGS) Poly.c 
	$(CC) -S $(CCFLAGS) Poly.c -o Poly.asm

