import pybuild as build
import matplotlib.pyplot as plt
import numpy as np

plt.ion()

nx = ny = 128
dx = 1./nx
x1 = (np.arange(nx)+0.5)*dx
x, y = np.meshgrid(x1, x1)

dtype = "f4"
u = np.zeros((ny, nx+1), dtype=dtype)
v = np.zeros((ny+1, nx), dtype=dtype)
h = np.zeros((ny, nx), dtype=dtype)

set_state = build.import_from_library("libproj1.so", "set_state")
get_state = build.import_from_library("libproj1.so", "get_state")
rk3 = build.import_from_library("libproj1.so", "rk3")

h[:] = 1
args = build.ptr((u, v, h))
set_state(*args)

h[:] = 0
get_state(*args)
print(h)

d2 = (x-0.2)**2+(y-0.5)**2
sigma = 0.05
h[:] = np.exp(-d2/(2*sigma**2))
set_state(*args)

dt = np.float32(4e-3)
dt_ = build.ptr(dt)
for kt in range(100):
    rk3(dt_)

    if kt % 3 == 0:
        get_state(*args)
        plt.clf()
        plt.imshow(h)
        plt.colorbar()
        plt.pause(1e-6)
        
