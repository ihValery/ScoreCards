//
//  ScoreRepository.swift
//  ScoreCards
//
//  Created by Валерий Игнатьев on 26.06.21.
//

import Combine
import FirebaseFirestore
//FirebaseFirestoreSwift добавляет несколько интересных функций, которые помогут вам интегрировать Firestore с вашими моделями.
//Он позволяет конвертировать Score в документы и документы в Score.
import FirebaseFirestoreSwift

class ScoreRepository: ObservableObject {
    private let path: String = "score"
    private let store = Firestore.firestore()
    
    func add(_ score: Score) {
        do {
            _ = try store.collection(path).addDocument(from: score)
        } catch {
            fatalError("Невозможно добавить карту: \(error.localizedDescription)")
        }
    }
}
