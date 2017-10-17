#
#numero de registradores: nvcc -c -Xptxas="-v" Poly.cu
#
CC=gcc
COMP=-c
CCFLAGS= -O3
CCLOAD= $(CCFLAGS)

EXEC=Neonh.exe

OBJ=Neonh.o 


$(EXEC):	$(OBJ) 
	$(CC) -o $(EXEC) $(CCLOAD) $(OBJ) 

clean:
	rm -f *.o $(EXEC)


.SUFFIXES	:	.o .c

.c.o:
	$(CC) $(COMP) $(CCFLAGS) Neonh.c 
	$(CC) -S $(CCFLAGS) Neonh.c -o Neonh.asm

