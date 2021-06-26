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
    
    @Published var scores: [Score] = []
    
    init() {
        get()
    }
    
    func get() {
        store.collection(path).addSnapshotListener { querySnapshot, error in
            if let error = error {
                print("Ошибка при получении карточек: \(error.localizedDescription)")
                return
            }
            //Используйте compactMap (_ :) on querySnapshot.documents для перебора всех элементов.
            //Если querySnapshotесть nil установите пустой массив.
            self.scores = querySnapshot?.documents.compactMap { document in
                try? document.data(as: Score.self)
            } ?? []
        }
    }
    
    func add(_ score: Score) {
        do {
            _ = try store.collection(path).addDocument(from: score)
        } catch {
            fatalError("Невозможно добавить карту: \(error.localizedDescription)")
        }
    }
}
