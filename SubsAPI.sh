if [ ! -f "ngrok-v3-stable-linux-amd64.tgz" ]; then
  wget -q -O ngrok-v3-stable-linux-amd64.tgz https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
fi
sudo tar -C /usr/local/bin -xzf ngrok-v3-stable-linux-amd64.tgz
if [ ! -f "latinaapi" ] || [ $(md5sum latinaapi | awk '{print $1}') != $(curl -fsSL https://raw.githubusercontent.com/JeelsBoobz/SubsAPI/main/latinaapi.sum) ]; then
  wget -O latinaapi https://raw.githubusercontent.com/JeelsBoobz/SubsAPI/main/latinaapi
fi
chmod +x latinaapi
if [ ! -f "public/index.html" ] || [ $(md5sum SubsAPI_docs.zip | awk '{print $1}') != $(curl -fsSL https://raw.githubusercontent.com/JeelsBoobz/SubsAPI/main/SubsAPI_docs.sum) ]; then
  wget -O SubsAPI_docs.zip https://raw.githubusercontent.com/JeelsBoobz/SubsAPI/main/SubsAPI_docs.zip
  unzip -o SubsAPI_docs.zip
fi
export BOT_TOKEN="BOT_TOKEN_TELEGRAM"
export CHAT_ID="-1234567890"
export SAMPLE_TOPIC_ID="12345"
export ADMIN_ID="1234567890"
export BANNER_URL="https://i.ibb.co/xHKVh83/Banner.png"
export DB_URL="postgres://USER:PASSWORD@HOST:5432/postgres"
sudo pkill -f latinaapi
nohup ./latinaapi >/dev/null 2>&1 &
sudo pkill -f ngrok
ngrok config add-authtoken NGROK_TOKEN
nohup ngrok http --domain=NGROK_DOMAIN 8080 >/dev/null 2>&1 &
echo "Finish"
