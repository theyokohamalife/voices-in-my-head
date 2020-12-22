//
//  ContentView.swift
//  Voices in My Head
//
//  Created by LaShawn on 2020/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var enemyHP = 999
    @State var playerHP = 130
    @State var gameDialogue = "You don't look so tough..."
    @State var attack = 0
    @State var heal = 0
    @State var block = 0
    
    var body: some View {
        VStack {
            // Enemy HP
                ZStack {
                    Rectangle()
                        .frame(width: 200.0, height: 30.0)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
                    HStack {
                        Text("HP")
                            .fontWeight(.bold)
                        Text(String(enemyHP))
                            .foregroundColor(.black)
                    }
                }
            // Enemy icon
            Rectangle()
                .frame(width: 150.0, height: 150.0)
                .foregroundColor(.gray)
            Spacer()
            // Player HP
                ZStack {
                    Rectangle()
                        .frame(width: 200.0, height: 30.0)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
                    HStack {
                        Text("HP")
                            .fontWeight(.bold)
                        Text(String(playerHP))
                            .foregroundColor(.black)
                        if block > 0 {
                            Text("+ \(block)")
                        }
                    }
                }
            // Dialogue
            ZStack {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/10.0/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray)
                    .frame(width: 300, height: 200)
                Text(String(gameDialogue))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            // Abilities
            
            HStack {
                ZStack {
                    
                    Circle()
                        .foregroundColor(.gray)
                        .frame(width: 80, height:80)
                    Button(action: {
                        attack = Int.random(in: 90...120)
                        if enemyHP > 0 {
                            enemyHP -= attack
                        }
                        if enemyHP <= 0 {
                            enemyHP = 0
                            print("You won!")
                        }
                        print("attack", String(attack))
                    }, label: {
                        Text("Attack")
                    })
                    .foregroundColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                }
                ZStack {
                    Circle()
                        .foregroundColor(.gray)
                        .frame(width: 80, height:80)
                    Button(action: {
                        block = Int.random(in: 20...40)
                        print("block", String(block))
                    }, label: {
                        Text("Block")
                    })
                    .foregroundColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                }
                ZStack {
                    Circle()
                        .foregroundColor(.gray)
                        .frame(width: 80, height:80)
                    Button(action: {
                        heal = Int.random(in: 30...50)
                        if playerHP == 0 {
                            print("Game Over")
                        } else if playerHP > 0 {
                            playerHP += heal
                            if playerHP > 130 {
                                playerHP = 130
                            }
                        }
                        print("heal", String(heal))
                    }, label: {
                        Text("Heal")
                    })
                    .foregroundColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                    
                    
                }
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
