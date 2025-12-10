//
//  ContentView.swift
//  firebase_lecture_S26
//
//  Created by Alec Hance on 12/9/25.
//

import SwiftUI

struct ContentView: View {
    @State var vm: UserViewModel = UserViewModel()
    var body: some View {
        TabView {
            WatchListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("List")
                }
            RatingsView()
                .tabItem {
                    Image(systemName: "star.fill")
                   Text("Ratings")
                }
            WatchedView()
                .tabItem {
                    Image(systemName: "checkmark.square.fill")
                    Text("Watched")
                }
        }
        .environment(vm)
    }
}

#Preview {
    ContentView()
}
