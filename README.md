# AutoRecon - Automated Bug Bounty Reconnaissance

Interfaz web moderna para reconocimiento automatizado con herramientas de Bug Bounty.

## 🚀 Inicio Rápido con Docker

### Prerrequisitos
- Docker
- Docker Compose

### Ejecutar
```bash
docker-compose up -d
```

### Acceder
```
http://localhost:5000
```

### Detener
```bash
docker-compose down
```

### Ver logs
```bash
docker-compose logs -f
```

## �� Herramientas Incluidas

- **subfinder** - Enumeración de subdominios
- **httpx** - Detección de hosts vivos  
- **katana** - Crawling web y extracción de JS
- **waybackurls** - URLs históricas
- **nuclei** - Escaneo de vulnerabilidades

## 📊 Funcionalidades

- Enumeración de subdominios
- Detección de hosts vivos
- Extracción de archivos JavaScript
- Obtención de URLs históricas
- Escaneo de vulnerabilidades
- Interfaz web en tiempo real
- Resultados descargables

## 📁 Resultados

Los resultados se guardan en `./results/`

## ⚠️ Advertencia

Solo para pruebas autorizadas y programas de Bug Bounty. El uso no autorizado puede ser ilegal.

## 📄 Licencia

MIT License
