#!/bin/bash

# Image Optimization Script for Sunbreak Running
# Optimizes images and converts to WebP format with JPEG fallbacks

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== Sunbreak Running Image Optimization ===${NC}"

# Directories
SOURCE_DIR="images"
BACKUP_DIR="images-original"
OUTPUT_DIR="images-optimized"

# Create backup if it doesn't exist
if [ ! -d "$BACKUP_DIR" ]; then
    echo -e "${YELLOW}Creating backup of original images...${NC}"
    cp -r "$SOURCE_DIR" "$BACKUP_DIR"
    echo -e "${GREEN}✓ Backup created at $BACKUP_DIR${NC}"
else
    echo -e "${YELLOW}! Backup already exists at $BACKUP_DIR${NC}"
fi

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Function to optimize and convert an image
optimize_image() {
    local input_file="$1"
    local filename=$(basename "$input_file")
    local name="${filename%.*}"
    local ext="${filename##*.}"
    
    echo -e "${YELLOW}Processing: $filename${NC}"
    
    # Determine max width based on filename
    local max_width=1920
    if [[ "$filename" == *"testimonial"* ]] || [[ "$filename" == *"caroline"* ]] || [[ "$filename" == *"joel"* ]] || [[ "$filename" == *"julien"* ]]; then
        max_width=1200
    elif [[ "$filename" == "bg.jpg" ]]; then
        max_width=1920
    elif [[ "$filename" == pic* ]]; then
        max_width=800
    fi
    
    # Convert PNG to JPG first if needed for JPEG fallback
    local jpeg_source="$input_file"
    if [ "$ext" = "png" ]; then
        echo "  Converting PNG to JPEG..."
        magick "$input_file" -quality 90 -resize "${max_width}x>" "${OUTPUT_DIR}/${name}.jpg"
        jpeg_source="${OUTPUT_DIR}/${name}.jpg"
    else
        # Optimize JPEG
        echo "  Optimizing JPEG..."
        magick "$input_file" -strip -quality 85 -resize "${max_width}x>" "${OUTPUT_DIR}/${name}.jpg"
    fi
    
    # Create WebP version
    echo "  Creating WebP version..."
    cwebp -q 85 -resize "$max_width" 0 "$input_file" -o "${OUTPUT_DIR}/${name}.webp" 2>/dev/null || {
        # Fallback: use converted JPEG as source for WebP
        cwebp -q 85 "${OUTPUT_DIR}/${name}.jpg" -o "${OUTPUT_DIR}/${name}.webp"
    }
    
    # Show file size comparison
    local original_size=$(ls -lh "$input_file" | awk '{print $5}')
    local jpeg_size=$(ls -lh "${OUTPUT_DIR}/${name}.jpg" | awk '{print $5}')
    local webp_size=$(ls -lh "${OUTPUT_DIR}/${name}.webp" | awk '{print $5}')
    
    echo -e "  ${GREEN}✓${NC} Original: $original_size → JPEG: $jpeg_size, WebP: $webp_size"
}

# Process all images
echo -e "\n${GREEN}Processing images...${NC}\n"

# Priority images (largest files first)
priority_images=(
    "$SOURCE_DIR/joel-running.jpg"
    "$SOURCE_DIR/img-4.jpg"
    "$SOURCE_DIR/img-3.jpg"
    "$SOURCE_DIR/img-2.jpg"
    "$SOURCE_DIR/img-1.png"
    "$SOURCE_DIR/caroline-running.jpg"
    "$SOURCE_DIR/julien-running.jpg"
    "$SOURCE_DIR/julien-running-new.jpg"
    "$SOURCE_DIR/bg.jpg"
)

for img in "${priority_images[@]}"; do
    if [ -f "$img" ]; then
        optimize_image "$img"
    fi
done

# Process remaining images
for img in "$SOURCE_DIR"/*.{jpg,jpeg,png}; do
    if [ -f "$img" ]; then
        filename=$(basename "$img")
        # Skip if already processed
        if [ ! -f "${OUTPUT_DIR}/${filename%.*}.webp" ]; then
            optimize_image "$img"
        fi
    fi
done

# Copy overlay.png as-is (it's already small)
if [ -f "$SOURCE_DIR/overlay.png" ]; then
    cp "$SOURCE_DIR/overlay.png" "$OUTPUT_DIR/overlay.png"
    echo -e "${GREEN}✓ Copied overlay.png (already optimized)${NC}"
fi

# Summary
echo -e "\n${GREEN}=== Optimization Complete! ===${NC}"
echo -e "\nDirectory sizes:"
original_size=$(du -sh "$SOURCE_DIR" | cut -f1)
optimized_size=$(du -sh "$OUTPUT_DIR" | cut -f1)
echo -e "  Original: ${RED}$original_size${NC}"
echo -e "  Optimized: ${GREEN}$optimized_size${NC}"

echo -e "\n${YELLOW}Next steps:${NC}"
echo "1. Review optimized images in $OUTPUT_DIR"
echo "2. Update index.html to use optimized images"
echo "3. Replace images directory: mv images images-old && mv images-optimized images"

exit 0
