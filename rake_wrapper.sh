# Wrapper for linux systems
# Basic system requirements
# 1. Ruby
# 2. Git (should be installed in order to clone this repo)

if [ "$(uname)" != "Linux" ]; then
  rake
fi

PACKAGE_MANAGER=""
if [ "$(command -v apt-get)" != "" ]; then
  PACKAGE_MANAGER="apt-get"
elif [ "$(command -v yum)" != ""]; then
  PACKAGE_MANAGER="yum"
else
  echo "I'm lost. I don't know which package manager to install. Weird linux distro."
fi

sudo gem install rake
sudo gem install os

