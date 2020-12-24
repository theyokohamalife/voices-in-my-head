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
    @State var enemyHP:Int = 999
//    @State private var command:String = ""
    @State private var lastString:String = ""
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        
        VStack {
            
            ZStack {
                Rectangle()
                    .frame(width: 200, height: 30)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Text("HP: \(enemyHP)")
                    .padding()
            }
            VStack{
                // prints results to screen
                Text("\(swiftUISpeech.outputText)")
                    .onChange(of: swiftUISpeech.outputText, perform: { value in
                        print(swiftUISpeech.outputText)
                        if command.outputText.contains("Attack") || command.outputText.contains("attack") {
                            print("Attack")
                            playerAttack()
                        }
                    })
//                    .onReceive(timer){ _ in
//                        if command.outputText == "attack" {
//                            print("attack")
//                            playerAttack()
//                        }
//                        if command.outputText == "Attack" {
//                            print("Attack")
//                            playerAttack()
//                        }
//                    }
//                    .onAppear(perform:{
                        
                        
//                    })
                
            }.frame(width: 300,height: 300)
            
            VStack {
                Spacer()
                // Speech button
                swiftUISpeech.getButton()
                Spacer()
                
            }
            
        }
        
    }
    func playerAttack() {
        enemyHP -= Int.random(in: 20...40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SwiftUISpeech())
    }
}
