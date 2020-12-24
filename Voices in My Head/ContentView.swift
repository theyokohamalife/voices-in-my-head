//
//  ContentView.swift
//  Voices in My Head
//
//  Created by LaShawn on 2020/12/23.
//

import SwiftUI
import Speech


struct ContentView: View {
    @EnvironmentObject var swiftUISpeech:SwiftUISpeech
    @EnvironmentObject var command:SwiftUISpeech
    @State var enemyName:String = "Soul Eater"
    @State var enemyHP:Int = 999
    @State var playerHP:Int = 130
    @State var playerShield:Int = 0
    @State var engaged = false
    
    
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
                    .padding()
                
            }
            Image("soul-eater")
                .onAppear(perform: {
                    playSound(sound: "09battle2", type: "wav")
                })
            
            VStack{
                
                // prints results to screen
                Text("\(swiftUISpeech.outputText)")
                    .onChange(of: swiftUISpeech.outputText, perform: { value in
                        engaged = true
                        print(swiftUISpeech.outputText)
                        if command.outputText.contains("Attack") || command.outputText.contains("attack") || command.outputText.contains("kill") || command.outputText.contains("Kill") || command.outputText.contains("hit") || command.outputText.contains("Hit") {
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
        enemyHP -= Int.random(in: 100...150)
        if enemyHP <= 0 {
            engaged = false
            print("YOU WON")
        }
    }
    func playerHeal() {
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
        playerHP -= Int.random(in: 10...20)
        if playerHP <= 0 {
            engaged = false
            print("GAME OVER")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SwiftUISpeech())
    }
}
