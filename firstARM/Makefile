SRC = $(wildcard ./*.asm)
OBJ = $(wildcard ./bin/*.o)
WDIR = bin
TARGET = main

all:
	@mkdir $(WDIR)
	@as $(SRC) -o $(WDIR)/$(TARGET).o
	@echo "Object has been created!"
	@ld bin/$(TARGET).o -o bin/$(TARGET)
	@echo "Executale has been created!"

debug:
	mkdir $(WDIR)
	as $(SRC) -o $(WDIR)/$(TARGET).o
	ld bin/$(TARGET).o -o bin/$(TARGET)

clean:
	@rm -rf $(WDIR)
