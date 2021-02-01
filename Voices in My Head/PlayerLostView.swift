//
//  PlayerLostView.swift
//  Voices in My Head
//
//  Created by LaShawn on 2020/12/24.
//

import SwiftUI

struct PlayerLostView: View {
    var body: some View {
        Text("You lost...")
            .font(.title)
            .fontWeight(.bold)
            .onAppear(perform: {
                playSound(sound: "gameover", type: "wav")
            })
    }
}

struct PlayerLostView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerLostView()
    }
}
