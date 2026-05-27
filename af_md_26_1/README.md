## Como resolver os exercícios?

Para as questões de SQL, resolva no Workbench e depois cole a query no notebook.

Rode o Docker para resolver as questões de Spark.

Para macOS e linux, utilize:

```bash
docker run \
    -it \
    --rm \
    -p 8888:8888 \
    -p 4040:4040 \
    -v "`pwd`":/home/jovyan/work \
    jupyter/pyspark-notebook
```

Se estiver no Windows estes comandos, utilize:

- No Powershell: `docker run -it --rm -p 8888:8888 -p 4040:4040 -v ${PWD}:/home/jovyan/work jupyter/pyspark-notebook`

- No Prompt de comando: `docker run -it --rm -p 8888:8888 -p 4040:4040 -v %cd%:/home/jovyan/work jupyter/pyspark-notebook`

Agora abra esse notebook lá na URL do Jupyter Lab!