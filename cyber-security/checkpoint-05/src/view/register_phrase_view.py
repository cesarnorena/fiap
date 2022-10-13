import streamlit
from src.repository import phrase_repository
from src.library import speech_recognition
from src.library import audio_recorder


def create():
    form = streamlit.form("phrase")

    form.title("Cadastrar palavra secreta")

    form.write("Para nós identificar sua identidade em futuras transações, "
               "é necessário gravar uma palavra secreta que só você conheçe.")

    form.write("Sua palvra secreta é:")

    form.subheader(phrase_repository.get())

    if form.form_submit_button("Iniciar gravação"):
        if record_audio():
            phrase_repository.register()
            form.success(f"Sua palavra secreta fue cadastrada com sucesso", icon="✅")
        else:
            form.error("Sua palavra secreta não bate com a gravação", icon="🚫")


def record_audio() -> bool:
    with streamlit.spinner('Gravando audio'):
        file_path = "./res/recorded_audio.wav"

    record = audio_recorder.record_audio()
    audio_recorder.save_record(file_path, record)

    text = speech_recognition.to_text(file_path)

    return phrase_repository.is_valid(text)
