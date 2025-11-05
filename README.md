# 🎯 AutoRecon - Interfaz Web

<div align="center">

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Python](https://img.shields.io/badge/python-3.8+-blue.svg)
![Flask](https://img.shields.io/badge/flask-3.0.0-green.svg)

**Interfaz web moderna y elegante para reconocimiento automatizado de Bug Bounty**

[Características](#-características) • [Instalación](#-instalación) • [Uso](#-uso) • [Herramientas](#-herramientas-requeridas)

</div>

---

## 📋 Descripción

AutoRecon es una herramienta de reconocimiento automatizado con una interfaz web intuitiva y moderna, diseñada para facilitar el proceso de enumeración de subdominios, detección de hosts vivos, extracción de archivos JavaScript y escaneo de vulnerabilidades en programas de Bug Bounty.

## ✨ Características

- **🎨 Interfaz Moderna**: Diseño oscuro con animaciones y efectos visuales
- **📊 Seguimiento en Tiempo Real**: Observa el progreso de cada fase del escaneo
- **📝 Logs en Vivo**: Visualiza la salida del script en tiempo real
- **📈 Dashboard Interactivo**: Tarjetas expandibles con estadísticas detalladas
- **🔍 Búsqueda Integrada**: Filtra resultados directamente en la interfaz
- **💾 Exportación de Datos**: Copia o descarga los resultados fácilmente
- **📱 Responsive**: Funciona perfectamente en cualquier dispositivo

## 🚀 Instalación

### Prerrequisitos

Primero, instala las herramientas de reconocimiento necesarias:

```bash
# Instalar Go (si no lo tienes)
# Luego instalar las herramientas:

go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install -v github.com/projectdiscovery/katana/cmd/katana@latest
go install github.com/tomnomnom/waybackurls@latest
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest

# Asegúrate de que ~/go/bin esté en tu PATH
export PATH=$PATH:~/go/bin
```

### Clonar el Repositorio

```bash
git clone https://github.com/Suikon1/AutoReconBasic.git
cd AutoReconBasic
```

### Instalar Dependencias Python

```bash
pip install -r requirements.txt
```

### Hacer el Script Ejecutable

```bash
chmod +x auto_recon.sh
```

## 💻 Uso

### Iniciar el Servidor

```bash
python3 server.py
```

El servidor se iniciará en `http://localhost:5000`

### Realizar un Escaneo

1. Abre tu navegador y ve a `http://localhost:5000`
2. Ingresa el dominio objetivo (ej: `example.com`)
3. Haz clic en "Start Reconnaissance"
4. Observa el progreso en tiempo real
5. Haz clic en cualquier tarjeta de resultado para ver los detalles

### Funcionalidades del Modal

Cuando el escaneo termine, puedes hacer clic en cualquier tarjeta para:
- Ver la lista completa de resultados
- Buscar elementos específicos en tiempo real
- Copiar todos los datos al portapapeles
- Descargar los resultados como archivo `.txt`

## 🔧 Herramientas Requeridas

AutoRecon utiliza las siguientes herramientas de reconocimiento:

| Herramienta | Propósito |
|------------|-----------|
| **subfinder** | Enumeración de subdominios |
| **httpx** | Detección de hosts vivos y probing HTTP |
| **katana** | Crawling web y extracción de JavaScript |
| **waybackurls** | Obtención de URLs históricas de Wayback Machine |
| **nuclei** | Escaneo de vulnerabilidades |

## 📁 Estructura del Proyecto

```
AutoRecon/
├── auto_recon.sh       # Script bash de reconocimiento
├── server.py           # Backend Flask
├── index.html          # Interfaz web
├── style.css           # Estilos
├── script.js           # Lógica frontend
├── requirements.txt    # Dependencias Python
├── .gitignore          # Archivos ignorados por Git
├── LICENSE             # Licencia MIT
└── README.md           # Este archivo
```

## 🔍 Fases del Reconocimiento

El script automatiza 6 fases principales:

1. **Enumeración de Subdominios**: Descubre subdominios usando subfinder
2. **Detección de Hosts Vivos**: Prueba qué hosts están activos con httpx
3. **Extracción de JavaScript**: Encuentra archivos JS mediante katana
4. **Wayback Machine**: Obtiene URLs históricas
5. **Escaneo de Vulnerabilidades**: Detecta takeovers, exposures y CVEs con nuclei
6. **Generación de Reportes**: Crea un reporte detallado en Markdown

## 📊 Resultados

Los resultados se guardan en un directorio con el formato:
```
dominio_recon_YYYYMMDD_HHMMSS/
├── subdomains/          # Subdominios encontrados
├── alive/               # Hosts vivos
├── js/                  # Archivos JavaScript
├── endpoints/           # URLs y endpoints
├── vulnerabilities/     # Vulnerabilidades encontradas
└── reports/             # Reportes en Markdown
```

## ⚙️ API Endpoints

El servidor Flask proporciona los siguientes endpoints:

| Endpoint | Método | Descripción |
|----------|--------|-------------|
| `/api/start` | POST | Inicia un nuevo escaneo |
| `/api/status/<job_id>` | GET | Obtiene el estado de un escaneo |
| `/api/details/<job_id>/<type>` | GET | Obtiene datos detallados |
| `/api/report/<job_id>` | GET | Descarga el reporte completo |
| `/api/jobs` | GET | Lista todos los trabajos |

## 🛡️ Consideraciones de Seguridad

> **⚠️ IMPORTANTE**: Esta herramienta está diseñada exclusivamente para pruebas de seguridad autorizadas y programas de Bug Bounty.

- Asegúrate siempre de tener permiso explícito antes de escanear cualquier dominio
- El uso no autorizado puede ser ilegal en tu jurisdicción
- Respeta los términos de servicio de los programas de Bug Bounty

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Si encuentras un bug o tienes una sugerencia, por favor abre un issue.

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo [LICENSE](LICENSE) para más detalles.

## 🙏 Agradecimientos

- [ProjectDiscovery](https://github.com/projectdiscovery) por sus increíbles herramientas
- [TomNomNom](https://github.com/tomnomnom) por waybackurls
- Comunidad de Bug Bounty por la inspiración

---

<div align="center">

**Hecho con ❤️ para la comunidad de Bug Bounty**

</div>
