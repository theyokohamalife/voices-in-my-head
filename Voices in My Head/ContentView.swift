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
    
    var body: some View {
        VStack {
            VStack{
                Text("\(swiftUISpeech.outputText)")// prints results to screen
                    .font(.title)
                    .bold()
                
            }.frame(width: 300,height: 400)
            
            VStack {// Speech button
                
                swiftUISpeech.getButton()
                Spacer()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SwiftUISpeech())
    }
}
