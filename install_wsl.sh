#!/bin/bash

# Verificar permisos de root
if [ "$EUID" -ne 0 ]; then
  echo "Por favor, ejecuta este script como root o con sudo."
  exit 1
fi

echo "=== Inicio del proceso de configuración para WSL ==="

# Actualizar el sistema
echo ">>> Actualizando la lista de paquetes..."
sudo apt update -y && sudo apt upgrade -y

# Instalar paquetes esenciales
echo ">>> Instalando paquetes esenciales..."
sudo apt install -y zsh curl wget zip unzip git ssh tree gcc g++ make fzf sqlite3

# Configuración del idioma (UTF-8)
echo ">>> Configurando idioma es_US.UTF-8..."
sudo sed -i 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
sudo sed -i 's/# es_US.UTF-8 UTF-8/es_US.UTF-8 UTF-8/' /etc/locale.gen
echo 'LANG=es_US.UTF-8' | sudo tee /etc/default/locale
sudo locale-gen

# Configuración del shell Zsh
echo ">>> Configurando Zsh como shell predeterminado..."
sudo apt install -y zsh
chsh -s $(which zsh)


# Limpiar paquetes innecesarios
echo ">>> Limpiando paquetes y caché innecesarios..."
sudo apt autoremove -y && sudo apt autoclean -y

# Finalización
echo "=== Configuración inicial para WSL completada ==="
echo "Reinicia la terminal para aplicar los cambios."

