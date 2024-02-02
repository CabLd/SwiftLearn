//
//  Networker.swift
//  URLSessionLearn
//
//  Created by yangtz on 2024/1/15.
//

import Foundation

// 网络错误
enum NetworkerError: Error {
    case badResponse
    case badStatusCode(Int)
    case badData
}

class Networker {
    
    // 单例 设计模式
    static let shared = Networker()
    
    // 会话
    private let session: URLSession
    
    // 初始化session
    init() {
        session = URLSession(configuration: URLSessionConfiguration.default)
    }

    // 获得句子的函数
    // 需要传递一个闭包函数实现错误 + 句子的返回 
    // 由于请求需要时间，该方法必须异步执行 逃逸闭包
    func getQuote(completion: @escaping (Saying?, Error?) -> (Void) ) {
        let url = URL(string: "https://api.kanye.rest/")!
        
        // 请求封装一下
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
         
        let task = session.dataTask(with: request) {
            (data: Data?, response: URLResponse?, error: Error?) in
            // 发现错误直接结束掉
            if let error = error {
                // 放入主线程异步执行
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            // 处理错误
            guard let httpResponse = response as? HTTPURLResponse
            else {
                DispatchQueue.main.async {
                    completion(nil, NetworkerError.badResponse)
                }
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode)
            else {
                DispatchQueue.main.async {
                    completion(nil, NetworkerError.badStatusCode(httpResponse.statusCode))
                }
                return
            }
            
            // 拿到返回的数据
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, NetworkerError.badData)
                }
                return
            }
            
            do {
                let saying = try JSONDecoder().decode(Saying.self, from: data)
                DispatchQueue.main.async {
                    completion(saying, nil)
                }
            } catch let error {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
        task.resume()
    }
    
}
