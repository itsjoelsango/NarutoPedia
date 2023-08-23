//
//  Discover.swift
//  NarutoWorld
//
//  Created by Jo Michael on 4/28/23.
//

import SwiftUI

struct Discover: View {
    
    @State private var searchText = ""
    @State private var isShowingSheetUserProfile = false
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Group {
                    HeroView()
                    
                    VStack {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                
                            TextField("Search...", text: $searchText, onEditingChanged: { status in
                                print(status)
                            })
                            .autocorrectionDisabled(true)
                            .onChange(of: searchText, perform: { newValue in
                                print(newValue)
                            })
                        }
                        .padding()
                        .foregroundColor(.black)
                        .background()
                        .cornerRadius(16)
                        
                    }
                    .padding([.leading, .trailing], 20)
                    .padding(.bottom)
                    .background(Color("background-color"))
                    
                    HStack(spacing: 10) {
                        Spacer()
                        Text("Filter")
                            .font(.subheadline)
                            .bold()
                        Button {
                            // Acrtion here
                        } label: {
                            Image(systemName: "slider.horizontal.3")
                        }
                    }
                    .padding([.top, .bottom], 10)
                    .padding(.trailing)
                    .background(Color.clear)
                }// end of group
                
                List {
                    ForEach(searchResults) { characterItem in
                        DiscoverRow(characterItem: characterItem)
                    }
                }
            }
            .navigationTitle("Discover")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    NarutoWorldLogo()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.isShowingSheetUserProfile.toggle()
                    } label: {
                        Image(systemName: "person.circle")
                    }
                    .fullScreenCover(isPresented: $isShowingSheetUserProfile) {
                        UserProfile()
                    }

                }
            }
        }
    }
    
    var searchResults: [CharacterItem] {
        if searchText.isEmpty {
            return modelData.characters
        }
        return modelData.characters.filter { $0.name.contains(searchText) }
    }
}


struct Discover_Previews: PreviewProvider {
    static var previews: some View {
        Discover()
            .environmentObject(ModelData())
    }
}
