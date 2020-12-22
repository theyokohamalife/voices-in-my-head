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
            Text("Voices in My Head")
                .padding()
                .font(.title)
                .foregroundColor(.black)
            
//            BackgroundImage() //component
            
            Text("Let the quest begin")
                .font(.subheadline)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
