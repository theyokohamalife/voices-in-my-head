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
//    @IBOutlet weak var lb_speech: UILabel!
//    @IBOutlet weak var view_color: UIView!
//    @IBOutlet weak var btn_start: UIButton!
    
    let audioEngine = AVAudioEngine()
    let speechRecognizer: SFSpeechRecognizer? = SFSpeechRecognizer()
    let request = SFSpeechAudioBufferRecognitionRequest()
    var task : SFSpeechRecognitionTask!
    var isStart: Bool = false
    
    
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
            Button("Command") {playerAttack()}
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
