# Install COCOTB ver 2.0 : https://docs.cocotb.org/en/stable/install.html

# Security
set -e #Exit immediately if a command exists with a non-zero status

# Directory
echo "Always run this script from the root of the project"
ROOT_DIR=$(pwd)
SCRIPT_DIR="$ROOT_DIR/docs/install_tools" #Path to modify based on env creation

#Check if updates and upgrades are done
sudo apt update
sudo apt upgrade

# GHDL, GTKWave install
sudo apt-get install ghdl gtkwave

# COCOTB prerequisites
sudo apt-get install make python3 python3-pip libpython3-dev
bash ${TOOLS_DIR}setup_python_venv.sh # cocotb version added in requirements.txt
