import streamlit
from src.repository import phrase_repository
from src.library import audio_recorder
from src.library import speech_recognizer


def create():
    if not phrase_repository.is_registered():
        return

    form = streamlit.form("transfer")

    form.title("Pix")
    form.subheader("Tranferencia de R$100,00.00")

    form.write("Para autorizar transferencias de alto valor é preciso informar sua palavra secreta.")

    if form.form_submit_button("Iniciar gravação"):
        if record_audio():
            form.success("Transferencia realizada com sucesso", icon="✅")
        else:
            form.error("Transação rejeitada, sua palavra secreta não foi reconhecida", icon="🚫")


def record_audio():
    with streamlit.spinner('Gravando audio'):
        file_path = "./res/recorded_audio.wav"

        record = audio_recorder.record_audio()
        audio_recorder.save_record(file_path, record)

        text = speech_recognizer.to_text(file_path)

        return phrase_repository.is_valid(text)
