import os
import tkinter as tk
from tkinter import messagebox
import pygame

N_audios = 3
results = []

class App:
    def __init__(self, root):
        self.root = root
        self.root.title("Audio Sample Interface")
        self.root.geometry("600x400")
        self.root.configure(bg="lightgrey")
        self.aux = 0
        self.root.attributes('-topmost', True)
        pygame.mixer.init()  # Initialize the mixer module
        self.init_intro_screen()

    def init_intro_screen(self):
        self.clear_frame()
        intro_label = tk.Label(self.root, text=("Welcome to the Psychoacoustics interface! \n"
                                                "Here we will assess the background noise level threshold for intelligibility, "
                                                "a scenario similar to the cocktail party effect. \n"
                                                "In the following screens you will be hearing a set of speech recordings in which "
                                                "the background noise will be progressively increasing. \n"
                                                "If you understand what was spoken, please transcribe it in the proper field. "
                                                "If the sentence is not comprehensible, leave it blank or just write x. \n"
                                                "Feel free to play the audio as many times as you want. \n"
                                                "If you understand part of the sentence, please transcribe just the parts which "
                                                "you understood in order (even if altogether it does not make sense). \n"
                                                "Good Luck, Enjoy!"),
                                 font=('Helvetica', 16), fg="black", bg="white")
        intro_label.pack(pady=10)
        start_button = tk.Button(self.root, text="Start", command=self.init_audio_screen, fg="white", bg="black")
        start_button.pack(pady=20)
        self.root.update()

    def init_audio_screen(self):
        self.clear_frame()
        self.aux += 1
        play_button = tk.Button(self.root, text="Play Audio", command=self.play_audio, fg="black", bg="white")
        play_button.pack(pady=10)
        self.text_input = tk.Entry(self.root, width=50, fg="black", bg="white")
        self.text_input.pack(pady=10)
        submit_button = tk.Button(self.root, text="Next", command=self.submit_text, fg="black", bg="white")
        submit_button.pack(pady=10)

    def init_final_screen(self):
        self.clear_frame()
        self.root.update_idletasks()
        with open('result.txt', 'w') as file:
            for sentence in results:
                file.write(sentence + "\n")
        final_label = tk.Label(self.root, text="Thank you for answering the survey! Please find your answers saved as .txt file",
                               font=('Helvetica', 16), fg="black", bg="white")
        final_label.pack(pady=20)
        finish_button = tk.Button(self.root, text="Finish", command=self.root.destroy, fg="black", bg="white")
        finish_button.pack(pady=10)

    def play_audio(self):
        try:
            audio_file = f"combined_main_{self.aux}.wav"
            if os.path.exists(audio_file):
                pygame.mixer.music.load(audio_file)
                pygame.mixer.music.play()
            else:
                messagebox.showerror("File Not Found", f"Audio file {audio_file} does not exist.")
        except Exception as e:
            messagebox.showerror("Error", f"An error occurred while playing audio: {e}")
        self.root.update_idletasks()

    def submit_text(self):
        text = self.text_input.get()
        results.append(text)
        messagebox.showinfo("Submitted Text", f"You entered: {text}")
        if self.aux < N_audios:
            self.init_audio_screen()
        else:
            self.init_final_screen()

    def clear_frame(self):
        for widget in self.root.winfo_children():
            widget.pack_forget()
            widget.destroy()

if __name__ == "__main__":
    root = tk.Tk()
    app = App(root)
    root.mainloop()
