//
//  FirebaseViewModel.swift
//  firebase_lecture_S26
//
//  Created by Alec Hance on 12/9/25.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth


class FirebaseService {
    static let shared = FirebaseService()
    let db: Firestore
    
    private init() {
        db = Firestore.firestore()
    }
    
    var currentUser: User? {
        guard let user = Auth.auth().currentUser else {
            return nil
        }
        return User(id: user.uid, name: "")
    }
    
    func signUp(email: String, password: String, name: String) async -> String? {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            let userData: [String: Any] = [
                "name": name
            ]
            let ref = db.collection("USERS").document(result.user.uid)
            try await ref.setData(userData)
            return result.user.uid
        } catch {
            print("Error with signing up: \(error)")
        }
        return nil
    }
    
    func signIn(email: String, password: String) async -> String? {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            return result.user.uid
        } catch {
            print("Error signing in: \(error)")
        }
        return nil
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("error signing out: \(error)")
        }
    }
    
    func getName() async -> String? {
        guard let userID = Auth.auth().currentUser?.uid else { return nil }
        let ref = db.collection("USERS").document(userID)
        do {
            let document = try await ref.getDocument()
            if document.exists {
                return document.data()?["name"] as? String
            }
        } catch {
            print("error getting display name: \(error)")
        }
        return nil
    }
    
    func getMovie(movieID: String) async -> Movie? {
        guard let userID = Auth.auth().currentUser?.uid else { return nil }
        let ref = db.collection("USERS").document(userID).collection("MOVIES").document(movieID)
        do {
            let document = try await ref.getDocument()
            if document.exists {
                if let movie = try? document.data(as: Movie.self) {
                    return movie
                }
            }
        } catch {
            print("Error getting movie: \(error)")
        }
        return nil
    }
    
    func removeFromWatchList(movie: Movie) async {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        let ref = db.collection("USERS").document(userID).collection("MOVIES").document(movie.id.uuidString)
        do {
            try await ref.delete()
        } catch {
            print("Error deleting movie: \(error)")
        }
    }
    
    func getMovies() async -> [Movie] {
        guard let userID = Auth.auth().currentUser?.uid else { return [] }
        let ref = db.collection("USERS").document(userID).collection("MOVIES")
        var movies: [Movie] = []
        do {
            let querySnapshot = try await ref.getDocuments()
            for document in querySnapshot.documents {
                if let movie = try? document.data(as: Movie.self) {
                    movies.append(movie)
                }
//                let data = document.data()
//                if let name = data["name"] as? String,
//                   let duration = data["duration"] as? Int,
//                   let year = data["year"] as? Int,
//                   let isWatched = data["status"] as? Status,
//                   let id = UUID(uuidString: document.documentID) {
//
//                    movies.append(
//                        Movie(id: id, name: name, duration: duration, year: year, isWatched: isWatched)
//                    )
//                }
            }
        } catch {
            print("Error getting movies: \(error)")
        }
        return movies
    }
    
    func getRatings() async -> [Rating] {
        guard let userID = Auth.auth().currentUser?.uid else { return [] }
        let ref = db.collection("USERS").document(userID).collection("RATINGS")
        var ratings: [Rating] = []
        do {
            let querySnapshot = try await ref.getDocuments()
            for document in querySnapshot.documents {
                let data = document.data()
                if let id = UUID(uuidString: document.documentID),
                   let stars = data["stars"] as? Int,
                    let comment = data["comment"] as? String,
                   let movieID = data["movieID"] as? String {
                    if let movie = await getMovie(movieID: movieID) {
                        ratings.append(Rating(id: id, movie: movie, stars: stars, comment: comment))
                    }
                }
            }
        } catch {
            print("Error getting ratings: \(error)")
        }
        return ratings
    }
    
    func addRating(rating: Rating) async {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        let refRatings = db.collection("USERS").document(userID).collection("RATINGS")
        let refMovies = db.collection("USERS").document(userID).collection("MOVIES")
        do {
            try await refRatings.document(rating.id.uuidString).setData([
                "movieID": rating.movie.id.uuidString,
                "stars": rating.stars,
                "comment": rating.comment
            ])
            
            try await refMovies.document(rating.movie.id.uuidString).updateData([
                "status": 2
            ])
            

            
        } catch {
            print("Error adding rating: \(error)")
        }
    }
    
    func addToWatchlist(movie: Movie) async {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        let ref = db.collection("USERS").document(userID).collection("MOVIES")
        do {
            try ref.document(movie.id.uuidString).setData(from: movie) // Eventual write
//            try await ref.document(movie.id.uuidString).setData([
//                "name": movie.name,
//                "duration": movie.duration,
//                "year": movie.year,
//                "isWatched": movie.isWatched
//            ]) // Waits for completion
            print("Success watching movie")
        } catch {
            print("Error storing movie: \(error)")
        }
    }
    
    func watchMovie(movie: Movie) async {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        let ref = db.collection("USERS").document(userID).collection("MOVIES")
        do {
            try await ref.document(movie.id.uuidString).updateData(["status": 1])
            print("Success watching movie")
        } catch {
            print("Error watching movie: \(error)")
        }
    }
}
