//
//  ContentView.swift
//  Voices in My Head
//
//  Created by LaShawn on 2020/12/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            HStack {
                Text("HP")
                    .fontWeight(.bold)
                    
                Rectangle()
                    .frame(width: 200.0, height: 30.0)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
            }
            // Enemy
            Rectangle()
                .frame(width: 150.0, height: 150.0)
                .foregroundColor(.gray)
            Spacer()
            // Dialogue
            ZStack {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/10.0/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray)
                    .frame(width: .infinity, height: 200)
                Text("Game dialogue")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            // Abilities
            HStack {
                ZStack {
                    
                    Circle()
                        .foregroundColor(.gray)
                        .frame(width: 80, height:80)
//                    Text("Attack")
                    Button("Attack", action: {
                        print("Attack")
                    })
                    .foregroundColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                }
                ZStack {
                    Circle()
                        .foregroundColor(.gray)
                        .frame(width: 80, height:80)
                    Button("Block", action: {
                        print("Block")
                    })
                    .foregroundColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                }
                ZStack {
                    Circle()
                        .foregroundColor(.gray)
                        .frame(width: 80, height:80)
                    Button("Heal", action: {
                        print("Heal")
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
