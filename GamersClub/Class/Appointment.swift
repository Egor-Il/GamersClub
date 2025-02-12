//
//  Appointment.swift
//  GamersClub
//
//  Created by Egor Ilchenko on 1/2/25.
//

import Foundation
final class Appointment {
    
    var playerName: String
    var gameDate: String
    var game: String
    
    init(playerName: String, gameDate: String, game: String) {
        self.playerName = playerName
        self.gameDate = gameDate
        self.game = game
    }
}
