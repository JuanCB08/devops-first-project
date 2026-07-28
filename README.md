# Mi primer proyecto DevOps: CI/CD con Docker y Render

Proyecto de práctica que demuestra un flujo completo de DevOps:
código → pruebas automáticas → contenedor → despliegue continuo.

## Arquitectura

```
GitHub (push) → GitHub Actions (CI: tests + build) → Render (CD: build + deploy)
```

## Stack

- **Python 3.12 + Flask** — API mínima
- **Docker** — empaquetado de la aplicación
- **GitHub Actions** — integración continua (CI)
- **Render** — despliegue continuo (CD)

## Estructura

```
.
├── app.py                     # Aplicación Flask
├── test_app.py                # Pruebas automáticas
├── requirements.txt           # Dependencias
├── Dockerfile                 # Definición del contenedor
├── .github/workflows/ci.yml   # Pipeline de CI
└── README.md
```

## Cómo correr en local

```bash
pip install -r requirements.txt
python app.py
# abre http://localhost:5000
```

## Cómo correr con Docker

```bash
docker build -t devops-first-project .
docker run -p 5000:5000 devops-first-project
```

## Despliegue en Render

1. Sube este repo a GitHub.
2. En Render: **New +** → **Web Service** → conecta el repo.
3. Render detecta el `Dockerfile` automáticamente.
4. Click en **Deploy**.
5. Cada `git push` a `main` dispara un nuevo despliegue automático.

## Endpoints

| Ruta      | Descripción                    |
|-----------|---------------------------------|
| `/`       | Mensaje de bienvenida           |
| `/health` | Health check (estado del servicio) |
