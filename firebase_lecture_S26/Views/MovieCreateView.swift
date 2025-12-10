//
//  MovieCreateView.swift
//  firebase_lecture_S26
//
//  Created by Alec Hance on 12/9/25.
//

import SwiftUI

struct MovieCreateView: View {
    @Environment(UserViewModel.self) var vm: UserViewModel
    @State var title: String = ""
    @State var duration: String = ""
    @State var year: String = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing: 20) {
            Text("Add Movie to Watchlist!").font(.largeTitle)
            TextField("Title", text: $title).textFieldStyle(.roundedBorder)
            TextField("Duration", text: $duration).textFieldStyle(.roundedBorder)
            TextField("Release Year", text: $year).textFieldStyle(.roundedBorder)
            Button("Add Movie") {
                Task {
                    await vm.addMovie(name: title.isEmpty ? "No Title" : title, duration: Int(duration) ?? 120, year: Int(year) ?? 2025)
                    title = ""
                    duration = ""
                    year = ""
                }
                dismiss()
            }.buttonStyle(.glassProminent).tint(.black)
            Spacer()
        }.padding()
    }
}

#Preview {
    let vm = UserViewModel()
    MovieCreateView().environment(vm)
}
