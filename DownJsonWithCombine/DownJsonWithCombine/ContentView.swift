//
//  ContentView.swift
//  DownJsonWithCombine
//
//  Created by yangtz on 2024/1/29.
//

import SwiftUI
import Combine

struct PostModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class DownloadWithCombineViewModel: ObservableObject {
    @Published var posts: [PostModel] = []

    var cancellables = Set<AnyCancellable>()

    init() {
        getPosts()
    }

    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        // Combine dis
        /*
         // 1. create the publisher
         // 2. subscribe publisher on background thread
         // 3. receive on main thread
         // 4. tryMap (check that the data is good)
         // 5. decode (decode data into PostModels)
         // 6. sink (put the item into our app)
         // 7. store (cancel subscription if needer)
         */
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap { (data, response) -> Data in
                guard
                    let response = response as? HTTPURLResponse,
                    response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .sink { (completion) in
                print(completion)
            } receiveValue: { [weak self] (returnedPosts) in
                self?.posts = returnedPosts
            }
            .store(in: &cancellables)


    }
}

struct ContentView: View {

    @StateObject var vm = DownloadWithCombineViewModel()
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                VStack(alignment: .leading) {

                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundColor(.gray)
                }
                //.frame(minWidth: .infinity, alignment: .leading)

            }
        }
    }
}

#Preview {
    ContentView()
}
