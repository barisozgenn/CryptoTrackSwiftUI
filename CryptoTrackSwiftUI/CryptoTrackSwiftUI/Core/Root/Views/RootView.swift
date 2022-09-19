//
//  RootView.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 18.09.2022.
//

import SwiftUI

struct RootView: View {
    
    @EnvironmentObject var launchScreenManager : LaunchScreenViewModel
    
    var body: some View {
        TabView{
            MarketView()
        }
        .onAppear{
            DispatchQueue
                .main
                .asyncAfter(deadline: .now() + 1.74 ) {
                    launchScreenManager.dismiss()
                }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(LaunchScreenViewModel())
    }
}
