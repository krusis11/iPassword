//
//  ContentView.swift
//  iPassword
//
//  Created by Marcus on 04/02/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ViewModel()
    
    
    
    var body: some View {
        Form {
            Section("Options") {
                Toggle("Symbols", isOn: $vm.containsSymbols)
                Toggle("Uppercase", isOn: $vm.containsUppercase)
                Stepper("Character count: \(vm.length)", value: $vm.length, in: 6...18)
                
                VStack(alignment: .center, spacing: 2.0) {
                    Button("Generate passwords", action:  vm.createPassword)
                        .centerH()
                    
                }
                VStack(alignment: .center) {
                    Button("Delete All", action: vm.deleteAll)
                        .centerH()
                    
                }
            }
            
            Section("Passwords") {
                List(vm.passwords) { password in
                    HStack {
                        Text("\(password.password)")
                            .padding()
                            .textSelection(.enabled)
                            .deleteDisabled(false)
                        Spacer()
                        
                        Image(systemName: "lock.fill")
                            .foregroundColor(password.strengthColor)
                    }.onTapGesture {
                        print(password.id, password.password, password.index)
                        
                        
                    }
                }
                
            }
        }
        .addNavigationView(title: "iPassword")
        
        
    }

    
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

