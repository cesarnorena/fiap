import sounddevice as sound
import wavio


def record_audio(duration: int = 5, sample_rate: int = 44100) -> any:
    recording = sound.rec(int(duration * sample_rate), samplerate=sample_rate, channels=1, dtype='int32')
    sound.wait()
    return recording


def save_record(file_path: str, record, sample_rate: int = 44100):
    wavio.write(file_path, record, sample_rate, sampwidth=4)
