//
//  NewScoreForm.swift
//  ScoreCards
//
//  Created by Валерий Игнатьев on 26.06.21.
//

import SwiftUI

struct NewScoreForm: View {
    @State private var newMaxScore = ""
    @State private var pickerSelect = ""
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var scoreListViewModel: ScoreListViewModel
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("Выбери тему")
                Picker("", selection: $pickerSelect) {
                    Text("🐶").tag("🐶")
                    Text("🐘").tag("🐘")
                    Text("🥑").tag("🥑")
                    Text("🏓").tag("🏓")
                    Text("🧑🏽‍🚒").tag("🧑🏽‍🚒")
                }
                .pickerStyle(SegmentedPickerStyle())
                .background(RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.blue, lineWidth: pickerSelect == "" ? 1 : 0))
                
                Text("Новый максимальный счет")
                TextField("Введи число", text: $newMaxScore)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            
            Button("Добавить новый счет") {
                addScore()
            }
            
            Spacer()
        }
    }
    
    private func addScore() {
        guard let number = Int(newMaxScore) else { return }
        var currScore = Score(theme: pickerSelect, maxScore: number)
        
        guard let currentIndex = searchIndex(theme: pickerSelect) else {
            scoreListViewModel.add(currScore)
            presentationMode.wrappedValue.dismiss()
            return
        }
        
        if number > scoreListViewModel.scoreViewModels[currentIndex].score.maxScore {
            scoreListViewModel.scoreViewModels[currentIndex].score.maxScore = number
            currScore = scoreListViewModel.scoreViewModels[currentIndex].score
            currScore.date = Date()
            scoreListViewModel.update(currScore)
        }
        
        presentationMode.wrappedValue.dismiss()
    }
    
    private func searchIndex(theme: String) -> Int? {
        for index in 0..<scoreListViewModel.scoreViewModels.count {
            if scoreListViewModel.scoreViewModels[index].score.theme == theme {
                return index
            }
        }
        return nil
    }
}

struct NewScoreForm_Previews: PreviewProvider {
    static var previews: some View {
        NewScoreForm(scoreListViewModel: ScoreListViewModel())
    }
}
