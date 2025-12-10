//
//  RatingCard.swift
//  firebase_lecture_S26
//
//  Created by Alec Hance on 12/9/25.
//

import SwiftUI

struct RatingCard: View {
    @Environment(UserViewModel.self) var vm: UserViewModel
    let rating: Rating
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 5) {
                Text(rating.movie.name).font(.title)
                Text("\(rating.comment)")
                HStack {
                    
                    ForEach(0...4, id: \.self) { num in
                        Image(systemName: rating.stars > num  ? "star.fill" : "star").font(.system(size: 15)).foregroundStyle(rating.stars > num ? .yellow : .black)
                    }
                    Spacer()
                }
            }
            Spacer()
            
            NavigationLink(destination: ReviewView(movie: rating.movie, update: true, oldRating: rating)) {
                HStack {
                    Image(systemName: "pencil").foregroundStyle(Color.black)
                }
            }.padding(.top, 5)
            
        }.frame(maxWidth: .infinity).padding().background {
            RoundedRectangle(cornerRadius: 10).fill(Color(red: 0.95, green: 0.95, blue: 0.95)).shadow(radius: 2)
        }
    }
}

#Preview {
    let vm = UserViewModel()
    RatingCard(rating: Rating(movie: Movie(name: "Title", duration: 20, year: 2000), stars: 2, comment: "This was a really engaging movie")).environment(vm)
}
