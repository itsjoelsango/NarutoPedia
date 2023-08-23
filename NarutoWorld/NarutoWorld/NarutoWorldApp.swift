//
//  NarutoWorldApp.swift
//  NarutoWorld
//
//  Created by JS on 4/28/23.
//

import SwiftUI

@main
struct NarutoWorldApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            Onboarding()
                .environmentObject(modelData)
        }
    }
}
