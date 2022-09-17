//
//  CryptoTrackSwiftUIApp.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 14.09.2022.
//

import SwiftUI

@main
struct CryptoTrackSwiftUIApp: App {
    
    @StateObject var launchScreenManager = LaunchScreenViewModel()
    
    var body: some Scene {
        WindowGroup {
            ZStack{
                HomeView()
                
                if launchScreenManager.state != .completed{
                    LaunchScreenView()
                }
                
            }
            .environmentObject(launchScreenManager)
            
        }
    }
}
