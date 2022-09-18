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
            
        }
        .navigationBarTitleDisplayMode(.automatic)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack {
                    Image(uiImage: UIImage(named: "logo-crypto-track")!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32)
                    Text("CryptoTrack").font(.headline)
                }
            }
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
