# Imagen base ligera de Python
FROM python:3.12-slim

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiamos primero requirements para aprovechar el cache de capas de Docker
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiamos el resto del código
COPY . .

# Puerto en el que corre la app (Render inyecta la variable PORT)
EXPOSE 5000

# gunicorn como servidor de producción (más robusto que el servidor de desarrollo de Flask)
CMD gunicorn --bind 0.0.0.0:${PORT:-5000} app:app
