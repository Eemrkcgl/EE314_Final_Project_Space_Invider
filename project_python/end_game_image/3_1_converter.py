def convert_3s_to_1s(file_path):
    with open(file_path, 'r') as file:
        content = file.read()
    converted_content = content.replace('3', '1')
    with open(file_path, 'w') as file:
        file.write(converted_content)

convert_3s_to_1s(r"C:\Users\eemrk\OneDrive\Masaüstü\Project_python\game_over_skull.txt")
