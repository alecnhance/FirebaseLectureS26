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
        Group {
            if let _ = vm.user {
                TabView(selection: $vm.selectedTab) {
                    WatchListView()
                        .tabItem {
                            Image(systemName: "list.bullet")
                            Text("List")
                        }
                        .tag(0)
                    RatingsView()
                        .tabItem {
                            Image(systemName: "star.fill")
                            Text("Ratings")
                        }
                        .tag(1)
                    WatchedView()
                        .tabItem {
                            Image(systemName: "checkmark.square.fill")
                            Text("Watched")
                        }
                        .tag(2)
                    Profile()
                        .tabItem {
                            Image(systemName: "gear")
                            Text("Profile")
                        }
                        .tag(3)
                }
                .environment(vm)
                .task {
                    await vm.loadAllData()
                }
            } else {
                AuthView().environment(vm)
            }
        }
    }
}

#Preview {
    ContentView()
}
