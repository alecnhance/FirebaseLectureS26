//
//  Ratings.swift
//  firebase_lecture_S26
//
//  Created by Alec Hance on 12/9/25.
//

import SwiftUI

struct RatingsView: View {
    @Environment(UserViewModel.self) var viewModel
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Ratings").font(.largeTitle).bold().frame(maxWidth: .infinity, alignment: .leading)
                }
                ForEach(viewModel.ratings) { rating in
                    RatingCard(rating: rating)
                }
                Spacer()
        
                
            }.padding()
        }
    }
}

#Preview {
    let viewModel = UserViewModel()
    // Add some sample data for preview
    
    // Inject into preview environment
    RatingsView()
        .environment(viewModel)
}
