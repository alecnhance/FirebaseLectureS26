//
//  AuthView.swift
//  firebase_lecture_S26
//
//  Created by Alec Hance on 12/10/25.
//

import SwiftUI

import SwiftUI

struct AuthView: View {
    @Environment(UserViewModel.self) var vm
    @State var isLogIn = true

    var body: some View {
        if isLogIn {
            LogIn(toggle: $isLogIn)
        } else {
            SignUp(toggle: $isLogIn)
        }
    }
}

struct LogIn: View {
    @State private var email = ""
    @State private var password = ""
    @Environment(UserViewModel.self) var vm
    @Binding var toggle: Bool

    var body: some View {
        VStack {
            Image("bootcamp1")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.width * 0.45)
                .cornerRadius(0.45 * UIScreen.main.bounds.width)
                .padding(.vertical, UIScreen.main.bounds.height * 0.07)
    
            Text("Log In").foregroundStyle(.white).bold().font(.title).padding(.vertical)
            VStack(spacing: 20) {
                
                TextField("", text: $email, prompt: Text("Email").foregroundStyle(Color(red: 0.6, green: 0.6, blue: 0.6)))
                    .padding(10)
                    .font(.title)
                    .foregroundStyle(.white)
                    .textInputAutocapitalization(.never)
                    .background {
                        RoundedRectangle(cornerRadius: 8).stroke(Color(red: 0.6, green: 0.6, blue: 0.6))
                    }
                SecureField("", text: $password, prompt: Text("Password").foregroundStyle(Color(red: 0.6, green: 0.6, blue: 0.6)))
                    .padding(10)
                    .font(.title)
                    .foregroundStyle(.white)
                    .textInputAutocapitalization(.never)
                    .background {
                        RoundedRectangle(cornerRadius: 8).stroke(Color(red: 0.6, green: 0.6, blue: 0.6))
                    }
                
                Button {
                } label: {
                    HStack {
                        Spacer()
                        Text("Submit").foregroundStyle(.white).font(.title)
                        Spacer()
                    }.padding(10).background {
                        RoundedRectangle(cornerRadius: 8).stroke(Color(red: 0.6, green: 0.6, blue: 0.6))
                    }
                }
            }
   
            HStack {
                Text("Don't have an account?").foregroundStyle(Color(red: 0.6, green: 0.6, blue: 0.6))
                Button {
                    toggle.toggle()
                } label: {
                    Text("Register").underline()
                }
               
            }.padding(.top)
            Spacer()

        }.frame(maxHeight: .infinity).padding(.horizontal).background(.black)
    }
}

struct SignUp: View {
    @State var email = ""
    @State var password = ""
    @State var name = ""
    @Environment(UserViewModel.self) var vm
    @Binding var toggle: Bool

    var body: some View {
        VStack {
            Image("bootcamp1")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.width * 0.45)
            
                .cornerRadius(0.45 * UIScreen.main.bounds.width)
                .padding(.vertical, UIScreen.main.bounds.height * 0.07)
            Text("Sign Up").foregroundStyle(.white).font(.title).padding(.vertical)
            VStack(spacing: 20) {
                TextField("", text: $name, prompt: Text("Name").foregroundStyle(Color(red: 0.6, green: 0.6, blue: 0.6)))
                    .padding(10)
                    .font(.title)
                    .foregroundStyle(.white)
                    .textInputAutocapitalization(.never)
                    .background {
                        RoundedRectangle(cornerRadius: 8).stroke(Color(red: 0.6, green: 0.6, blue: 0.6))
                    }
                TextField("", text: $email, prompt: Text("Email").foregroundStyle(Color(red: 0.6, green: 0.6, blue: 0.6)))
                    .padding(10)
                    .font(.title)
                    .foregroundStyle(.white)
                    .textInputAutocapitalization(.never)
                    .background {
                        RoundedRectangle(cornerRadius: 8).stroke(Color(red: 0.6, green: 0.6, blue: 0.6))
                    }
                SecureField("", text: $password, prompt: Text("Password").foregroundStyle(Color(red: 0.6, green: 0.6, blue: 0.6)))
                    .padding(10)
                    .font(.title)
                    .foregroundStyle(.white)
                    .textInputAutocapitalization(.never)
                    .background {
                        RoundedRectangle(cornerRadius: 8).stroke(Color(red: 0.6, green: 0.6, blue: 0.6))
                    }
                
                Button {
                } label: {
                    HStack {
                        Spacer()
                        Text("Submit").foregroundStyle(.white).font(.title)
                        Spacer()
                    }.padding(10).background {
                        RoundedRectangle(cornerRadius: 8).stroke(Color(red: 0.6, green: 0.6, blue: 0.6))
                    }
                }
            }
   
            HStack {
                Text("Already have an account?").foregroundStyle(Color(red: 0.6, green: 0.6, blue: 0.6))
                Button {
                    toggle.toggle()
                } label: {
                    Text("Sign In").underline()
                }
               
            }.padding(.top)
            Spacer()
            
        }.frame(maxHeight: .infinity).padding(.horizontal).background(.black)
    }
}

#Preview {
    let vm = UserViewModel()
    AuthView().environment(vm)
}
