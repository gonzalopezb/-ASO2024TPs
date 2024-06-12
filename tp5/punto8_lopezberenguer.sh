#!/bin/bash

read -p "Ingresa un nombre para estimar su edad probable: " name

response=$(curl -s "https://api.agify.io/?name=$name")

age=$(echo $response | jq -r '.age')

if [ "$age" != "null" ]; then
    echo "El nombre '$name' tiene una edad probable de $age años."
else
    echo "No se pudo determinar la edad probable del nombre '$name'."
fi