//
//  GameManager.swift
//  GamersClub
//
//  Created by Egor Ilchenko on 12/23/24.
//

import Foundation


final class GameManager {
    
    
    static let shared = GameManager()
    private init() {}
    
    let gameArray = ["Witcher 3", "STALKER 2", "DOTA 2", "Cyberpunk 2077", "EA Sports FC 25", "PUBG", "Baldur's Gate 3","Wukong", "SnowRunner","God of War", "Heroes of Might and Magic", "Manor Lords", "Microsoft Flight Simulator 2024"]
    
    let gamePicDic: [String: String] = [
        "Witcher 3" : "witcherPic",
        "STALKER 2" : "stalkerPic",
        "DOTA 2" : "dotaPic",
        "Cyberpunk 2077" : "cyberpunkPic",
        "EA Sports FC 25" : "fifaPic",
        "PUBG" : "pubgPic",
        "Baldur's Gate 3" : "baldursGatePic",
        "Wukong" : "wukongPic",
        "SnowRunner" : "snowRunnerPic",
        "God of War" : "godOfWarPic",
        "Heroes of Might and Magic" : "heroesPic",
        "Manor Lords" : "manorLordsPic",
        "Microsoft Flight Simulator 2024" : "mfsPic"
    ]
    
    var appointmentArray: [Appointment] = []
    
    
    
}
