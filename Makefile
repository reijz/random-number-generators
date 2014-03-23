# ******************************************************************\
#  File:           Makefile for rng
#  Language:       C++ (ISO 1998)
#  Copyright:      Jiheng Zhang
#                  Hong Kong University of Science and Technology
#  Date:           March 23, 2014
# ******************************************************************/

# This is the makefile for RNG (random number generator).

# set compiler
COMPILER = g++
FLAGS +=  -O2 -Wall -g -Wno-deprecated -D_CHECK_MEMORY

# set home
RNGHOME = .

INCLUDEDIR = $(RNGHOME)/include
LIBDIR = $(RNGHOME)/lib
SOURCEDIR = $(RNGHOME)/source

# test number
NU = test

# library objects
LIBOBJS = $(LIBDIR)/RngStream.o $(LIBDIR)/Rngs.o

# implicit rules
$(LIBDIR)/%.o : $(SOURCEDIR)/%.cpp
	$(COMPILER) $(FLAGS) -I$(INCLUDEDIR) -c -o $@ $<

%.o : %.cpp
	$(COMPILER) $(FLAGS) -I$(INCLUDEDIR) -c -o $@ $<

all: $(NU)

$(NU): $(NU).o $(LIBOBJS)
	$(COMPILER) -g -o $(NU) $(NU).o $(LIBOBJS)

clean:
	rm $(NU) *.o *~ $(LIBDIR)/*.o $(SOURCEDIR)/*~
