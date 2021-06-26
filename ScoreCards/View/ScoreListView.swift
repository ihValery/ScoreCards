//
//  ScoreListView.swift
//  ScoreCards
//
//  Created by Валерий Игнатьев on 26.06.21.
//

import SwiftUI

struct ScoreListView: View {
    @ObservedObject var scoreListViewModel = ScoreListViewModel()
    @State private var showForm = false
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView(.vertical) {
                    ForEach(scoreListViewModel.scoreViewModels) { item in
                        ScoreView(scoreViewModel: item)
                    }
                }
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: { showForm.toggle() }) {
                        Image(systemName: "plus")
                            .font(.largeTitle)
                            .accentColor(.white)
                            .padding()
                            .background(Circle().fill(Color.red))
                    }
                }.padding(.horizontal)
            }
        }
        
        .sheet(isPresented: $showForm) {
            NewScoreForm(scoreListViewModel: ScoreListViewModel())
        }
    }
}

struct ScoreListView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreListView(scoreListViewModel: ScoreListViewModel())
    }
}
