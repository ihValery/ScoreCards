//
//  ScoreListView.swift
//  ScoreCards
//
//  Created by Валерий Игнатьев on 26.06.21.
//

import SwiftUI

struct ScoreListView: View {
    var scores: [Score] = []
    @State private var showForm = false
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView(.vertical) {
                    ForEach(scores, id: \.id) { item in
                        ScoreView(score: item)
                    }
                }
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: { showForm.toggle() }) {
                        Text("+")
                            .padding()
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .background(Circle().fill(Color.red))
                    }
                }.padding(.horizontal)
            }
        }
        .sheet(isPresented: $showForm) {
            NewScoreForm()
        }
    }
}

struct ScoreListView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreListView(scores: testData)
    }
}
