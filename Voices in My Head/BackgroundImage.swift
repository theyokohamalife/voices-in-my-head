//
//  BackgroundImage.swift
//  Voices in My Head
//
//  Created by LaShawn on 2020/12/21.
//

import SwiftUI

struct BackgroundImage: View {
    var body: some View {
        Image("ducky")
            .resizable()
            .aspectRatio(contentMode: .fit)
            
    }
}

struct BackgroundImage_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImage()
    }
}
