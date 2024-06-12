1-A) El tiempo es variable, a veces puede variar por unos milisegundos más o menos. Sin embargo, el primero siempre llega en los primeros 5 segundos y el segundo en los primeros 4. Es predecible luego de varias ejecuciones

B) Luego de comparar el tiempo de ejecución mio y de un compañero, son distintos.

C) Descomentar las líneas en el script suma_resta.py añadió funcionalidad sin introducir problemas de concurrencia en este contexto específico y sin afectar significativamente el tiempo de ejecución. Sin embargo, este ejercicio ilustra la importancia de comprender y manejar las zonas críticas y el race condition en programas concurrentes para asegurar resultados consistentes y correctos.

2-A)
```
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#define NUMBER_OF_THREADS 2
#define CANTIDAD_INICIAL_HAMBURGUESAS 20
int cantidad_restante_hamburguesas = CANTIDAD_INICIAL_HAMBURGUESAS;
int turno = 0;

void comer_hamburguesa(voidtid)
{
    while (1 == 1)
    { 
        while (turno != (int) tid);
        // INICIO DE LA ZONA CRÍTICA
        if (cantidad_restante_hamburguesas > 0)
        {
            printf("Hola! soy el hilo(comensal) %d , me voy a comer una hamburguesa ! ya que todavia queda/n %d \n", (int) tid, cantidad_restante_hamburguesas);
            cantidad_restante_hamburguesas--; // me como una hamburguesa
        }
        else
        {
            printf("SE TERMINARON LAS HAMBURGUESAS \n");
        turno = (turno + 1) % NUMBER_OF_THREADS;
            pthread_exit(NULL); // forzar terminacion del hilo
        }
        // SALIDA DE LA ZONA CRÍTICA
turno = (turno + 1) % NUMBER_OF_THREADS;
    }
}

int main(int argc, char argv[])
{
    pthread_t threads[NUMBER_OF_THREADS];
    int status, i, ret;
    for (int i = 0; i < NUMBER_OF_THREADS; i++)
    {
        printf("Hola!, soy el hilo principal. Estoy creando el hilo %d \n", i);
        status = pthread_create(&threads[i], NULL, comer_hamburguesa, (void)i);
        if (status != 0)
        {
            printf("Algo salio mal, al crear el hilo recibi el codigo de error %d \n", status);
            exit(-1);
        }
    }

    for (i = 0; i < NUMBER_OF_THREADS; i++)
    {
        void *retval;
        ret = pthread_join(threads[i], &retval); // espero por la terminacion de los hilos que cree
    }
    pthread_exit(NULL); // como los hilos que cree ya terminaron de ejecutarse, termino yo tambien.
}
```

B)![anvorguesas](https://github.com/gonzalopezb/-ASO2024TPs/assets/166421698/5b4a5048-2f6b-4216-b946-0693342aae90)



