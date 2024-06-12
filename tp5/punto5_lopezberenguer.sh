#!/bin/bash

start_time=0
elapsed_time=0
is_running=false

function start_timer {
    start_time=$(date +%s)
    is_running=true
    echo "Cronómetro iniciado."
}

function stop_timer {
    if [ $is_running == true ]; then
        end_time=$(date +%s)
        elapsed_time=$((end_time - start_time))
        is_running=false
        echo "Cronómetro detenido. Tiempo transcurrido: $elapsed_time segundos."
    else
        echo "El cronómetro no está en funcionamiento."
    fi
}

function reset_timer {
    start_time=0
    elapsed_time=0
    is_running=false
    echo "Cronómetro reiniciado."
}

while true; do
    echo "Opciones:"
    echo "1. Iniciar"
    echo "2. Detener"
    echo "3. Reiniciar"
    echo "4. Salir"
    read -p "Elige una opción: " choice

    case $choice in
        1) start_timer ;;
        2) stop_timer ;;
        3) reset_timer ;;
        4) break ;;
        *) echo "Opción inválida";;
    esac
done