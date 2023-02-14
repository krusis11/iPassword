//
//  ContentView.swift
//  iPassword
//
//  Created by Marcus on 04/02/2023.
//

import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
    @StateObject private var vm = ViewModel()
    private let pastboard = UIPasteboard.general
    var body: some View {
        Form {
            Section("Options") {
                Toggle("Symbols", isOn: $vm.containsSymbols)
                Toggle("Uppercase", isOn: $vm.containsUppercase)
                Stepper("Character count: \(vm.length)", value: $vm.length, in: 6...18)
            }
            Section("") {
                HStack(alignment: .center) {
                    Button("Generate passwords", action:  vm.createPassword)
                .centerH()
                
                        .foregroundColor(.blue)
                }
                HStack(alignment: .center) {
                    Button("Delete All", action: vm.deleteAll)
                    .centerH()
                        ._colorMonochrome(.red)
                        .buttonStyle(.bordered)
                    
                }
                
            }
            Section("Passwords") {
                List(vm.passwords) { password in
                    HStack {
                        Text("\(password.password)")
                        // .swipeActions(content: EditActions)
                            .padding()
                            .textSelection(.enabled)
                            .deleteDisabled(false)
                       
                            .contextMenu {
                                Button {
                                    // Add this item to a list of favorites.
                                    UIPasteboard.general.string = ("\(password.password)")
                                } label: {
                                    Label("Kopiuj", systemImage: "doc.on.doc")
                                }
                                Button {
                                    vm.passwords.remove(at: password.index)
                                    print(password.id)
                                    print(password.index)
                                    print($vm.passwords.count)
                                        
                                    
                                } label: {
                                    Label("Usuń", systemImage: "trash")
                                }
                            }
                        Spacer()
                        
                        Image(systemName: "lock.fill")
                            .foregroundColor(password.strengthColor)
                        //.onTapGesture(perform: vm.passwords.remove(at: self.index))
                    }
                    .onTapGesture() {
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

