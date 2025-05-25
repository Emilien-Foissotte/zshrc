# needs pandoc and csv2md installed
#  brew install pandoc
#  uvx install csv2md
function ftmd() {
    # get the last downloaded csv file
    file_path=$(ls -t ~/Downloads/*.csv | head -n 1)
    # ask for confirmation (Y/n)
    read "REPLY?Convert $file_path to markdown? (Y/n)"
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      # convert
      pandoc -f csv -t markdown "$file_path" -o "${file_path%.*}.md"
      echo "CSV file converted to markdown"
    else
      echo "Conversion aborted"
    fi
    csv2md "$file_path" | pbcopy
    # remove file if asked
    read "REPLY?Remove $file_path? (Y/n)"
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      rm "$file_path"
      echo "CSV file removed"
    fi
    echo "Markdown content copied to clipboard in GitHub Flavored Markdown format"
}
