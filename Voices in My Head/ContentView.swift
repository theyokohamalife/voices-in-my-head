//
//  ContentView.swift
//  Voices in My Head
//
//  Created by LaShawn on 2020/12/23.
//

import SwiftUI
import Speech
import SpriteKit
import UIKit


struct ContentView: View {
    @EnvironmentObject var swiftUISpeech:SwiftUISpeech
    @EnvironmentObject var command:SwiftUISpeech
    @State var enemyName:String = "Soul Eater"
    @State var enemyHP:Int = 999
    @State var playerHP:Int = 130
    @State var playerShield:Int = 0
    @State var engaged = false
    @State var playerDied = false
    @State var enemyDied = false
    @State var gameOver = false
    @State private var isRotated = false
    
    var animation: Animation {
        Animation.easeOut
    }
//    private let skView = SKView()

    
    // PARTICLE EMITTER START
    
    
    
    // PARTICLE EMITTER END
        
       
        
    
    
    let timer = Timer.publish(every: 8, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        
        VStack {
            
            Text(enemyName)
                .font(.title)
                .onReceive(timer, perform: { _ in
                    if engaged == true {
                        enemyAttack()
                    }
                })
            ZStack {
                Rectangle()
                    .frame(width: 200, height: 30)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Text("HP: \(enemyHP)")
                    .fontWeight(.bold)
//                    .padding(.bottom, 100.0)
                
            }
            Spacer()
            Image("soul-eater")
                
                .rotationEffect(Angle.degrees(isRotated ? 360 : 0))
                            .animation(animation)
            VStack{
                
                // prints results to screen
                Text("\(swiftUISpeech.outputText)")
                    .onChange(of: swiftUISpeech.outputText, perform: { value in
                        if gameOver == false {
                            engaged = true
                            print(swiftUISpeech.outputText)
                        
                            if command.outputText.contains("Attack") || command.outputText.contains("attack") || command.outputText.contains("punch") || command.outputText.contains("Punch") || command.outputText.contains("hit") || command.outputText.contains("Hit") {
                                print("Attack")
                                playerAttack()
                            }
                            if command.outputText.contains("Heal") || command.outputText.contains("heal") || command.outputText.contains("cure") ||
                                command.outputText.contains("Cure") ||
                                command.outputText.contains("Potion") ||
                                command.outputText.contains("potion") {
                                print("Heal")
                                playerHeal()
                            }
                        }
                        
                    })
                
            }.frame(width: 300,height: 300)
            
            VStack {
                ZStack {
                    
                    Rectangle()
                        .frame(width: 200, height: 30)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    Text("HP: \(playerHP)")
                        .fontWeight(.bold)
                        .padding()
                }
                
                Spacer()
                // Speech button
                swiftUISpeech.getButton()
                Spacer()
                
            }
            
        }
        
    }
    // Player Actions
    func playerAttack() {
        self.isRotated.toggle()
        playSound(sound: "punch", type: "wav")
        enemyHP -= Int.random(in: 200...350)
        if enemyHP <= 0 {
            enemyHP = 0
            engaged = false
            enemyDied = true
            gameOver = true
            playSound(sound: "playerwon", type: "wav")
            print("YOU WON")
        }
    }
    func playerHeal() {
        playSound(sound: "heal", type: "wav")
        if playerHP < 130 {
            playerHP += Int.random(in: 40...50)
        }
        if playerHP > 130 {
            playerHP = 130
        }
        print("Player heals")
    }
    // Enemy Actions
    func enemyAttack() {
        print("Enemy attacks")
        playSound(sound: "wind", type: "wav")
        playerHP -= Int.random(in: 10...20)
        if playerHP <= 0 {
            engaged = false
            playerDied = true
            gameOver = true
            playSound(sound: "gameover", type: "wav")
            print("GAME OVER")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SwiftUISpeech())
        
    }
}
