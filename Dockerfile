# Compramos la imagen de ubuntu
FROM ubuntu:latest

# Etiquetar (podemos etiquetar con el nombre que queramos)
LABEL project = "nuclio-flask-api"
LABEL version="1.0"

# Refrescamos las librerías, inicializamos el directorio
RUN apt update -y

# Instalamos Python
RUN apt install -y python3-pip

# Solicitamos copia desde donde esté el archivo Docker. En este caso todo y lo está copiando a una carpeta de Linux llamada /app.
COPY . /app

# Define /app como directorio de trabajo.
WORKDIR /app

# Ordenamos que inicialice con Python 3 y todos los requirements.
RUN pip3 install -r requirements.txt
ENTRYPOINT ["python3"]
CMD ["app.py"]