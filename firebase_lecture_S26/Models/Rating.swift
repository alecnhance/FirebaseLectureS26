//
//  Rating.swift
//  firebase_lecture_S26
//
//  Created by Alec Hance on 12/9/25.
//

import Foundation

struct Rating: Identifiable {
    var id: UUID = UUID()
    var movie: Movie
    var stars: Int
    var comment: String
}
