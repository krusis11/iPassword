//
//  Content-ViewModel.swift
//  iPassword
//
//  Created by Marcus on 04/02/2023.
//

import Foundation
import SwiftUI

extension ContentView {
    
    class ViewModel: ObservableObject{
        @Published var passwords: [Password] = []
        @Published var containsSymbols = true
        @Published var containsUppercase = true
        @Published var length = 10
        @Published var index = 0
        
//        init() {
//            createPassword()
//        }
        
        func createPassword() {
            let alphabet = "abcdefghijklmnopqrstuvwxyz"
            var base = alphabet + "1234567890"
            var newPassword = ""
            
            if containsSymbols {
                base += "!@#$%^&*()"
            }
            if containsUppercase {
                base += alphabet.uppercased()
            }
            for _ in 0..<length {
                let randChar = base.randomElement()!
                newPassword += String(randChar)
            }
            let password = Password(password: newPassword, containsSymbols: containsSymbols, containsUppercase: containsUppercase, index: index)
            
            withAnimation {
                passwords.insert(password, at: 0)
                
            }
            print(passwords.count)
            index += 1
        }
        func deleteAll() {
            print(passwords)
            passwords.removeAll(keepingCapacity: true)
            index = 0
        }
    }
}
