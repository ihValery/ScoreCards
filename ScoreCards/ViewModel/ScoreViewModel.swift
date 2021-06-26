//
//  ScoreViewModel.swift
//  ScoreCards
//
//  Created by Валерий Игнатьев on 26.06.21.
//

import Combine

class ScoreViewModel: ObservableObject, Identifiable {
    private let scoreRepository = ScoreRepository()
    @Published var score: Score
    
    private var cancellabel: Set<AnyCancellable> = []
    var id = ""
    
    init(score: Score) {
        self.score = score
        $score
            .compactMap { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellabel)
    }
}
