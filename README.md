1-A) El tiempo es variable, a veces puede variar por unos milisegundos más o menos. Sin embargo, el primero siempre llega en los primeros 5 segundos y el segundo en los primeros 4. Es predecible luego de varias ejecuciones
B) Luego de comparar el tiempo de ejecución mio y de un compañero, son distintos.
C) En realidad, no hubo ningún cambio significativo al ejecutarlo, ya sea con o sin comentarios; el tiempo se mantiene en el rango de 0.006 a 0.009 segundos.

2-A)
```
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#define NUMBER_OF_THREADS 2
#define CANTIDAD_INICIAL_HAMBURGUESAS 20

int cantidad_restante_hamburguesas = CANTIDAD_INICIAL_HAMBURGUESAS;
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

void *comer_hamburguesa(void *tid)
{
    while (1)
    { 
        pthread_mutex_lock(&mutex);
        if (cantidad_restante_hamburguesas > 0)
        {
            printf("Hola! soy el hilo (comensal) %d, me voy a comer una hamburguesa! Todavía quedan %d\n", (int)(intptr_t)tid, cantidad_restante_hamburguesas);
            cantidad_restante_hamburguesas--;
        }
        else
        {
            printf("¡SE TERMINARON LAS HAMBURGUESAS! :( \n");
            pthread_mutex_unlock(&mutex);
            pthread_exit(NULL);
        }
        pthread_mutex_unlock(&mutex);
    }
}

int main(int argc, char *argv[])
{
    pthread_t threads[NUMBER_OF_THREADS];
    int status, i, ret;
    for (i = 0; i < NUMBER_OF_THREADS; i++)
    {
        status = pthread_create(&threads[i], NULL, comer_hamburguesa, (void *)(intptr_t)i);
        if (status != 0)
        {
            printf("Algo salió mal al crear el hilo. Recibí el código de error %d\n", status);
            exit(-1);
        }
    }

    for (i = 0; i < NUMBER_OF_THREADS; i++)
    {
        void *retval;
        ret = pthread_join(threads[i], &retval);
        if (ret != 0)
        {
            printf("Error al esperar la terminación del hilo %d\n", i);
            exit(-1);
        }
    }
    pthread_exit(NULL);
}
```

B) ![image](https://github.com/gonzalopezb/-ASO2024TPs/assets/166421698/e87d3de2-988c-4e31-9a5b-6197d88bc9ff)
