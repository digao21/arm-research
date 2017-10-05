# Makefile for StencilProbe
#
#

###########################
# BSC
PARTITION = -D JETSON # chose one -JETSON -MERLIN
FLAGS = -march=armv8-a -O3 $(PARTITION)
INCL_PAPI = $(PAPI_INCL) -DHAVE_PAPI
LINK_PAPI = $(PAPI_LIBS) -lpapi

###########################
# SDUMONT
# FLAGS = -O3
# INCL_PAPI = -I/opt/bullxde/perftools/papi-bull/5.4.3.0/include -DHAVE_PAPI
# LINK_PAPI = -L/opt/bullxde/perftools/papi-bull/5.4.3.0/lib64 -lpapi

CC = gcc $(FLAGS)

SRC = src
BIN_DIR = bin
OBJ_DIR = $(BIN_DIR)/obj
ASM_DIR = $(BIN_DIR)/asm

ALL_OBJ = $(OBJ_DIR)/main.o $(OBJ_DIR)/analise.o $(OBJ_DIR)/experiments.o $(OBJ_DIR)/util.o \
          $(OBJ_DIR)/probe_heat.o $(OBJ_DIR)/probe_heat_cpu.o $(OBJ_DIR)/probe_heat_blocked.o \
          $(OBJ_DIR)/probe_heat_circqueue.o $(OBJ_DIR)/probe_heat_oblivious.o $(OBJ_DIR)/probe_heat_timeskew.o

probe:	main analise experiments util \
	probe_heat probe_heat_cpu probe_heat_blocked probe_heat_circqueue probe_heat_oblivious probe_heat_timeskew
	$(CC) -o $(BIN_DIR)/probe.exe $(ALL_OBJ)  $(LINK_PAPI)

main:	$(SRC)/main.c $(SRC)/experiments.h
	$(CC) -c $(SRC)/main.c -o $(OBJ_DIR)/main.o
	$(CC) -S $(SRC)/main.c -o $(ASM_DIR)/main.asm

analise: $(SRC)/analise.c $(SRC)/analise.h $(SRC)/cycle.h $(SRC)/util.h $(SRC)/probe.h
	$(CC) -c $(INCL_PAPI) $(SRC)/analise.c -o $(OBJ_DIR)/analise.o
	$(CC) -S $(INCL_PAPI) $(SRC)/analise.c -o $(ASM_DIR)/analise.asm

experiments:	$(SRC)/experiments.c $(SRC)/experiments.h $(SRC)/probe.h $(SRC)/util.h $(SRC)/analise.h
	$(CC) -c $(INCL_PAPI) $(SRC)/experiments.c -o $(OBJ_DIR)/experiments.o
	$(CC) -S $(INCL_PAPI) $(SRC)/experiments.c -o $(ASM_DIR)/experiments.asm

util:	$(SRC)/util.c $(SRC)/util.h $(SRC)/cycle.h
	$(CC) -c $(INCL_PAPI) $(SRC)/util.c -o $(OBJ_DIR)/util.o
	$(CC) -S $(INCL_PAPI) $(SRC)/util.c -o $(ASM_DIR)/util.asm

probe_heat: $(SRC)/probe_heat.c $(SRC)/common.h
	$(CC) -c $(SRC)/probe_heat.c -o $(OBJ_DIR)/probe_heat.o
	$(CC) -S $(SRC)/probe_heat.c -o $(ASM_DIR)/probe_heat.asm

probe_heat_cpu: $(SRC)/probe_heat_cpu.c $(SRC)/common.h
	$(CC) -c $(SRC)/probe_heat_cpu.c -o $(OBJ_DIR)/probe_heat_cpu.o
	$(CC) -S $(SRC)/probe_heat_cpu.c -o $(ASM_DIR)/probe_heat_cpu.asm


probe_heat_blocked:	$(SRC)/probe_heat_blocked.c $(SRC)/common.h
	$(CC) -c $(SRC)/probe_heat_blocked.c -o $(OBJ_DIR)/probe_heat_blocked.o
	$(CC) -S $(SRC)/probe_heat_blocked.c -o $(ASM_DIR)/probe_heat_blocked.asm

probe_heat_circqueue:	$(SRC)/probe_heat_circqueue.c $(SRC)/common.h
	$(CC) -c $(SRC)/probe_heat_circqueue.c -o $(OBJ_DIR)/probe_heat_circqueue.o
	$(CC) -S $(SRC)/probe_heat_circqueue.c -o $(ASM_DIR)/probe_heat_circqueue.asm

probe_heat_oblivious:	$(SRC)/probe_heat_oblivious.c $(SRC)/common.h $(SRC)/run.h
	$(CC) -c $(SRC)/probe_heat_oblivious.c -o $(OBJ_DIR)/probe_heat_oblivious.o
	$(CC) -S $(SRC)/probe_heat_oblivious.c -o $(ASM_DIR)/probe_heat_oblivious.asm

probe_heat_timeskew:	$(SRC)/probe_heat_timeskew.c $(SRC)/common.h
	$(CC) -c $(SRC)/probe_heat_timeskew.c -o $(OBJ_DIR)/probe_heat_timeskew.o
	$(CC) -S $(SRC)/probe_heat_timeskew.c -o $(ASM_DIR)/probe_heat_timeskew.asm

clean:
	rm -f $(OBJ_DIR)/* $(ASM_DIR)/* $(BIN_DIR)/*.exe
