//
//  Profile.swift
//  firebase_lecture_S26
//
//  Created by Alec Hance on 12/10/25.
//

import SwiftUI

struct Profile: View {
    @Environment(UserViewModel.self) var vm
    var body: some View {
        VStack {
            Text("Profile").font(.largeTitle)
            Button {
                vm.signOut()
            } label: {
                Text("Sign Out")
            }
        }
    }
}

#Preview {
    let vm = UserViewModel()
    Profile().environment(vm)
}
