//
//  Enemy.swift
//  Voices in My Head
//
//  Created by LaShawn on 2020/12/23.
//

import Foundation
import SwiftUI

struct Enemy: Hashable, Codable {
    var id: Int
    var name: String
    var hp: Int
    var attackPwrMin: Int
    var attackPwrMax: Int
    var cooldown: Int
    
}
