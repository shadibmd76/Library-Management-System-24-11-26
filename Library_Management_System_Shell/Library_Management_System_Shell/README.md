# Library Management System (Unix Shell / Bash)

## Files
- `library.sh`  : main shell script (pura project ata)
- `books.txt`   : book data file (BookID|Title|Author|Status)
- `run.sh`      : script chalanor easy way
- `Project_Report.docx` : project report (paper format)

## Kivabe run korben (Linux / Unix terminal)
    chmod +x run.sh
    ./run.sh
othoba shorashori:
    bash library.sh

(books.txt ar library.sh same folder e thakte hobe)

## Code ta kivabe kaj kore (basic bujhar jonno)

| Code | Mane |
|------|------|
| `FILE="books.txt"` | data file er nam ekta variable e rakha |
| `read -p "text" var` | user er input nei, `var` e rakhi |
| `echo "..."` | screen e print kori |
| `while [ "$choice" != "0" ]` | 0 na dewa porjonto menu bar bar cholbe |
| `case $choice in ... esac` | choice onujayi function call kore (C++ er switch er moto) |
| `function_name() { ... }` | function banano |
| `cat "$FILE"` | puro file ta dekhay (View Books) |
| `grep "^$sid|" "$FILE"` | jei line ID diye shuru hoy sheta khuje (Search) |
| `${line##*|}` | line er shesh `|` er pore ja ache (Status) ta ber kore |
| `sed -i "/^101|/s/Available$/Issued/" books.txt` | 101 ID er line e Available ke Issued kore dey |
| `>> "$FILE"` | file er sheshe notun line jog kore (Add Book) |
| `[ -z "$x" ]` | `$x` khali kina check kore |

## C++ vs Shell
| C++ | Shell |
|-----|-------|
| `cin >>` | `read` |
| `cout <<` | `echo` |
| `switch` | `case` |
| `ofstream (ios::app)` | `>>` |
| temp.txt diye line update | `sed -i` diye direct update |
| compile korte hoy | compile lage na |
