import io
import os
from google.cloud import speech
from typing import NamedTuple

os.environ["GOOGLE_APPLICATION_CREDENTIALS"]="hidden_value"
end = 53.0
class Sentence(NamedTuple):
    lines : list
    start_time : float
    end_time : float

class Word(NamedTuple):
    word : str
    start_time : float
    end_time : float

class Resultw (NamedTuple):
    sentence : str
    words : list
    start_time : float
    end_time : float

def match_transcript(sentence, transcript):
    wordcount = 0
    count = 0
    line = transcript[0]
    end_time = 0.0
    start_time = sentence.words[0].start_time.total_seconds()
    sentences = []
    lines = []
    for word_info in sentence.words:
        word = word_info.word
        end_time = word_info.end_time.total_seconds()
        if word in line:
            wordcount += 1
            end_time = end_time
    lastword = sentence.words[-1]
    if wordcount < len(sentence.words)/2 :
        lines.append(line)
        index = sentence.words.find(line[-1])
        if index >= len(sentence.words) - 1:
            while lastword.word not in transcript[count]:
                count += 1
            lines.extend(transcript[:count])
            sentences.append(lines)

        if index != -1:
            sentences.append(lines)
            words, count = match_transcript(sentence[index:], transcript[1:])
            sentences.append(words)

    elif lastword.word not in line:
        while lastword.word not in transcript[count]:
            count += 1
        lines.extend(transcript[:count])
        sentences.append(lines)
    sentences.append(Sentence(lines, start_time, end_time))
    return sentences, count



def transcribe_file_with_word_time_offsets(speech_file):
    """Transcribe the given audio file synchronously and output the word time
    offsets."""


    client = speech.SpeechClient()

    with io.open(speech_file, "rb") as audio_file:
        content = audio_file.read()

    audio = speech.RecognitionAudio(content=content)
    config = speech.RecognitionConfig(
        encoding=speech.RecognitionConfig.AudioEncoding.FLAC,
        sample_rate_hertz=44100,
        language_code="en-US",
        enable_word_time_offsets=True,
        audio_channel_count = 2
    )

    response = client.recognize(config=config, audio=audio)
    with io.open('data/transcript.txt', "r+") as transcript:
        lines = transcript.readlines()
    sentences = []
    for result in response.results:
        alternative = result.alternatives[0]
        print("Transcript: {}".format(alternative.transcript))
        words = []
        for word_info in alternative.words:
            word = word_info.word
            start_time = word_info.start_time
            end_time = word_info.end_time
            words.append(Word(word, start_time, end_time))
        sentences.append(Resultw(alternative.transcript, words))
        match_transcript(Resultw(alternative.transcript, words), lines)

    return sentences