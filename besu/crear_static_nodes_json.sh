json_file="static-nodes.json"
keys_folder="/home/alonso.salas/Besu-Benhmark-EHR/besu/keys/keys"
n=4
enodes=()

for ((i=1; i<=n; i++)); do
    folder="$keys_folder/node-$i"
    public_key=$(cat "$folder/key.pub" | sed 's/0x//') # se leen las claves y se remueve el 0x del inicio
    enode="\"enode://$public_key@10.0.64.$(($i+1)):30303\"" # se crea el enode con el formato 'enode://<node_id>@<ip>:<listening_port>[?discport=<discovery_port>]'
    enodes+=("$enode") # se agrega el enode al array
done

# Create json_file if it does not exist
if [ ! -f "$json_file" ]; then
    touch "$json_file"
fi

# Add enodes to the JSON file
enodes_str=$(IFS=,; echo "${enodes[*]}")
echo "[$enodes_str]" > "$json_file"