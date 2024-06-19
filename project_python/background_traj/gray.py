import os
from PIL import Image


def image_to_rgb_hex(image_path, output_path):
    if not os.path.exists(output_path):
        os.makedirs(output_path)
    image_files = [f for f in os.listdir(image_path) if f.lower().endswith((".png", ".jpg", ".jpeg"))]
    for each in image_files:
        
        with Image.open(os.path.join(image_path,each)) as img:
            img = img.convert("RGB")
            
            width,height =img.size
            
            with open(os.path.join(output_path,each[:-4]+'.txt'), 'w') as f:
                
                for y in range(height):
                    for x in range(width):
                        
                        r, g, b = img.getpixel((x, y))
                        
                        if r<100 and g<100 and b<100:
                            f.write('0')
                            f.write('\n')
                        else:
                            f.write('1')
                            f.write('\n')
                            
path = r'C:\Users\eemrk\OneDrive\Masaüstü\background_traj'
image_to_rgb_hex(path,
                 os.path.join(path,'converteds'))
