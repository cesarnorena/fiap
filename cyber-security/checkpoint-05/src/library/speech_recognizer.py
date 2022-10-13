import speech_recognition
from speech_recognition import UnknownValueError


def to_text(file_path: str, lang: str = "pt", duration: int = 1) -> str | None:
    recognizer = speech_recognition.Recognizer()
    audio_source = speech_recognition.AudioFile(file_path)

    with audio_source:
        recognizer.adjust_for_ambient_noise(audio_source, duration=duration)
        audio_data = recognizer.record(audio_source)
        try:
            return recognizer.recognize_google(audio_data, language=lang)
        except UnknownValueError:
            return None
