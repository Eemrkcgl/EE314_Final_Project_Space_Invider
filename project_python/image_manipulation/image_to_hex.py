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
            
            img = img.resize((48,48))
            width,height =img.size

            # Create a file to write the hexadecimal values
            with open(os.path.join(output_path,each[:-4]+'txt'), 'w') as f:
                # Loop through each pixel
                for y in range(height):
                    for x in range(width):
                        r, g, b = img.getpixel((x, y))
                        r, g, b = int(r/4),int(g/4),int(b/4)
                        
                        # Convert RGB values to hexadecimal strings
                        r_hex = f'{r:02X}'
                        g_hex = f'{g:02X}'
                        b_hex = f'{b:02X}'
                        
                        # Write the hexadecimal values to the file
                        f.write(f'{r_hex}{g_hex}{b_hex}\n')

                        
                

# Example usage
image_to_rgb_hex('images_to_be_converted',
                 'converteds')
