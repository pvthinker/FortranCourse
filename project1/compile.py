import os
import glob
import multiprocessing

FC = "gfortran"
FFLAGS = "-O3 -march=native"
LIBFLAGS = "-fPIC -shared"


def is_executable(file):
    return os.path.isfile(file) and os.access(file, os.X_OK)


def is_backup(file):
    return os.path.isfile(file) and (file[-1] == "~")


def has_suffix(file, suffixes):
    return file.split(".")[-1] in suffixes


def clean():
    """ Remove executables, backup, objects etc
    """
    files = glob.glob("*")
    suffixes = ["o", "so", "mod"]
    toberemoved = [entry
                   for entry in files
                   if is_executable(entry)
                   or is_backup(entry)
                   or has_suffix(entry, suffixes)]

    for file in toberemoved:
        os.remove(file)


def compile(fortran_files, EXEC="a.out"):
    files = " ".join(fortran_files)
    command = f"{FC} {FFLAGS} {files} -o {EXEC}"
    os.system(command)
    print(command)


def compile_library(fortran_files, LIB, how="oneperone"):
    if how == "allatonce":
        compile_allatonce(fortran_files, LIB)

    else:
        compile_intwostages(fortran_files, LIB)


def compile_intwostages(fortran_files, LIB):
    compile_each_file(fortran_files)
    objs = get_objs(fortran_files)
    link(objs, LIB)


def get_objs(fortran_files):
    return {src: ".".join(src.split(".")[:-1]+["o"])
            for src in fortran_files}

def compile_each_file(fortran_files):
    objs = get_objs(fortran_files)
    for src, obj in objs.items():
        command = f"{FC} {FFLAGS} {LIBFLAGS} -c {src} -o {obj}"
        os.system(command)
        print(command)


def link(objs, LIB):
    files = " ".join(objs.values())
    command = f"{FC} {LIBFLAGS} {files} -o {LIB}"
    os.system(command)
    print(command)


def compile_allatonce(fortran_files, LIB):
    files = " ".join(fortran_files)
    command = f"{FC} {FFLAGS} {LIBFLAGS} {files} -o {LIB}"
    os.system(command)
    print(command)

def compile_main(mainfile, srcs):
    objs = get_objs(srcs)
    files = " ".join(objs.values())
    main = ".".join(mainfile.split(".")[:-1])
    command = f"{FC} {FFLAGS} {files}  -o {main}" 
    os.system(command)
    print(command)
   
    
if __name__ == "__main__":

    import sys

    srcs = ["constants.f90", "variables.f90",
            "operators.f90",  "integrator.f90",
            "main.f90"]

    if len(sys.argv) == 1:
        compile_library(srcs, "libproj1.so", how="")
        compile_main("main.f90", srcs)

    elif len(sys.argv) == 2:
        if sys.argv[1] == "clean":
            print("clean local directory")
            clean()
