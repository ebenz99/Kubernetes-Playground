import random
import numpy as np
import os
import sys

def main():
	#cdir = os.getcwd()
	#ext = str(sys.argv[1])		
	#ndir = cdir + "/op/"+ext
	#os.makedirs(ndir,exist_ok=True)
	mylist = [random.randint(0,20) for i in range(0,100)]
	np.save("nums.npy",np.asarray(mylist))

if __name__ == "__main__":
	main()
