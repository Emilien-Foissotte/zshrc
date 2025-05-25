# needs duckdb installed
# brew install duckdb
function csv_to_parquet() {
    file_path="$1"
    duckdb -c "copy (select * from read_csv_auto('$file_path')) to '${file_path%.*}.parquet' (format parquet);"
}

function parquet_to_csv() {
    file_path="$1"
    duckdb -c "copy (select * from '$file_path') to '${file_path%.*}.csv' (header, format 'csv');"
}
