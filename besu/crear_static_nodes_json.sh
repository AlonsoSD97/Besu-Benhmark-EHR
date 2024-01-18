json_file="file.json"
keys_folder="/home/alonso.salas/Besu-Benhmark-EHR/besu/keys/keys"
n=4
enodes=()

for ((i=1; i<n; i++)); do
    folder="$keys_folder/node-$i"
    public_key=$(cat "$folder/key.pub")
    enode="\"enode://$public_key@10.0.64.$(($i+1)):3030\""
    enodes+=("$enode")
done

# Create json_file if it does not exist
if [ ! -f "$json_file" ]; then
    touch "$json_file"
fi

# Add enodes to the JSON file
enodes_str=$(IFS=,; echo "${enodes[*]}")
echo "[$enodes_str]" > "$json_file"