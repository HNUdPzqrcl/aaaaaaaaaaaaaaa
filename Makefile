CC=gcc
LIB=-L/usr/local/lib -ljansson -lcurl
FLAGS=-Wall -Wextra
C_FLAGS=$(LIB)
L_FLAGS=$(LIB)

BIN=blockchain-query
HDR=$(wildcard *.h)
SRC=$(wildcard *.c)
OBJ=$(SRC:.c=.o)

all: $(BIN)
$(BIN): $(OBJ)
	$(CC) $(OBJ) -o $(BIN) $(FLAGS) $(L_FLAGS)

%.o: %.c $(HDR)
	$(CC) -c $< -o $@ $(FLAGS) $(C_FLAGS)

jansson:
	./make_jansson

clean:
	rm -f $(BIN) $(OBJ)
