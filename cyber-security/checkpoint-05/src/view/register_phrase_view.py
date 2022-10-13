import time

import streamlit
from src.repository import phrase_repository
from src.library import speech_recognizer
from src.library import audio_recorder


def create():
    if phrase_repository.is_registered():
        return

    cleaner = streamlit.empty()
    form = cleaner.form("phrase")

    form.title("Cadastrar palavra secreta")

    form.write("Para nós identificar sua identidade em futuras transações, "
               "é necessário gravar uma palavra secreta que só você conheçe.")

    form.write("Sua palvra secreta é:")

    form.subheader(phrase_repository.get())

    if form.form_submit_button("Iniciar gravação"):
        with streamlit.spinner('Gravando audio'):
            if record_audio():
                phrase_repository.register()
                form.success(f"Sua palavra secreta fue cadastrada com sucesso", icon="✅")
                time.sleep(1.5)
                cleaner.empty()
            else:
                form.error("Sua palavra secreta não bate com a gravação", icon="🚫")


def record_audio() -> bool:
    file_path = "./res/recorded_audio.wav"

    record = audio_recorder.record_audio()
    audio_recorder.save_record(file_path, record)

    text = speech_recognizer.to_text(file_path)

    return phrase_repository.is_valid(text)
