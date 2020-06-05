
KOS_CFLAGS += -DDREAMCAST -DALPNG_ZLIB=1 -O3 -ffast-math -Wall -Wno-unused -DALLEGRO_DC -Isrc -Isrc/inflate -Isrc/quantization -Isrc/wrappers

TARGET = libalpng_13.a

OBJS = \
	./src/alpng_save.o \
	./src/alpng_interlacing.o \
	./src/alpng_filereader.o \
	./src/alpng_drawer.o \
	./src/alpng_common.o \
	./src/alpng_filters.o \
	./src/quantization/octree.o \
	./src/inflate/huffman.o \
	./src/inflate/inflate.o \
	./src/inflate/input.o \
	./src/wrappers/original_zlib.o


include $(KOS_BASE)/addons/Makefile.prefab
