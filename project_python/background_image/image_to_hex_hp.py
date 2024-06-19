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
                        
                        if r==18 and g==23 and b==61:
                            f.write('000')
                            f.write('\n')
                        elif r==18 and g==23 and b==53:
                            f.write('001')
                            f.write('\n')
                        elif r==22 and g==23 and b==65:
                            f.write('010')
                            f.write('\n')
                        elif r==18 and g==23 and b==63:
                            f.write('011')
                            f.write('\n')
                        elif r==16 and g==23 and b==59:
                            f.write('100')
                            f.write('\n')
                        elif (r==11 and g==13 and b==40) or (r==1 and g==1 and b==12):
                            f.write('101')
                            f.write('\n')
                        elif r==77 and g==52 and b==110:
                            f.write('110')
                            f.write('\n')
                        elif r==255 and g==255 and b==255:
                            f.write('111')
                            f.write('\n')
                            
path = r'C:\Users\eemrk\OneDrive\Masaüstü\background'
image_to_rgb_hex(path,
                 os.path.join(path,'converteds'))
