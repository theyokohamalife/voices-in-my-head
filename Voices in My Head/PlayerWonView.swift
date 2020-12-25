//
//  PlayerWonView.swift
//  Voices in My Head
//
//  Created by LaShawn on 2020/12/24.
//

import SwiftUI

struct PlayerWonView: View {
    var body: some View {
        Text("YOU WON!")
            .font(.title)
            .fontWeight(.bold)
            .onAppear(perform: {
                playSound(sound: "12win1NL", type: "wav")
            })
    }
}

struct PlayerWonView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerWonView()
    }
}
