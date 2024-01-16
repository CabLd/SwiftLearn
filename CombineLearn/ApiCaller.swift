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
        return Future { promixe in
            DispatchQueue.main.asyncAfter(deadline: .now()+3) {  promixe(.success(["cat", "dog", "tiger", "lion"]))
            }
        }
    }
    
}
