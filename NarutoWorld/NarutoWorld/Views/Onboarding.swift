//
//  Onboarding.swift
//  NarutoWorld
//
//  Created by Jo Michael on 5/5/23.
//

import SwiftUI

let keyFirstName = "kFirstName"
let keyLastName = "kLastName"
let keyEmail = "kEmail"
let keyIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    
    @State private var isLoggedIn = false
    @State private var showFormInvalidMessage = false
    @State private var errorMessage = ""
    
    @AppStorage("shouldShowOnBoarding") var shouldShowOnBoarding = true
    
//    @State var shouldShowOnBoarding = true
     
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                        EmptyView()
                    }
                    
                    Group {
                        HStack {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Hello")
                                    .bold()
                                
                                Text("Let's get started!")
                            }
                            .font(.title)

                            Spacer()
                        }
                        .padding([.leading, .trailing], 20)
                    }
                    
                    Group {
                        VStack(alignment: .center) {
                            Text("Sign up")
                                .font(.largeTitle)
                        }
                        .padding(.top, 20)
                    }
                    
                    VStack {
                        
                        VStack(spacing: 20) {
                            VStack(alignment:.leading) {
                                Text("First name*")
                                    .font(.subheadline)
                                
                                TextField("Eg. John", text: $firstName)
                                    .padding()
                                    .overlay(RoundedRectangle(cornerRadius: 10.0)
                                        .strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1.0)))
                            }
                            
                            VStack(alignment:.leading) {
                                Text("Last name*")
                                    .font(.subheadline)
                                
                                TextField("Eg. Doe", text: $lastName)
                                    .padding()
                                    .overlay(RoundedRectangle(cornerRadius: 10.0)
                                        .strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1.0)))
                            }
                            
                            VStack(alignment:.leading) {
                                Text("Email*")
                                    .font(.subheadline)
                                
                                TextField("somemail@mail", text: $email)
                                    .padding()
                                    .overlay(RoundedRectangle(cornerRadius: 10.0)
                                        .strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1.0)))
                                    .keyboardType(.emailAddress)
                                    .textContentType(.emailAddress)
                                    .disableAutocorrection(true)
                                    .autocapitalization(.none)
                            }
                        }
                        .padding(.bottom)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                        
                        // Register button
                        Button(action: {
                            validateForm()
                        }, label: {
                            Text("Create an account")
                                .bold()
                                .foregroundColor(.white)
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .padding()
                                .background(Color("background-color"))
                                .cornerRadius(16)
                        })
                    }
                } // Enf of the main Vstack
                .onAppear {
                    if UserDefaults.standard.bool(forKey: keyIsLoggedIn) {
                        self.isLoggedIn = true
                    }
                }
            } // End of ScrollView
            .padding()
            .alert("ERROR", isPresented: $showFormInvalidMessage, actions: {
                Button("OK", role: .cancel) { }
            }, message: {
                Text(self.errorMessage)
            })
        } // End of NavigationView
        .fullScreenCover(isPresented: $shouldShowOnBoarding) {
            OnboardingWelcomeView(shouldShowOnBoarding: $shouldShowOnBoarding)
        }
    }
    
    private func validateForm () {
        
        // customerName must contain just letters
        let firstNameIsValid = isValid(firstName: firstName)
        let lastNameIsValid = isValid(lastName: lastName)
        let emailIsValid = isValidEmailAddress(email: email)
        
        guard firstNameIsValid && lastNameIsValid && emailIsValid
        else {
            var invalidFirstNameMessage = ""
            if firstName.isEmpty || !isValid(firstName: firstName) {
                invalidFirstNameMessage = "First Name can only contain letters and must have at least 3 characters\n\n"
            }
            
            var invalidLastNameMessage = ""
            if lastName.isEmpty || !isValid(lastName: lastName) {
                invalidLastNameMessage = "Last Name can only contain letters and must have at least 3 characters\n\n"
            }
            
            var invalidEmailMessage = ""
            if email.isEmpty || !isValidEmailAddress(email: email) {
                invalidEmailMessage = "The e-mail is invalid and cannot be blank."
            }
            
            self.errorMessage = "Found these erros in the form:\n\n \(invalidFirstNameMessage)\(invalidLastNameMessage)\(invalidEmailMessage)"
            
            showFormInvalidMessage.toggle()
            return
        }
        
        // Form is Valid, proceed
        
        // Save data with UserDefaults
        UserDefaults.standard.set(firstName, forKey: keyFirstName)
        UserDefaults.standard.set(lastName, forKey: keyLastName)
        UserDefaults.standard.set(email, forKey: keyEmail)
        UserDefaults.standard.set(true, forKey: keyIsLoggedIn)
        self.isLoggedIn.toggle()
        
    }
    
    private func isValid(firstName: String) -> Bool {
        guard !firstName.isEmpty, firstName.count > 2 else { return false }
        for chr in firstName {
            if (!(chr >= "a" && chr <= "z") && !(chr >= "A" && chr <= "Z") && !(chr == " ") ) {
                return false
            }
        }
        return true
    }
    
    private func isValid(lastName: String) -> Bool {
        guard !lastName.isEmpty, lastName.count > 2 else { return false }
        for chr in lastName {
            if (!(chr >= "a" && chr <= "z") && !(chr >= "A" && chr <= "Z") && !(chr == " ") ) {
                return false
            }
        }
        return true
    }
    
    private func isValidEmailAddress(email: String) -> Bool {
        guard !email.isEmpty else { return false }
        let emailValidationRegex = "^[\\p{L}0-9!#$%&'*+\\/=?^_`{|}~-][\\p{L}0-9.!#$%&'*+\\/=?^_`{|}~-]{0,63}@[\\p{L}0-9-]+(?:\\.[\\p{L}0-9-]{2,7})*$"
        let emailValidationPredicate = NSPredicate(format: "SELF MATCHES %@", emailValidationRegex)
        return emailValidationPredicate.evaluate(with: email)
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
