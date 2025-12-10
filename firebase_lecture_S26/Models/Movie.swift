//
//  Movie.swift
//  firebase_lecture_S26
//
//  Created by Alec Hance on 12/9/25.
//

import Foundation


struct Movie: Identifiable, Encodable, Decodable {
    var id: UUID = UUID()
    var name: String
    var duration: Int
    var year: Int
    var status: Int = 0
}
