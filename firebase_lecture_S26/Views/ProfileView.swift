//
//  Profile.swift
//  firebase_lecture_S26
//
//  Created by Alec Hance on 12/10/25.
//

import SwiftUI

struct ProfileView: View {
    @Environment(UserViewModel.self) var userVM
    var body: some View {
        VStack {
            Text("Profile").font(.largeTitle)
        }
    }
}

#Preview {
    let vm = UserViewModel()
    ProfileView().environment(vm)
}
