//
//  ScoreView.swift
//  ScoreCards
//
//  Created by Валерий Игнатьев on 26.06.21.
//

import SwiftUI

struct ScoreView: View {
    var scoreViewModel: ScoreViewModel
    @State private var viewState = CGSize.zero
    @State private var showAlert = false
    
    var body: some View {
        ZStack {
            HStack {
                Text(scoreViewModel.score.theme)
                    .font(.system(size: 60))
                
                VStack(alignment: .leading) {
                    Text("Результат  ")
                        .font(.title)
                    Text(scoreViewModel.dateToString())
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
            }
        }
        
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 40)
        .background(BgCardScore())
        .padding(.vertical, 35).padding(.leading, 10)
        
        .gesture(
            DragGesture()
                .onChanged { value in
                    viewState = value.translation
                }
                .onEnded { value in
                    if value.location.x < value.startLocation.x - 40 {
                        showAlert.toggle()
                    }
                    viewState = .zero
                })
        
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Удалить счет"), message: Text("Это действие нельзу будет отменить"),
                  primaryButton: .destructive(Text("Удалить")) { scoreViewModel.remove() },
                  secondaryButton: .cancel(Text("Нет")))
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        let score = testData[5]
        ScoreView(scoreViewModel: ScoreViewModel(score: score))
    }
}
