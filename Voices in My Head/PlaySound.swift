//
//  PlaySound.swift
//  Voices in My Head
//
//  Created by LaShawn on 2020/12/24.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Error! Couldn't find audio file")
        }
    }
}
