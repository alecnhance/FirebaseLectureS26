//
//  ReviewView.swift
//  firebase_lecture_S26
//
//  Created by Alec Hance on 12/9/25.
//

import SwiftUI

struct ReviewView: View {
    let movie: Movie
    @State var comment: String = ""
    @State var rating: Int = 1
    @Environment(UserViewModel.self) var vm
    @Environment(\.dismiss) var dismiss
    var update: Bool = false
    var oldRating: Rating? = nil
    var body: some View {
        VStack(alignment: .leading) {
            Text("Review").font(.title).bold()
            Text("\(movie.name)").font(.headline)
            HStack {
                Text("Released \(String(movie.year))").foregroundStyle(.gray)
                Spacer()
                Text("\(movie.duration) minutes").foregroundStyle(.gray)
            }
            ZStack {
                TextEditor(text: $comment)
                    .padding()
                    .frame(height: UIScreen.main.bounds.height * 0.2)
                    .background {
                        RoundedRectangle(cornerRadius: 4).stroke(Color.gray, lineWidth: 1)
                    }
            }
            HStack {
                Spacer()
                ForEach(0...4, id: \.self) { num in
                    Image(systemName: rating > num  ? "star.fill" : "star").font(.system(size: 30)).foregroundStyle(rating > num ? .yellow : .black)
                        .onTapGesture {
                            rating = num + 1
                        }
                }
                Spacer()
            }.padding(.top, 15)
            if update {
                Button("Update") {
                    vm.updateRating(rating: oldRating!, stars: rating, comment: comment.isEmpty ? "no Comment" : comment)
                    dismiss()
                }.padding(.top, 15).buttonStyle(.borderedProminent).frame(maxWidth: .infinity, alignment: .center).tint(.black)
            } else {
                Button("Submit") {
                    vm.addRating(movie: movie, stars: rating, comment: comment.isEmpty ? "No comment" : comment)
                    dismiss()
                }.padding(.top, 15).buttonStyle(.borderedProminent).frame(maxWidth: .infinity, alignment: .center).tint(.black)
            }
        }.padding()
            .onAppear() {
                if let old = oldRating {
                    comment = old.comment
                    rating = old.stars
                }
            }
    }
}

#Preview {
    let vm = UserViewModel()
    ReviewView(movie: Movie(name: "Titanic", duration: 120, year: 2000))
        .environment(vm)
}
