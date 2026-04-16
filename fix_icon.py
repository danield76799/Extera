from PIL import Image
import os

# Input image - Daan's preferred logo
input_path = r"C:\Users\Administrator\.openclaw\media\inbound\file_182---c2146da8-8927-431f-bdc3-8ab4f181ed83.jpg"
output_dir = r"C:\extera-temp\android\app\src\main\res"

# Target size for adaptive icon (high quality)
target_size = 1024

img = Image.open(input_path)
print(f"Original size: {img.size}, mode: {img.mode}")

# Convert to RGBA if needed (this is critical!)
if img.mode != 'RGBA':
    img = img.convert('RGBA')

# Resize maintaining aspect ratio
img.thumbnail((target_size, target_size), Image.Resampling.LANCZOS)

# Create 1024x1024 canvas and paste centered
new_img = Image.new('RGBA', (target_size, target_size), (0, 0, 0, 0))
x = (target_size - img.width) // 2
y = (target_size - img.height) // 2
new_img.paste(img, (x, y))

# Save as proper PNG (NOT a renamed JPEG!)
adaptive_path = os.path.join(output_dir, "mipmap-anydpi-v26", "ic_launcher.png")
new_img.save(adaptive_path, "PNG", optimize=True)
print(f"Created adaptive icon: {adaptive_path} ({target_size}x{target_size})")

# Also create smaller sizes for legacy devices
sizes = {
    "mipmap-mdpi": 48,
    "mipmap-hdpi": 72,
    "mipmap-xhdpi": 96,
    "mipmap-xxhdpi": 144,
    "mipmap-xxxhdpi": 192,
}

for folder, size in sizes.items():
    folder_path = os.path.join(output_dir, folder)
    os.makedirs(folder_path, exist_ok=True)
    
    # Create small icon
    small_img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    img_copy = img.copy()
    padding = max(4, size // 12)  # Add some padding
    img_copy.thumbnail((size - padding * 2, size - padding * 2), Image.Resampling.LANCZOS)
    x = (size - img_copy.width) // 2
    y = (size - img_copy.height) // 2
    small_img.paste(img_copy, (x, y))
    
    output_path = os.path.join(folder_path, "ic_launcher.png")
    small_img.save(output_path, "PNG", optimize=True)
    print(f"Created {output_path} ({size}x{size})")

# Web favicon - also proper PNG
web_path = r"C:\extera-temp\web\favicon.png"
new_img.save(web_path, "PNG", optimize=True)
print(f"Created web favicon")

assets_path = r"C:\extera-temp\assets\favicon.png"
new_img.save(assets_path, "PNG", optimize=True)
print(f"Created assets favicon")

print("All icons created as proper PNG files!")
