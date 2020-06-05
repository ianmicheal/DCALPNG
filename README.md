# DCALPNG dreamcast addon port
AllegroPNG (alpng)
This library servers for displaying PNG images in programs using the Allegro multimedia library. It's completely standalone, it doesn't require libpng nor zlib (however it can use zlib if installed).

Note: If you have libpng installed you can try to use loadpng library instead of alpng. loadpng is faster and supports some additional features like gama. It also exists for longer time so it's more tested.

SourceForge project with download, Subversion repository etc. is available here.

Using alpng
First of all you have to #include <alpng.h>.
void alpng_init(void)
You don't have to call this function, however if you do it will register the PNG extension in the Allegro library so you will be able to use load_bitmap , save_bitmap and datafiles with PNG files.
BITMAP* load_png(const char* filename, RGB* pal)
Loads BITMAP from file. Returns NULL on error. See load_bitmap for details. Follows all Allegro conversion rules as described there, except that if file contains palette (PLTE chunk, not sPLT) it will be used when the load_bitmap documentation says that generate_optimized_palette will be used. Also, by default, this library doesn't use generate_optimized_palette at all, if the library needs to generate palette it will use its own octree quantization. You can however disable this during installation, see below.
BITMAP* load_png_pf(PACKFILE* f, RGB* pal)
Loads BITMAP from an already open packfile. Returns NULL on error.
int save_png(const char* filename, BITMAP* bmp, const RGB* pal)
Save BITMAP to the file. Returns zero on success, non-zero on error. See save_bitmap for details. Note that if the library is built in standalone mode, the saved PNG files will be uncompressed. See Supported additional libraries section for details about this. The generated files have always 8 bits per sample, palette BITMAPs are stored as palette PNGs, 32 bit BITMAPs with alpha are saved as RGBA, all the others are saved in RGB format.
int save_png_pf(PACKFILE* f, BITMAP* bmp, const RGB* pal)
Saves PNG to an already open packfile.
char* alpng_error_msg
If an error occurs, this variable will contain string with the error description.
PNG files in datafile
You can load PNG file into the datafile. Run Grabber, create new "Other" object, put "PNG" as a type and choose some name. Then Grab a PNG file into this object. In a program call alpng_init and after that load datafile. You can than access the BITMAP like any other image in the datafile:

BITMAP* b = (BITMAP*) datafile[OBJECT_NAME].dat;
List of tools for PNG optimization
This section lists tools which you can use to make your PNG files smaller. They are not related to AllegroPNG in any way, however I think such list can be useful for you.

Best PNG optimizer is probably Ken Silverman's PNGOUT. It's freeware, closed source primary for Windows however some ports for Linux and MacOSX exists. For Windows there is also GUI add-on called PNGGauntlet written using NET Framework 1.1. There is also commercial version with Windows GUI: PNGOUTWin. Also plugin for the IrfanView exists.

Pngrewrite optimizes palette PNGs.

Others are OptiPNG, Pngcrush and AdvPNG.

Supported additional libraries
If you want to improve speed of this library or want to use compression for saving you can optionally use some library which implements deflate de/compression. Currently supported are the original zlib library and Crypto++ library.

Benchmark suite
In the AllegroPNG Subversion repository is available small benchmark suite for comparing speed.

Generally is for loading the fastest version using original zlib, slowest standalone version. For saving is fastest the standalone version because it does not compress the file, otherwise zlib is faster than Crypto++. Note that on MinGW (gcc 3.4.2) is the Crypto++ for some reason extremely slow. The loadpng library is of course always the fastest.
Installation
MinGW
Open command line window, make sure that GCC is on the path (test it by typing gcc -v, it should display GCC version). If you have NET Framework 2.0 runtime installed, run configure.exe and select MinGW as a compiler, otherwise run on the command line

configure.bat mingw
Run configure.bat without parameters to see complete list of options.

Then run:

mingw32-make
and wait until the library and example are build.

Copy the libalpng.a to the lib directory of your MinGW installation and src\alpng.h to the include directory of your MinGW installation.

Don't forget to build your application with the -lalpng linker setting.

Note: For Dev-C++ and Code::Blocks there is always AllegroPNG devpak at devpaks.org.

DJGPP
Follow the MinGW instructions, only run make instead of mingw32-make.

MS Visual C++
Open command line window, make sure that Visual C++ is on the path (test it by typing cl, it should display Visual C++ version). If you have NET Framework 2.0 runtime installed, run configure.exe and select MS Visual C++ as a compiler, otherwise run on the command line

configure.bat msvc
Run configure.bat without parameters to see complete list of options.

Then run:

nmake
and wait until the library and example are build.

Copy the alpng.lib to the lib directory of your Visual C++ installation and src\alpng.h to the include directory of your Visual C++ installation.

Don't forget to link your application with the alpng.lib library.

Linux
Run:

make
and wait until the library and example are build. You can also type

./configure zlib
to build library which uses zlib or

./configure crypto++
to build library which uses Crypto++ or

./configure
to revert back to the standalone version.

Copy the libalpng.a to the lib directory of your system and src\alpng.h to the include directory of your system..

Don't forget to build your application with the -lalpng linker setting.

Common
If you want to disable internal octree quantization and use Allegro's generate_optimized_palette instead, just add -DALPNG_USE_ALLEGRO_QUANTIZATION to the CFLAGS environment variable before building the library.

Contact
Library written by Michal Molhanec.
Send email.

Personal homepage.
