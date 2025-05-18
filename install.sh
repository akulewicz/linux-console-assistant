#!/bin/bash

echo "Aktualizuję listę pakietów..."
apt-get update -qq > /dev/null

echo "Instaluję python3 i virtualenv..."
apt-get install -y python3 python3-venv > /dev/null

echo "Tworzę katalog aplikacji..."
mkdir -p /opt/chat
mv * .* /opt/chat 2>/dev/null
cd /opt/chat

read -p "Podaj OPENAI API KEY: " api_key
echo "OPENAI_API_KEY=$api_key" > .env

echo "Tworzę środowisko wirtualne..."
python3 -m venv venv > /dev/null

echo "Instaluję zależności..."
/opt/chat/venv/bin/pip install --upgrade pip
/opt/chat/venv/bin/pip install -r requirements.txt > /dev/null

echo "Tworzę skrót do uruchomienia aplikacji..."
cat << 'EOF' > /usr/local/bin/chat
#!/bin/bash
/opt/chat/venv/bin/python /opt/chat/main.py "$@"
EOF

chmod +x /usr/local/bin/chat

echo ""
echo "✅ Console Linux Assistant został pomyślnie zainstalowany."
echo "🔧 Uruchom go poleceniem: chat"