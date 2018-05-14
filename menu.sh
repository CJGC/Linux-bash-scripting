#!/bin/bash

declare -A books
declare -A articles
author_name=""
document_name=""
document=""

function print1 {
  author_name=""
  document_name=""
  while [ "${#author_name}" == 0 ] || [ "${#document_name}" == 0 ]
  do
    clear
    echo "============= "$1" ============="
    echo "Do not put empty entries"
    echo
    echo $2
    read author_name
    echo $3
    read document_name
  done
  document=$4
}

function print2 {
  document_name=""
  while [ "${#document_name}" == 0 ]
  do
    clear
    echo "============= "$1" ============="
    echo "Do not put empty entries"
    echo
    echo $2
    read document_name
  done
  document=$3
}

function print3 {
  clear
  echo $1
  echo
  document=$2
}

function print4 {
  author_name=""
  while [ "${#author_name}" == 0 ]
  do
    clear
    echo "============= "$1" ============="
    echo "Do not put empty entries"
    echo
    echo $2
    read author_name
  done
}

while true
do
  clear
  echo "=========================================="
  echo "1) Add book."
  echo "2) Del book."
  echo "3) Add article."
  echo "4) Del article."
  echo "5) Search a book."
  echo "6) Search an article."
  echo "7) Classify books by author."
  echo "8) Classify articles by author."
  echo "9) Print book list."
  echo "10) Print article list."
  echo "11) Delete author (books)."
  echo "12) Delete author (articles)."
  echo "13) Exit"
  echo "=========================================="
  echo
  echo "Give an option: "
  read opt

  case $opt in
    1)print1 "Add a book" "Author name = " "Book name = " "book"
      . ./add.sh;;
    2)print2 "Del a book" "Book name = " "book"
      . ./remove.sh;;
    3)print1 "Add an article" "Author name = " "Article name = " "article"
      . ./add.sh;;
    4)print2 "Del an article" "Article name = " "article"
      . ./remove.sh;;
    5)print2 "Search a book" "Book name = " "book"
      . ./search.sh;;
    6)print2 "Search an article" "Article name = " "article"
      . ./search.sh;;
    7)print3 "Classify books by author" "book"
      . ./classify.sh;;
    8)print3 "Classify articles by author" "article"
      . ./classify.sh;;
    9)print3 "Print book list" "book"
      . ./list.sh;;
    10)print3 "Print article list" "article"
      . ./list.sh;;
    11)print4 "Delete author (books)" "Author name"
      unset books["$author_name"];;
    12)print4 "Delete author (articles)" "Author name"
      unset articles["$author_name"];;
    13)kill $$;;
    *)echo "Invalid opt was entered!"
  esac

  echo "Press enter..."
  read stop

done
