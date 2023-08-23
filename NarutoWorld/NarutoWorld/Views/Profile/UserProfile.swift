//
//  UserProfile.swift
//  NarutoWorld
//
//  Created by Jo Michael on 5/2/23.
//

import SwiftUI

struct UserProfile: View {
    private let userdefaultFirstName = UserDefaults.standard.string(forKey: keyFirstName)
    private let userdefaultLastname = UserDefaults.standard.string(forKey: keyLastName)
    private let userdefaultEmail = UserDefaults.standard.string(forKey: keyEmail)
    
    @Environment(\.presentationMode) var presentation
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("background-color")
                    .opacity(1)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 88, height: 88)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                VStack(alignment: .leading, spacing: 10){
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text("Firstname")
                                            .bold()
                                        Text(userdefaultFirstName ?? "Ashirama")
                                    }
                                    
                                    VStack(alignment: .leading, spacing: 0){
                                        Text("Lastname")
                                            .bold()
                                        Text(userdefaultLastname ?? "Sendju")
                                    }
                                    
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text("Email")
                                            .bold()
                                        Text(userdefaultEmail ?? "email@mail.com")
                                    }
                                    
                                }

                                                            
                                Spacer()
                            }
          
                            VStack(alignment: .leading) {
                                Text("About Me")
                                    .bold()
                                
                                Text("This is a very long text that i want to see if it going to wrapper or overlay everything that is on its way so that everybody will see that this text is very long on it own.")
                                    .font(.body)
                            }
                            
                        }
                        
                        VStack {
                            Button {
                                UserDefaults.standard.set(false, forKey: keyIsLoggedIn)
                                self.presentation.wrappedValue.dismiss()
                            } label: {
                                Text("Log out")
                                    .bold()
                                    .padding([.all], 10)
                                    .background(.red)
                                    .cornerRadius(6)
                            }
                        }
                        
                    }
                    .foregroundColor(Color.white)
                    .padding()
//                    .frame(width: .infinity)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleTextColor(.white)
            .font(.title2)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Label("dismiss", systemImage: "xmark")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // configuration action here
                    } label: {
                        Label("Settings", systemImage: "gearshape")
                    }

                }
            }
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
