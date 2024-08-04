#!/bin/bash

# Файл логів
LOG_FILE=~/linux_p2/log/backup.log
ERR_LOG_FILE=~/linux_p2/log/err_backup.log

# Запис початку роботи скрипта
echo "Starting backup process at $(date)" >> "$LOG_FILE"

# Створити директорії для бекапів та старих бекапів, якщо їх немає
mkdir -p ~/linux_p2/backup
mkdir -p ~/linux_p2/old_backup

# Отримати поточну дату в форматі YYYY-MM-DD
current_date=$(date +%F)

# Перебрати всі файли в ~/linux_p2
for file in ~/linux_p2/*.txt; do
  # Вивести назву файлу в лог
  echo "Archiving $file" >> "$LOG_FILE"

  # Отримати базову назву файлу
  base_name=$(basename "$file")

  # Архівувати файл у форматі file_name_current_date.tar.gz
  tar -czf ~/linux_p2/backup/"${base_name}_${current_date}.tar.gz" "$file" >> "$LOG_FILE" 2>> "$ERR_LOG_FILE"
done

# Перемістити файли старші за 3 хвилини в old_backup
find ~/linux_p2/backup -type f -mmin +3 -exec mv {} ~/linux_p2/old_backup/ \; >> "$LOG_FILE" 2>> "$ERR_LOG_FILE"

# Запис завершення роботи скрипта
echo "Backup process completed at $(date)" >> "$LOG_FILE"