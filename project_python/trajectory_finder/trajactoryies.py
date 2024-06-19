import numpy as np
from math import ceil, degrees

center_x, center_y = 240, 240

radius_outer = 240
radius_inner = 50

num_trajectories = 16

path = r"C:\Users\eemrk\OneDrive\Masaüstü\coordinates"

angles = np.linspace(0,2*np.pi, num=num_trajectories, endpoint=False)

counter_values = [6,7,8,9,10,11,12,13,14,15,0,1,2,3,4,5]
counter = 0



for angle in angles:
    print(degrees(angle))
    x_outer = center_x + int(radius_outer * np.cos(angle))
    y_outer = center_y + int(radius_outer * np.sin(angle))
    x_inner = center_x + int(radius_inner * np.cos(angle))
    y_inner = center_y + int(radius_inner * np.sin(angle))
    

    x_values = np.linspace(x_outer, x_inner, num=190)
    y_values = np.linspace(y_outer, y_inner, num=190)

    trajectory = [(ceil(x), ceil(y)) for x, y in zip(x_values, y_values)]
    print(trajectory[0])
    print(counter_values[counter])
    print('\n')    
    with open(path+f'\\coordinates_{counter_values[counter]}.txt','w') as file:
        for each in trajectory:
            file.write(bin(each[0])[2:].zfill(9))
            file.write(bin(each[1])[2:].zfill(9))
            file.write('\n')
        
    counter += 1
