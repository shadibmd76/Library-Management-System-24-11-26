#!/bin/bash
# =====================================================
# Library Management System - Unix Shell Version
# Data file format:  BookID|Title|Author|Status
# =====================================================

FILE="books.txt"

# ---------- 1. Add Book ----------
add_book() {
    echo
    read -p "Enter book ID: " id
    read -p "Enter book title: " title
    read -p "Enter author name: " author

    echo "$id|$title|$author|Available" >> "$FILE"
    echo "Book added successfully!"
}

# ---------- 2. View Books ----------
view_books() {
    if [ ! -s "$FILE" ]; then
        echo
        echo "No book data found yet."
        return
    fi
    echo
    echo "----- BOOK LIST -----"
    cat "$FILE"
}

# ---------- 3. Search Book ----------
search_book() {
    echo
    read -p "Enter book ID to search: " sid

    if [ ! -f "$FILE" ]; then
        echo "No book data found."
        return
    fi

    # grep: line er suru te "ID|" ache kina dekhe
    result=$(grep "^$sid|" "$FILE")

    if [ -n "$result" ]; then
        echo
        echo "Book found:"
        echo "$result"
    else
        echo "Book not found."
    fi
}

# ---------- 4. Issue Book ----------
issue_book() {
    echo
    read -p "Enter book ID to issue: " sid

    if [ ! -f "$FILE" ]; then
        echo "No book data found."
        return
    fi

    line=$(grep "^$sid|" "$FILE")

    if [ -z "$line" ]; then
        echo "Book not found."
        return
    fi

    # status = last field (| diye alada kore)
    status=${line##*|}

    if [ "$status" = "Available" ]; then
        # sed: oi ID er line e Available ke Issued kore dey
        sed -i "/^$sid|/s/Available$/Issued/" "$FILE"
    else
        echo "This book is already issued."
    fi
    echo "Issue operation completed. Check the book status."
}

# ---------- 5. Return Book ----------
return_book() {
    echo
    read -p "Enter book ID to return: " sid

    if [ ! -f "$FILE" ]; then
        echo "No book data found."
        return
    fi

    line=$(grep "^$sid|" "$FILE")

    if [ -z "$line" ]; then
        echo "Book not found."
        return
    fi

    status=${line##*|}

    if [ "$status" = "Issued" ]; then
        sed -i "/^$sid|/s/Issued$/Available/" "$FILE"
    else
        echo "This book was not issued."
    fi
    echo "Return operation completed. Check the book status."
}

# ---------- Main Menu ----------
choice=-1
while [ "$choice" != "0" ]; do
    echo
    echo "===== LIBRARY MANAGEMENT SYSTEM ====="
    echo "1. Add Book"
    echo "2. View All Books"
    echo "3. Search Book"
    echo "4. Issue Book"
    echo "5. Return Book"
    echo "0. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1) add_book ;;
        2) view_books ;;
        3) search_book ;;
        4) issue_book ;;
        5) return_book ;;
        0) echo "Thank you for using the system!" ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
done
