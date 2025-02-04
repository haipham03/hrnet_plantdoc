#!/bin/bash

# Source directory containing the dataset
SOURCE_DIR="/data/hpc/phh/HRNet-Image-Classification/PlantDoc-Dataset/train"

# Create target directories for healthy and unhealthy leaves
mkdir -p /data/hpc/phh/HRNet-Image-Classification/PlantDoc-Dataset/binary_train/healthy
mkdir -p /data/hpc/phh/HRNet-Image-Classification/PlantDoc-Dataset/binary_train/unhealthy

# List of healthy subfolders
healthy_folders=("Apple leaf" "Blueberry leaf" "Cherry leaf" "Grape leaf" "Peach leaf" "Raspberry leaf" "Soyabean leaf" "Strawberry leaf" "Tomato leaf")

# List of unhealthy subfolders
unhealthy_folders=("Apple rust leaf" "Apple Scab Leaf" "Bell_pepper leaf spot" "Corn Gray leaf spot" "Corn leaf blight" "Corn rust leaf" "grape leaf black rot" "Potato leaf early blight" "Potato leaf late blight" "Squash Powdery mildew leaf" "Tomato Early blight leaf" "Tomato leaf bacterial spot" "Tomato leaf late blight" "Tomato leaf mosaic virus" "Tomato leaf yellow virus" "Tomato mold leaf" "Tomato Septoria leaf spot" "Tomato two spotted spider mites leaf")

# Copy files from healthy subfolders
for folder in "${healthy_folders[@]}"; do
    if [ -d "$SOURCE_DIR/$folder" ]; then
        find "$SOURCE_DIR/$folder" -type f -exec cp {} /data/hpc/phh/HRNet-Image-Classification/PlantDoc-Dataset/binary_train/healthy \;
        echo "Copied files from $folder to healthy/"
    else
        echo "Folder $folder does not exist in $SOURCE_DIR"
    fi
done

# Copy files from unhealthy subfolders
for folder in "${unhealthy_folders[@]}"; do
    if [ -d "$SOURCE_DIR/$folder" ]; then
        find "$SOURCE_DIR/$folder" -type f -exec cp {} /data/hpc/phh/HRNet-Image-Classification/PlantDoc-Dataset/binary_train/unhealthy \;
        echo "Copied files from $folder to unhealthy/"
    else
        echo "Folder $folder does not exist in $SOURCE_DIR"
    fi
done

echo "Finished copying files."