//
//  MovieViewModel.swift
//  CombineProLearn
//
//  Created by yangtz on 2024/1/30.
//

import Combine
import Foundation

final class MovieViewModel: ObservableObject {
    @Published var movies: [Movie] = []

    var cancellables = Set<AnyCancellable>()

    func fetchInitialData() {
        fetchMovies()
            .map(\.results)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }receiveValue: { [weak self] movies in
                self?.movies = movies
            }
            .store(in: &cancellables)
    }
}
