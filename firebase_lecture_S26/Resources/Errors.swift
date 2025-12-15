//
//  Errors.swift
//  firebase_lecture_S26
//
//  Created by Alec Hance on 12/15/25.
//

// ----------------------------------------------------------
// ERRORS IN SWIFT — Overview
// ----------------------------------------------------------
//
// Swift uses typed errors to represent things that can go
// wrong at runtime. Errors are defined using enums and are
// thrown, caught, or safely ignored using try syntax.
//
// ----------------------------------------------------------



// ----------------------------------------------------------
// DEFINING ERRORS WITH ENUMS
// ----------------------------------------------------------
//
// Errors must conform to the Error protocol.
// Enums are perfect for this because each case represents
// a specific failure reason.
//
//
//enum LoginError: Error {
//    case invalidUsername
//    case invalidPassword
//    case userNotFound
//}



// ----------------------------------------------------------
// THROWING ERRORS
// ----------------------------------------------------------
//
// Functions that can throw errors must be marked with `throws`.
// Use `throw` to exit early and signal failure.
//

//func login(username: String, password: String) throws -> String {
//    if username.isEmpty {
//        throw LoginError.invalidUsername
//    }
//
//    if password.count < 6 {
//        throw LoginError.invalidPassword
//    }
//
//    if username != "admin" {
//        throw LoginError.userNotFound
//    }
//
//    return "Welcome, \(username)"
//}



// ----------------------------------------------------------
// HANDLING ERRORS — do / catch
// ----------------------------------------------------------
//
// `do` runs code that might throw.
// `catch` handles specific errors or a general failure.
//

//do {
//    let message = try login(username: "admin", password: "123456")
//    print(message)
//} catch LoginError.invalidUsername {
//    print("Username is invalid")
//} catch LoginError.invalidPassword {
//    print("Password is too short")
//} catch {
//    print("Unknown login error")
//}



// ----------------------------------------------------------
// try? — OPTIONAL RESULT
// ----------------------------------------------------------
//
// try? converts a throwing function into an optional.
// If an error occurs, the result becomes nil.
//

//let safeResult = try? login(username: "admin", password: "123")
//print(safeResult as Any)   // nil



// ----------------------------------------------------------
// try! — FORCE UNWRAP (DANGEROUS)
// ----------------------------------------------------------
//
// try! assumes the function will NEVER throw.
// If it does throw, the app will CRASH.
//

//let forcedResult = try! login(username: "admin", password: "123456")
//print(forcedResult)
