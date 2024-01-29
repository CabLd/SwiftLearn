//
//  APICaller.swift
//  CombineIntro
//
//  Created by yangtz on 2024/1/29.
//

import Combine
import Foundation

class APICaller {
    static let shared = APICaller()

    func fetchCompanies() -> Future<[String], Error> {
        return Future { promise in
            DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                promise(.success(["Apple", "Google", "zhangyuxiaowanzi"]))
            }
        }

    }
}


