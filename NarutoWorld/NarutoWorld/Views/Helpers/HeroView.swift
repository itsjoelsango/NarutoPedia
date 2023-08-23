//
//  HeroView.swift
//  NarutoWorld
//
//  Created by Jo Michael on 4/28/23.
//

import SwiftUI

struct HeroView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("Naruto World")
                    .foregroundColor(.yellow)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)
                
                HStack {
                    VStack {
                        Text("Welcome to Naruto world, a place where you find all informations of the Naruto Uzumaki and Shippuden characters in one place.")
                            .padding(.top, 10)
                        
                        Spacer()
                            
                    }
                    .frame(height: 160)
                    
                    Spacer()
                    
                    Image("pngegg-7")
                        .resizable()
                        .clipped()
                        .frame(width: 128, height: 160)
                        .cornerRadius(16)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(.clear, lineWidth: 4))
                        .shadow(radius: 10)
                }
            }
            .foregroundColor(.white)
            .padding([.leading, .trailing, .bottom], 20)
        }
        .background(Color("background-color"))
        .padding(.top)
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView()
    }
}
