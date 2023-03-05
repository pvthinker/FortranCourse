import os
import glob
import multiprocessing

"""There is a LOT of compilation options

Do 'man gfortran' or 'man gcc' to see them all.

Here are a few for the "gfortran" compiler. Some of them are described
only in the 'man gcc' compiler but they work with gfortran, as gfortran is
build on top of gcc.

-o : output file name

-g : debug

-O1, -O2, -O3 : level of optimization (O3 = fastest)

-c : generate a binary object (not an executable) that has to be "linked"

-Wall : print all warning messages

-cpp : apply C Pre-Processing before compilation

-freal-4-real-8 -Ofast : convert all "REAL" to "REAL*8" (double precision)

-march=x86-64 -mtune=native : use constructor optimized instructions
 (SIMD=Single Instruction Multiple Data)

Notice that there are other Fortran compilers, e.g.'ifort' the Intel compiler. All of these options exist but potentially with another name, e.g. '-freal-4-real-8' is '-r8'.

"""

FC = "gfortran"
FFLAGS = "-Wall -cpp"


def compile(fortran_file):
    EXEC = fortran_file[:-4]
    command = f"{FC} {FFLAGS} {fortran_file} -o {EXEC}"
    os.system(command)
    print(command)

def is_executable(file):
    return os.path.isfile(file) and os.access(file, os.X_OK)

def is_backup(file):
    return os.path.isfile(file) and (file[-1]=="~")

def is_library(file):
    return os.path.isfile(file) and (file[-3]==".so")

def clean():
    """ Remove executables and library
    """
    files = glob.glob("*")
    toberemoved = [file
                   for file in files
                   if is_executable(file)
                   or is_backup(file)
                   or is_library(file)]

    for file in toberemoved:
        os.remove(file)

def compile_all(parallel_compilation):
    fortran_files = glob.glob("*.f90")

    if parallel_compilation:
        nthreads = 4

        with multiprocessing.Pool(nthreads) as pool:
            pool.map(compile, fortran_files)

    else:
        for fortran_file in fortran_files:
            compile(fortran_file)

if __name__ == "__main__":
    """ Very frequently people use 'make' and 'Makefile' to compile a
    code.

    Here, I propose an alternative in Python. If the modules are
    independant and can be compiled independently of each
    other. Bonus: the compilation can be parallelized!

    """
    import sys

    parallel_compilation = True

    if len(sys.argv) == 1:
        compile_all(parallel_compilation)

    elif len(sys.argv) == 2:
        if sys.argv[1] == "clean":
            print("clean local directory")
            clean()
