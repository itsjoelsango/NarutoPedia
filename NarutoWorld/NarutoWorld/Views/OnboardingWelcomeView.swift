//
//  OnboardingWelcomeView.swift
//  NarutoWorld
//
//  Created by Jo Michael on 5/9/23.
//

import SwiftUI

struct OnboardingWelcomeView: View {
    @Binding var shouldShowOnBoarding: Bool
    
    var body: some View {
        ZStack {
//            background
            TabView {
                PageView(image: "pngegg-15", messageDescription: "Main character, Naruto Uzumaki, is a loud, hyperactive, adolescent ninja who constantly searches for approval and recognition, as well as to become Hokage, who is acknowledged as the leader and strongest of all ninja in the village.", showDismissButton: false, shouldShowOnBoarding: $shouldShowOnBoarding)
                
                PageView(image: "pngegg-21", messageDescription: "Home of the main characters of the series. Its government leader is the Fire Daimyō. The Land of Fire was the first country to adopt a ninja village, Konohagakure, a custom other countries would soon adopt. ", showDismissButton: false, shouldShowOnBoarding: $shouldShowOnBoarding)
                
                PageView(image: "pngegg-6", messageDescription: "Itachi the genjutsu master", showDismissButton: true, shouldShowOnBoarding: $shouldShowOnBoarding)
            }
            .tabViewStyle(PageTabViewStyle())
            .onAppear() {
                UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
                UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
            }
            .onDisappear {
                UIPageControl.appearance().currentPageIndicatorTintColor = .none
                UIPageControl.appearance().pageIndicatorTintColor = nil
            }
        }
    }
    
    var background: some View {
        LinearGradient(
            gradient: Gradient (stops: [
                .init (color: Color("background-color"), location: 0),
                .init (color: Color("background-color"), location: 1)]),
            startPoint: UnitPoint(x: 0.5000000291053439, y: 1.0838161507153998-8),
            endPoint: UnitPoint(x: -0.002089660354856915, y: 0.976613295904758))
        .ignoresSafeArea()
    }
}

struct PageView: View {
    var image: String
    var messageDescription: String?
    var showDismissButton: Bool
    @Binding var shouldShowOnBoarding: Bool
    
    var body: some View {
        ZStack {
            
            VStack {
                Spacer()
                Image(image)
                    .resizable()
                    .interpolation(.none)
                    .aspectRatio(contentMode: .fit)
                
                Text(messageDescription ?? "")
                    .foregroundColor(.primary)
                    .font(.title2)
                
                Spacer()
                
                if showDismissButton {
                    Button {
                        shouldShowOnBoarding.toggle()
                    } label: {
                        Text("Get Start")
                            .bold()
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .background(Color.pink)
                            .cornerRadius(6)
                            
                    }
                    .padding(.bottom)

                }
            }
            .padding([.leading, .trailing, .bottom], 20)
        }
    }
}

struct OnboardingWelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingWelcomeView(shouldShowOnBoarding: .constant(true))
    }
}
