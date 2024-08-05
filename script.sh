#!/bin/bash

# Створити директорію для бекапів, якщо її немає
mkdir -p ./linux_p2/backup

# Отримати поточну дату в форматі YYYY-MM-DD
current_date=$(date +%F)

# Перебрати всі файли в ./linux_p2
for file in ./linux_p2/*.txt; do
  # Вивести назву файлу
  echo "Archiving $file"
  
  # Отримати базову назву файлу
  base_name=$(basename "$file")
  
  # Архівувати файл у форматі file_name_current_date.tar.gz
  tar -czf ./linux_p2/backup/"${base_name}_${current_date}.tar.gz" "$file"
done