# Setup Python Virtual Environment

# Security
set -e #Exit immediately if a command exists with a non-zero status

#
echo "Always run this script from the root of the project"
ROOT_DIR=$(pwd)
SCRIPT_DIR="$ROOT_DIR/docs/install_tools"
REQUIREMENTS_FILE="$SCRIPT_DIR/requirements.txt"    

#Check if updates and upgrades are done
sudo apt update
sudo apt upgrade

#Check if python3 is installed
if ! command -v python3 &> /dev/null; then
    echo "python3 is not installed. python3 is required."
    read -p "Do you want to install python3 ? [y/N]" confirm
    if [["$confirm" =~ ^[Yy]$]]; then
        sudo apt install python3
    else
        echo "python3 was not installed. Stop installation process."
        exit l
    fi
fi

#Check if pip is installed
if ! command -v pip &> /dev/null; then
    echo "pip is not installed. pip is required."
    read -p "Do you want to install pip ? [y/N]" confirm
    if [["$confirm" =~ ^[Yy]$]]; then
        sudo apt install python3-pip
    else
        echo "pip was not installed. Stop installation process."
        exit l
    fi
fi

#Check if requirements file exists
if [ ! -f "REQUIREMENTS_FILE"]; then
    echo "Requirements file not found at $REQUIREMENTS_FILE"
    deactivate
    exit l
fi

setup_python_venv() {
    #Check if the virtual environment exists
    if [-d ".venv"]; then
        echo "Virtual environment already exists. Activating ..."
    else
        echo "Creating a virtual environment ..."
        python3 -m venv .venv
    fi

    #Activating the virtual environment
    echo "Activating the virtual environment ..."
    source "$ROOT_DIR"/.venv/activate

    #Installing required packages
    echo "Installing required python packages"
    pip install --upgrade pip
    pip install -r "$REQUIREMENTS_FILE"

    #Cleaning
    echo "Cleaning up ..."
    pip cache purge

    #Print related informations
    echo "Dependencies installed succesfully."
    echo "Python path : $(which python)"
    echo "Python version : $(python --version)"
    echo "Pip path : $(wich pip)"
    echo "Pip version : $(pip --version)"
}

setup_python_venv