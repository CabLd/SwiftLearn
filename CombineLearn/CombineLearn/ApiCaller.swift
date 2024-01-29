//
//  ApiCaller.swift
//  CombineLearn
//
//  Created by yangtz on 2024/1/15.
//

import Combine
import Foundation

class ApiCaller {
    static let shared = ApiCaller()
    
    func fetchCompanies() -> Future<[String], Error> {
        return Future { promise in
            DispatchQueue.main.asyncAfter(deadline: .now()+3) {  promise(.success(["cat", "dog", "tiger", "lion"]))
            }
        }
//        return Future { <#@escaping (Result<Output, Error>) -> Void#> in
//            <#code#>
//        }
    }
    
}
