json_file="file.json"
keys_folder="/home/alonso.salas/Besu-Benhmark-EHR/besu/keys/keys"
n=4
enodes=()

# Create json_file if it does not exist
if [ ! -f "$json_file" ]; then
    echo '{"nodes": []}' > "$json_file"
fi

for ((i=1; i<n; i++)); do
    folder="$keys_folder/node-$i"
    public_key=$(cat "$folder/key.pub")
    enode="enode://$public_key@10.0.64.$(($i+1)):3030"
    enodes+=("$enode")
done

tmp_file="$json_file.tmp"
cp "$json_file" "$tmp_file"

# Add enodes to the JSON file
enodes_str=$(IFS=,; echo "${enodes[*]}")
sed -i "s#\"nodes\": \[\]#\"nodes\": [$enodes_str]#" "$tmp_file"

# Replace the original JSON file with the updated one
mv "$tmp_file" "$json_file"