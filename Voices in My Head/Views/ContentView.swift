//
//  ContentView.swift
//  Voices in My Head
//
//  Created by LaShawn on 2020/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var enemyHP: Int = 999
    @State private var playerHP: Int = 130
    
    @State var timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    
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
    func playerAttack() {
        self.enemyHP -= Int.random(in: 20...40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
