//
//  PasswordModel.swift
//  iPassword
//
//  Created by Marcus on 04/02/2023.
//

import Foundation
import SwiftUI

struct Password: Identifiable, Codable {
    var id=UUID()
    var password: String
    var containsSymbols: Bool
    var containsUppercase: Bool
    var index: Int
    
    var strengthColor: Color {
        var strength = 0
        var color: Color
        
        if containsSymbols {
            strength += 1
        }
        if containsUppercase {
            strength += 1
        }
        if password.count > 12 {
            strength += 1
        } else if password.count > 6 {
            strength -= 1
        }
        
        switch strength {
        case 1: color = .green
        case 2: color = .yellow
        case 3: color = .red
        default: color = .black
        
        }
        return color
        }
    }
struct deleting: Codable {
    func print() {
        Swift.print(Password.ID.self())
    }

    func delete() {
        
            }
    
}

