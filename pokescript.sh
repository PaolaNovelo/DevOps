#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Por favor, proporciona el nombre de un Pokemon como argumento."
  exit 1
fi

pokemon_name=$1

# Consultar la PokeApi y parsear el resultado con jq
api_url="https://pokeapi.co/api/v2/pokemon/$pokemon_name"
json_result=$(curl -s "$api_url" | jq '.')

# Obtener los datos específicos usando jq
id=$(echo "$json_result" | jq -r '.id')
name=$(echo "$json_result" | jq -r '.name')
weight=$(echo "$json_result" | jq -r '.weight')
height=$(echo "$json_result" | jq -r '.height')
order=$(echo "$json_result" | jq -r '.order')

# Imprimir los resultados formateados
echo "$name (No. $id)"
echo "Id = $id"
echo "Weight = $weight"
echo "Height = $height"
echo "Order = $order"
