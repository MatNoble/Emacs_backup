#==================================================
#==>     Title:                                     
#==>     Author: Zhang zhen                   
#==>     Email: hustmatnoble.gmail.com                  
#==================================================
# ==== Official libraries
from dolfin import *
import matplotlib.pyplot as plt
import numpy as np
import time
# ==== Custom module
import postprocess
import importlib as imp
imp.reload(postprocess)
from postprocess import *

# ===== define solver
solver = PETScKrylovSolver("gmres", 'ilu') 
solver.parameters["absolute_tolerance"] = 1E-12
solver.parameters["relative_tolerance"] = 1E-12
solver.parameters["maximum_iterations"] = 10**6
solver.parameters["nonzero_initial_guess"] = True

# ===== time start
start = time.clock()



# ===== time end
elapsed = (time.clock() - start)
print("Time used:", round(elapsed, 2), "s")

# ===== Visualization
# plt.figure(num = 1, dpi = 150)
# c = plot(u, cmap='jet')
# plt.colorbar(c)
# plt.savefig('images/u.eps',  dpi=1000, bbox_inches='tight')

filetitle = 'error_.txt'
f = open(filetitle,'w')
save_data(nx_list, u1_errorl2, filetitle) 
f.close()

plt.show()
