# 🐧 Linux Console Assistant

Asystent do pracy z konsolą Linuksa oparty na OpenAI API. Możesz zadawać pytania w stylu:

- `jak zrestartować usługę nginx?`
- `jak stworzyć użytkownika z uprawnieniami sudo?`
- `jak sprawdzić wykorzystanie pamięci RAM?`
- `jak usunąć plik?`

## ✨ Funkcje

- Integracja z API OpenAI
- Obsługa kolorów w terminalu
- Historia rozmowy w kontekście
- Gotowy skrót `chat` do szybkiego uruchamiania

## 🛠️ Wymagania

- Linux z `bash`
- Python 3 i `python3-venv`
- Klucz API z [platform.openai.com](https://platform.openai.com/account/api-keys)

## 📦 Instalacja

1. Sklonuj repozytorium:
   ```bash
   git clone https://github.com/akulewicz/linux-console-assistant.git
   cd linux-console-assistant
   ```

2. Uczyń skrypt instalacyjny wykonywalnym:
   ```bash
   chmod +x install.sh
   ```

3. Uruchom instalację jako `root` (lub przez `sudo`):
   ```bash
   sudo ./install.sh
   ```

4. Podczas instalacji podaj swój OpenAI API Key, gdy zostaniesz o to poproszony.

## 🚀 Uruchamianie

Po zakończeniu instalacji możesz uruchomić aplikację w terminalu komendą:
```bash
chat
```

Aby zakończyć rozmowę, wpisz `exit`.

## 🔐 Bezpieczeństwo

- Twój klucz API jest zapisywany lokalnie w pliku `.env`
- Skrót `chat` dostępny jest globalnie w systemie (`/usr/local/bin/chat`)
- Program nie udostępnia API publicznie i działa tylko lokalnie

