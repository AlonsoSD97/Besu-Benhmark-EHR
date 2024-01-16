json_file="path/to/json/file.json"
keys_folder="besu/keys/keys"

for folder in "$keys_folder"/node-*; do
    public_key=$(cat "$folder/key.pub")
    jq --argjson key "$public_key" '.nodes += [$key]' "$json_file" > "$json_file.tmp" && mv "$json_file.tmp" "$json_file"
done
