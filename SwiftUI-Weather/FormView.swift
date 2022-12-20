//
//  FormView.swift
//  SwiftUI-Weather
//
//  Created by Thenya Kamau on 19/12/2022.
//

import SwiftUI

struct FormView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var birthDate = Date()
    @State private var shouldSendNewLetter = false
    @State private var numberOfLikes = 1
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Personal Information")){
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    DatePicker("Birth Date", selection: $birthDate, displayedComponents: .date)
                }
                
                Section(header: Text("Actions")) {
                    Toggle("Send Newsletter", isOn: $shouldSendNewLetter).toggleStyle(SwitchToggleStyle(tint: .red))
                    Stepper("Number Of Likes", value: $numberOfLikes, in: 1...100)
                    Text("This video has \(numberOfLikes) likes")
                    Link("Terms of Service", destination: URL(string: "https://example.com")!)
                }

            }
            .navigationTitle(Text("Account"))
            .toolbar{
                ToolbarItemGroup(placement:.navigationBarTrailing){
                    Button(action: {
                        hideKeyboard()
                    }, label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    })
                    
                    Button("Save", action: saveUser)
                }
            }
        }.accentColor(.red)
    }
    
    func saveUser() {
        print("User is saved")
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
