CC 			= g++

CFLAGS 		= -Wall -std=c++2a -m32 -march=i386
LDFLAGS 	= -static -static-libstdc++

CLIBS	 	= 

SRC 		= src
OBJ 		= obj
DEP 		= include
LIB 		= lib

SUBDIR 		= -I$(SRC)/ -I$(DEP)/ -L$(LIB)/

SOURCE 		:= $(wildcard $(SRC)/*/*.cpp)
OBJECTS 	:= $(patsubst $(SRC)/%.cpp, $(OBJ)/%.o, $(SOURCE))

bin/Program: $(OBJECTS)
	$(CC) $^ -o $@ $(CFLAGS) -Os -O3 $(LDFLAGS) $(CLIBS)

bin/Program-d: $(OBJECTS)
	$(CC) $^ -o $@ $(CFLAGS) -g $(LDFLAGS) $(CLIBS)

$(OBJ)/%.o: $(SRC)/%.cpp
	$(CC) $(SUBDIR) -c $< -o $@

release: bin/Program

debug: bin/Program-d

clean:
	rm -rf obj/*.*

.PHONY: bin/Program
