import os
from PIL import Image


def image_to_rgb_hex(image_path, output_path):
    if not os.path.exists(output_path):
        os.makedirs(output_path)
    image_files = [f for f in os.listdir(image_path) if f.lower().endswith((".png", ".jpg", ".jpeg"))]
    # Open the image
    for each in image_files:
        
        with Image.open(os.path.join(image_path,each)) as img:
            # Ensure the image is in RGB mode
            img = img.convert("RGB")
            
            width,height =img.size
            
            with open(os.path.join(output_path,each[:-4]+'.txt'), 'w') as f:
                
                for y in range(height):
                    for x in range(width):
                        
                        r, g, b = img.getpixel((x, y))
                        
                        if r==0 and g==0 and b==0:
                            f.write('11')
                            f.write('\n')
                        elif r==82 and g==60 and b==15:
                            f.write('00')
                            f.write('\n')
                        elif r==255 and g==0 and b==0:
                            f.write('01')
                            f.write('\n')
                        else:
                            f.write('10')
                            f.write('\n')
                            
path = r'C:\Users\eemrk\OneDrive\Masaüstü\bullet'
image_to_rgb_hex(path,
                 os.path.join(path,'converteds'))
