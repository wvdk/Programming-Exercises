// Create ML WWDC 18



// Images, Text, Tabular Data

// Getting data > training > evaluating > writing



///////////////////////
// using playground UI


//import CreateMLUI
//
//let builder = MLImageClassifierBuilder()
//builder.showInLiveView()
//



///////////////////////
// Not using the drag and drop playground UI:

import CreateML
import Foundation


let trainingDir = URL(...)
let testingDir = URL(...)

let model = try MLIMageClassifier(trainingData: .(localDirectories(as:. trainingDir)))

let evaluation = model.evaluation(on:)

try model.write(to:)


// Can turn these into scripts


/////////////////////////////////
// Natural Language

// 1. Text Clasification
// 2. Word tagging


///////////////
// Tabbular data





