//
//  UserViewModel.swift
//  firebase_lecture_S26
//
//  Created by Alec Hance on 12/9/25.
//

import Foundation

@Observable
class UserViewModel {
    var user: User = User(id: "test", name: "Test User")
    var watchList: [Movie] = []
    var ratings: [Rating] = []
    var watched: [Movie] = []
    var selectedTab: Int = 0
    
    func addMovie(name: String, duration: Int, year: Int) {
        let movie = Movie(name: name, duration: duration, year: year)
        watchList.append(movie)
    }
    
    func addRating(movie: Movie, stars: Int, comment: String) {
        let rating = Rating(movie: movie, stars: stars, comment: comment)
        ratings.append(rating)
        watched.removeAll { $0.id == movie.id}
        selectedTab = 1
    }
    
    func addWatched(movie: Movie) {
        watched.append(movie)
        watched[watched.count - 1].status = 1
        watchList.removeAll { $0.id == movie.id }
    }
    
    func updateRating(rating: Rating, stars: Int, comment: String) {
        // Find the index of the rating we want to update
        if let index = ratings.firstIndex(where: { $0.movie.id == rating.movie.id }) {
            ratings[index].stars = stars
            ratings[index].comment = comment
        }
    }
    
    func removeMovieFromList(movie: Movie) {
        watchList.removeAll { $0.id == movie.id }
    }

}
