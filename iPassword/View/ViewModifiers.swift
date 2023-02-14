//
//  ViewModifiers.swift
//  iPassword
//
//  Created by Marcus on 04/02/2023.
//

import Foundation
import SwiftUI

extension View {
    func centerH() -> some View {
        HStack {
            Spacer()
           self
            Spacer()
        }
    }
    
    func addNavigationView(title: String) -> some View {
        NavigationView {
            self
                .navigationTitle(title)
                
                
        }
    }
}
