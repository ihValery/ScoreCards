//
//  ScoreListViewModel.swift
//  ScoreCards
//
//  Created by Валерий Игнатьев on 26.06.21.
//

import Combine

class ScoreListViewModel: ObservableObject {
    @Published var scoreRepository = ScoreRepository()
    @Published var scoreViewModels: [ScoreViewModel] = []
    
    private var cancellabel: Set<AnyCancellable> = []
    
    init() {
        scoreRepository.$scores.map { scores in
            scores.map(ScoreViewModel.init)
        }
        .assign(to: \.scoreViewModels, on: self)
        .store(in: &cancellabel)
    }
    
    func add(_ score: Score) {
        scoreRepository.add(score)
    }
    
    func update(_ score: Score) {
        scoreRepository.update(score)
    }
}
