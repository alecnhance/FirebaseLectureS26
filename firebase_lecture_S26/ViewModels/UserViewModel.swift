//
//  UserViewModel.swift
//  firebase_lecture_S26
//
//  Created by Alec Hance on 12/9/25.
//

import Foundation
import SwiftUI

@Observable
class UserViewModel {
    var user: User = User(id: "test", name: "Test User")
    let service: FirebaseService
    var watchList: [Movie] = []
    var ratings: [Rating] = []
    var watched: [Movie] = []
    var selectedTab: Int = 0
    
    init(service: FirebaseService = FirebaseService.shared) {
        self.service = service
    }
    
    func addMovie(name: String, duration: Int, year: Int) async {
        let movie = Movie(name: name, duration: duration, year: year)
        watchList.append(movie)
        await service.addToWatchlist(movie: movie)
    }
    
    func removeMovieFromList(movie: Movie) async {
        watchList.removeAll { $0.id == movie.id }
        await service.removeFromWatchList(movie: movie)
    }
    
    func addRating(movie: Movie, stars: Int, comment: String) async {
        let rating = Rating(movie: movie, stars: stars, comment: comment)
        watched.removeAll { $0.id == movie.id }
        ratings.append(rating)
        selectedTab = 1
        await service.addRating(rating: rating)
    }
    
    func addWatched(movie: Movie) async {
        withAnimation {
            watched.append(movie)
            watched[watched.count - 1].status = 1
            watchList.removeAll { $0.id == movie.id }
        }
        await service.watchMovie(movie: movie)
    }
    
    func updateRating(rating: Rating, stars: Int, comment: String) async {
        // Find the index of the rating we want to update

        if let index = ratings.firstIndex(where: { $0.movie.id == rating.movie.id }) {
            print("Ratings Index id: \(ratings[index].id)")
            ratings[index].stars = stars
            ratings[index].comment = comment
            await service.addRating(rating: ratings[index])
        }
    }
    
    func loadAllData() async {
        let movies = await service.getMovies()
        let ratings = await service.getRatings()
        
        self.watchList = movies.filter {
            $0.status == 0
        }
        self.watched = movies.filter {
            $0.status == 1
        }
        self.ratings = ratings
    }

}
