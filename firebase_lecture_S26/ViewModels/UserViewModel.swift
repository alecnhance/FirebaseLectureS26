//
//  UserViewModel.swift
//  firebase_lecture_S26
//
//  Created by Alec Hance on 12/9/25.
//

import Foundation

@Observable
class UserViewModel {
    var watchList: [Movie] = []
    var ratings: [Rating] = []
    var watched: [Movie] = []
    
    func addMovie(name: String, duration: Int, year: Int) {
        watchList.append(Movie(name: name, duration: duration, year: year))
    }
    
    func addRating(movie: Movie, stars: Int, comment: String) {
        ratings.append(Rating(movie: movie, stars: stars, comment: comment))
    }
    
    func addWatched(movie: Movie) {
        watched.append(movie)
        watchList.removeAll { $0.id == movie.id }
    }
    
    func updateRating(rating: Rating, stars: Int, comment: String) {
        // Find the index of the rating we want to update
        if let index = ratings.firstIndex(where: { $0.movie.id == rating.movie.id }) {
            ratings[index].stars = stars
            ratings[index].comment = comment
        }
    }

}
