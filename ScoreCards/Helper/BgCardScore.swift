//
//  BgCardScore.swift
//  ScoreCards
//
//  Created by Валерий Игнатьев on 26.06.21.
//

import SwiftUI

struct BgCardScore: View {
    var body: some View {
        VStack {
            Rectangle().fill(Color.gray).opacity(0.3)
                .cornerRadius(6)
                .clipShape(CustomCorners(corner: [.topLeft, .bottomRight], radius: 60))
                .frame(height: 120)
        }
        .padding()
    }
}
