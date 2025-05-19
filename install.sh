#!/bin/bash

echo "Aktualizuję listę pakietów..."
apt-get update -qq > /dev/null

if ! command -v python3 &> /dev/null; then
    echo "🔧 Instaluję python3..."
    apt-get install -y python3 > /dev/null
else
    echo "✅ python3 już zainstalowany."
fi

if ! dpkg -s python3-venv &> /dev/null; then
    echo "🔧 Instaluję python3-venv..."
    apt-get install -y python3-venv > /dev/null
else
    echo "✅ python3-venv już zainstalowany."
fi

echo "🔧 Tworzę katalog aplikacji..."
mkdir -p /opt/chat
cp -r . /opt/chat
cd /opt/chat

read -p "🔑 Podaj OPENAI API KEY: " API_KEY
echo "OPENAI_API_KEY=$API_KEY" > /opt/chat/.env
chmod 600 /opt/chat/.env

echo "🔧 Tworzę środowisko wirtualne..."
python3 -m venv venv > /dev/null

echo "🔧 Instaluję zależności..."
/opt/chat/venv/bin/pip install --upgrade pip
/opt/chat/venv/bin/pip install -r requirements.txt > /dev/null

echo "🔧 Tworzę skrót do uruchomienia aplikacji..."
cat << 'EOF' > /usr/local/bin/chat
#!/bin/bash
/opt/chat/venv/bin/python /opt/chat/main.py "$@"
EOF

chmod +x /usr/local/bin/chat

echo ""
echo "✅ Console Linux Assistant został pomyślnie zainstalowany."
echo "🔧 Uruchom go poleceniem: chat"