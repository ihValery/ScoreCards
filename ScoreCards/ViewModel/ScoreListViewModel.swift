//
//  ScoreListViewModel.swift
//  ScoreCards
//
//  Created by Валерий Игнатьев on 26.06.21.
//

import Combine

class ScoreListViewModel: ObservableObject {
    @Published var scoreRepository = ScoreRepository()
    
    func add(_ score: Score) {
        scoreRepository.add(score)
    }
}
