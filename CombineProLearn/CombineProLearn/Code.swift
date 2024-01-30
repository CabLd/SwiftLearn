//
//  Code.swift
//  CombineProLearn
//
//  Created by yangtz on 2024/1/30.
//

import Combine
import Foundation


var cancellables = Set<AnyCancellable>()
func run() {
    Just(42)
        .delay(for: 1, scheduler: DispatchQueue.main)
        .sink { value in
            print(value)
        }
        .store(in: &cancellables)

//    Just([1, 2, 3, 4, 5])
//        .sink { value in
//            print(value)
//        }
//        .store(in: &cancellables)
    // output value one by one
    [1, 2, 3, 4, 5]
        .publisher
        .filter { value -> Bool in value.isMultiple(of: 2) == false }
        .map { $0 * $0 }
        .print()
        .sink { value in
            print(value)
        }
        .store(in: &cancellables)



}
// older coder
/*
func fetchUserId(_ completionHandler: @escaping (Result<Int, Error>) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        let result = 17
        completionHandler(.success(result))
    }
}
func fetchName(for userId: Int, _ completionHandler: @escaping (Result<String, Error>) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        let result = "yb"
        completionHandler(.success(result))
    }
}
func run() {
    fetchUserId { userIdResult in
        switch userIdResult {
        case .success(let userId):
            fetchName(for: userId) { nameResult in
                switch nameResult {
                case .success(let name):
                    print(name, userId)
                case .failure(let failure):
                    break
                }
            }
        case .failure(let failure):
            break
        }
    }
}*/
