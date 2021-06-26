//
//  ScoreView.swift
//  ScoreCards
//
//  Created by Валерий Игнатьев on 26.06.21.
//

import SwiftUI

struct ScoreView: View {
    var scoreViewModel: ScoreViewModel
    
    var body: some View {
        ZStack {
            HStack {
                Text(scoreViewModel.score.theme)
                    .font(.system(size: 60))
                    .padding(.trailing)
                
                VStack(alignment: .leading) {
                    Text("Результат  ")
                        .font(.title)
                    Text(dateToString(scoreViewModel.score.date))
                        .font(.subheadline).opacity(0.6)
                }
                .opacity(0.6)
                Spacer()
            }
            
            HStack {
                Spacer()
                Text(String(scoreViewModel.score.maxScore))
                    .font(.system(size: 50).bold())
                    .opacity(0.7)
                    .padding()
            }
        }
        
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 40)
        .background(BgCardScore())
        .padding(.vertical, 35).padding(.leading, 10)
    }
    
    private func dateToString(_ date: Date) -> String {
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .short
        timeFormatter.dateStyle = .short
        return timeFormatter.string(from: date)
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        let score = testData[5]
        ScoreView(scoreViewModel: ScoreViewModel(score: score))
    }
}
