//
//  Score.swift
//  ScoreCards
//
//  Created by Валерий Игнатьев on 26.06.21.
//

import Foundation

struct Score: Identifiable, Codable {
    var id: String = UUID().uuidString
    var theme: String
    var maxScore: String
    var date = Date()
    var userId: String?
}

#if DEBUG
let testData = (1...10).map { item in
    Score(theme: "🧑🏽‍🚒", maxScore: "\(item)")
}
#endif
