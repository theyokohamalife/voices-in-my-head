//
//  ContentView.swift
//  Voices in My Head
//
//  Created by LaShawn on 2020/12/23.
//

import SwiftUI
import Speech

struct ContentView: View {
    
    @State private var enemyHP: Int = 999
    @State private var playerHP: Int = 130
    @State private var gameOver: Bool = false
    @State private var commandBtnEnabled = false
    
    @State var timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
   
    
    // SPEECH START
    @State var lb_speech: UILabel!
    @State var view_color: UIView!
    @State var btn_start: UIButton!
    
    let audioEngine = AVAudioEngine()
    let speechRecognizer: SFSpeechRecognizer? = SFSpeechRecognizer()
    let request = SFSpeechAudioBufferRecognitionRequest()
    @State var task : SFSpeechRecognitionTask!
    @State var isStart: Bool = false
    
    
    func requestPermission() {
        SFSpeechRecognizer.requestAuthorization{
            (authState) in
            OperationQueue.main.addOperation {
                if authState == .authorized {
                    print("Permission granted")
                    self.commandBtnEnabled = true
                }
                else if authState == .denied {
                    print("User denied permission")
                }
                else if authState == .notDetermined {
                    print("Phone doesn't have speech recognition")
                }
                else if authState == .restricted {
                    print("Speech recognition is restricted")
                }
            }
        }
    }
    
    func startSpeechRecognition() {
        let node = audioEngine.inputNode
        let recordingFormat = node.outputFormat(forBus: 0)
        
        node.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) {
            (buffer, _) in self.request.append(buffer)
        }
        audioEngine.prepare()
                do {
                    try audioEngine.start()
                } catch let error {
                    print("Error in the audio =\(error.localizedDescription)")
                }
                guard let myRecognization = SFSpeechRecognizer() else {
                    print("Recognition is not allowed")
                    return
                }
                if !myRecognization.isAvailable {
                    print("Try again later")
                }
                task = speechRecognizer?.recognitionTask(with: request, resultHandler: { (response, error) in
                    guard let response = response else {
                        if error != nil {
                            print(error.debugDescription)
                        }else {
                            print("Problem with getting response")
                        }
                        return
                    };
                    let message = response.bestTranscription.formattedString
                                print("Message : \(message)")
                                self.lb_speech.text = message
                    var lastString: String = ""
                                for segment in response.bestTranscription.segments {
                                    let indexTo = message.index(message.startIndex, offsetBy: segment.substringRange.location)
                                    lastString = String(message[indexTo...])
                                }
                                
                                if lastString == "red" {
                                    print("red")
                                    }
                }
                )}
    // SPEECH END
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            // Enemy
            ZStack {
                HPView()
                Text("HP: \(self.enemyHP)")
            }
            EnemyView()
            
            Spacer()
            
            // Player
            ZStack {
                HPView()
                Text("HP: \(self.playerHP)")
                    .onReceive(timer) {_ in
                        self.playerHP -= 1
                    }
            }
            DialogueView()
            Button("Command") {playerAttack()
                print("Player Attack")
            }
                .frame(width: 100.0, height: 30.0)
                .foregroundColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                .background(Color(.systemBlue))
            
        }
    }
    // Abilities
    func playerAttack() {self.enemyHP -= Int.random(in: 20...40)}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
