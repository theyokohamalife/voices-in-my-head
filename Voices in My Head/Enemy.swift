//
//  BattleGround.swift
//  Voices in My Head
//
//  Created by LaShawn on 2020/12/21.
//

import SwiftUI

struct BattleGround: View {
    @State private var progress = 120
    @State private var currentProgress = 0
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                
                Rectangle()
                    .foregroundColor(Color(.secondarySystemBackground))
                    .frame(width: 300, height: 24)
                    .cornerRadius(8)
                
                LinearGradient(gradient: Gradient(colors: [
                    progress < 300 ? .orange : Color(.systemTeal),
                    progress < 300 ? .pink : .blue
                ]), startPoint: .top, endPoint: .bottom)
                .frame(width: CGFloat(progress), height: 24)
                .cornerRadius(8)
                Text("HP")
                    .foregroundColor(.black)
                    .offset(x: 20, y:0)
            }
            Spacer()
            
            Image("ducky")
                .resizable()
                .aspectRatio(CGSize(width: 0.3, height: 0.3), contentMode: .fit)
        }
    }
}

struct BattleGround_Previews: PreviewProvider {
    static var previews: some View {
        BattleGround()
    }
}
