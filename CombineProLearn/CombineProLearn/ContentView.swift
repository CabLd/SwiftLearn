//
//  ContentView.swift
//  CombineProLearn
//
//  Created by yangtz on 2024/1/30.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = MovieViewModel()

    var body: some View {
        List(viewModel.movies) { movie in
            HStack {
                AsyncImage(url: movie.posterURL) { poster in
                    poster
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                } placeholder: {
                    ProgressView()
                        .frame(width: 100)
                }

                VStack(alignment:.leading) {
                    Text(movie.title)
                        .font(.headline)
                    Text(movie.overview)
                        .font(.caption)
                        .lineLimit(3)
                }
            }
        }.onAppear() {
            viewModel.fetchInitialData()
        }
    }
}

#Preview {
    ContentView()
}
