#!/bin/bash
# 📌 Challenge: Bash File Manager Script
# Creates files, sorts them by size, and moves those containing "Victory"

# Step 1: Create main directory
mkdir -p Arena_Boss

# Step 2: Create 5 text files with random line counts (10–20)
for i in {1..5}
do
    FILE="Arena_Boss/file$i.txt"
    LINES=$((RANDOM % 11 + 10))  # generates 10–20 lines
    echo "Creating $FILE with $LINES lines..."
    for j in $(seq 1 $LINES)
    do
        echo "This is line $j" >> "$FILE"
    done
done

# Step 3: Display files sorted by size
echo ""
echo "📊 Files sorted by size:"
find Arena_Boss -type f -exec ls -lh {} + | sort -k 5,5 -h

# Step 4: Create archive directory and move files containing 'Victory'
mkdir -p Victory_Archive
for FILE in Arena_Boss/*.txt
do
    if grep -q "Victory" "$FILE"; then
        mv "$FILE" Victory_Archive/
        echo "✅ $FILE contains 'Victory' and was moved to Victory_Archive/"
    fi
done

echo ""
echo "🎯 Script completed!"
