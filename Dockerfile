# Usar imagen oficial de Go actualizada
FROM golang:1.23-bullseye

# Evitar prompts
ENV DEBIAN_FRONTEND=noninteractive

# Instalar Python y dependencias mínimas del sistema
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    curl \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Configurar directorio de trabajo
WORKDIR /app

# Copiar requirements e instalar dependencias Python
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Configurar Go environment
ENV GOPATH=/root/go
ENV PATH=$PATH:/root/go/bin
ENV GOTOOLCHAIN=auto

# Instalar herramientas de reconocimiento (según documentación oficial)
RUN go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
RUN go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest  
RUN go install -v github.com/projectdiscovery/katana/cmd/katana@latest
RUN go install github.com/tomnomnom/waybackurls@latest
RUN go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest

# Copiar archivos de la aplicación
COPY . .

# Convertir terminaciones de línea de Windows a Unix y hacer scripts ejecutables
RUN apt-get update && apt-get install -y dos2unix && \
    dos2unix auto_recon.sh && \
    chmod +x auto_recon.sh && \
    apt-get remove -y dos2unix && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

# Crear directorio para resultados
RUN mkdir -p /app/results

# Exponer puerto
EXPOSE 5000

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:5000/ || exit 1

# Ejecutar servidor Flask
CMD ["python3", "server.py"]
