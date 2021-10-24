from convert_wavs import convert_audio, convert_flac
from emotion_recognition import EmotionRecognizer
from sklearn.svm import SVC
# init a model, let's use SVC
from speechemo import transcribe_file_with_word_time_offsets

my_model = SVC()
# pass my model to EmotionRecognizer instance
# and balance the dataset
rec = EmotionRecognizer(model=my_model, emotions=['angry', 'sad', 'neutral', 'ps', 'happy', 'calm', 'disgust', 'fear', 'boredom'], balance=True, verbose=0)
# train the model
rec.train()
# check the test accuracy for that model
print("Test score:", rec.test_score())
# check the train accuracy for that model
print("Train score:", rec.train_score())
# initialize instance
# inherited from emotion_recognition.EmotionRecognizer
# default parameters (LSTM: 128x2, Dense:128x2)
# loads the best estimators from `grid` folder that was searched by GridSearchCV in `grid_search.py`,
# and set the model to the best in terms of test score, and then train it
rec.determine_best_model()
# get the determined sklearn model name
print(rec.model.__class__.__name__, "is the best")
# get the test accuracy score for the best estimator
print("Test score:", rec.test_score())
#audio = convert_flac('data/youre_tearing_me_apart_lisa.mp3', 'data/validation/youre_tearing_me_apart_lisa.flac')
#convert_audio('data/12percent.flac', ('data/12percent.wav'))
# predict angry audio sample
# this is a neutral speech from emo-db
# this is a sad speech from TESS
script = transcribe_file_with_word_time_offsets('data/validation/clip.flac')
mood_json= []
jsonkv = {
    "text": "sample",
    "timestamp-start": "00:00",
    "timestamp-end": "00:00",
    "mood-code": "calm"
}

for i in range(27):
    clip = 'clip{0:03d}'.format(i)
    mood = rec.predict("data/validation/"+ clip +".wav")
    jsonkv["text"] = script[i].sentence
    jsonkv["timestamp-start"] = script[i].start_time
    jsonkv["timestamp-end"] = script[i].end_time
    jsonkv["mood-code"] = mood
    print("Prediction:", mood )
