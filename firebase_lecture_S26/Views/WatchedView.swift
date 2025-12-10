//
//  WatchedView.swift
//  firebase_lecture_S26
//
//  Created by Alec Hance on 12/9/25.
//

import SwiftUI

struct WatchedView: View {
    @Environment(UserViewModel.self) var viewModel
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Watched").font(.largeTitle).bold().frame(maxWidth: .infinity, alignment: .leading)
                }
                ForEach(viewModel.watched) { movie in
                    MovieCard(movie: movie, watched: true)
                }
                Spacer()
        
                
            }.padding()
        }
    }
}

#Preview {
    let vm = UserViewModel()
    WatchedView()
        .environment(vm)
}
