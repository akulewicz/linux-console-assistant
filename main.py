import sys
import openai
from openai import OpenAI
from dotenv import load_dotenv
from colorama import init, Fore, Style, Back

load_dotenv()

init(autoreset=True)


class LinuxConsoleAssistant:
    def __init__(self):
        self.client = OpenAI()
        self.chat_history = [
            {
                "role": "system",
                "content": "Jesteś pomocnym asystentem i mistrzem linuksa, którego zadaniem jest wspomaganie w pracy z konsolą linuksową. Nie używaj ``` w odpowiedziach, po prostu podawaj tekst. Rozmawiaj tylko o tematch informatycznych.",
            }
        ]

    def send_message(self, user_input):
        self.chat_history.append({"role": "user", "content": user_input})

        try:
            response = self.client.responses.create(
                model="gpt-4.1-nano", input=self.chat_history
            )
        except openai.APIError as e:
            print(f"OpenAI API zwróciło błąd: {e}")
            sys.exit()
        except Exception as e:
            print(f"Wystąpił nieoczekiwany błąd: {e}")
            sys.exit()

        self.chat_history.append({"role": "assistant", "content": response.output_text})

        return response.output_text


def main():
    assistant = LinuxConsoleAssistant()
    print(Back.GREEN + "Aby zakończyć rozmowę wpisz 'exit'" + Style.RESET_ALL)
    while True:
        user_input = input(Fore.CYAN + "USER: ")
        if user_input.lower() in ["exit", "quit"]:
            break
        output = assistant.send_message(user_input)
        print(Style.RESET_ALL + f"CHAT: {output}")


if __name__ == "__main__":
    main()
