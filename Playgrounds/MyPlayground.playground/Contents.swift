print("test")

import AVFoundation

let synth = AVSpeechSynthesizer()

let utterance = AVSpeechUtterance(string: "Hello world!")

synth.speak(utterance)
