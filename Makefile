FC = gfortran
FFLAGS = -O2 -Wall -Ibuild

TARGET = base_compiler
SRC_DIR = src
OBJ_DIR = build

# Compile order matters for Fortran modules. Hardcoding simple order:
SOURCES = $(SRC_DIR)/managing.f90 $(SRC_DIR)/handling.f90 $(SRC_DIR)/lexer.f90 $(SRC_DIR)/LRParser.f90
OBJECTS = $(patsubst $(SRC_DIR)/%.f90,$(OBJ_DIR)/%.o,$(SOURCES))

all: clean $(TARGET)

$(TARGET): $(OBJECTS)
	@mkdir -p $(OBJ_DIR)
	$(FC) $(FFLAGS) -o $@ $^

# Rule for building object files and modules
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.f90
	@mkdir -p $(OBJ_DIR)
	$(FC) $(FFLAGS) -J$(OBJ_DIR) -M$(OBJ_DIR) -o $@ -c $<

run: $(TARGET)
	./$(TARGET)

clean:
	rm -rf $(OBJ_DIR) $(TARGET)

.PHONY: all run clean
