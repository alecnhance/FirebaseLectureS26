//
//  WatchList.swift
//  firebase_lecture_S26
//
//  Created by Alec Hance on 12/9/25.
//

import SwiftUI

struct WatchListView: View {
    @Environment(UserViewModel.self) var viewModel

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Watch List").font(.largeTitle).bold().frame(maxWidth: .infinity, alignment: .leading)
                    NavigationLink(destination: MovieCreateView()) {
                        Image(systemName: "plus.circle").foregroundStyle(.black).font(.system(size: 20))
                    }
                }
                ForEach(viewModel.watchList) { movie in
                    MovieCard(movie: movie, watched: false).transition(.scale).contextMenu {
                        Button(role: .destructive) {
                            viewModel.removeMovieFromList(movie: movie)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
                Spacer()
        
                
            }.padding()
        }
    }
}

#Preview {
    let vm = UserViewModel()
    WatchListView().environment(vm)
}
