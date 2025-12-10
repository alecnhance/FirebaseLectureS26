//
//  MovieCard.swift
//  firebase_lecture_S26
//
//  Created by Alec Hance on 12/9/25.
//

import SwiftUI

struct MovieCard: View {
    @Environment(UserViewModel.self) var vm: UserViewModel
    let movie: Movie
    let watched: Bool
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(movie.name).font(.title)
                Text("\(movie.duration) Minutes Long")
                Text("Released in \(String(movie.year))")
            }
            Spacer()
            if watched {
                NavigationLink(destination: ReviewView(movie: movie)) {
                    HStack {
                        Text("Review").foregroundStyle(.black)
                        Image(systemName: "chevron.right").foregroundStyle(Color.black)
                    }
                }
            } else {
                Button {
                    Task {
                        await vm.addWatched(movie: movie)
                    }
                } label: {
                    HStack {
                        Text("Watch").foregroundStyle(.black)
                        Image(systemName: "checkmark").foregroundStyle(Color.black)
                    }
                }.buttonStyle(.bordered).tint(.black)
            }
        }.frame(maxWidth: .infinity).padding().background {
            RoundedRectangle(cornerRadius: 10).fill(Color(red: 0.95, green: 0.95, blue: 0.95)).shadow(radius: 2)
        }
    }
}

#Preview {
    let vm = UserViewModel()
    MovieCard(movie: Movie(name: "Title", duration: 20, year: 2000), watched: false).environment(vm)
}
