//
//  RootView.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 18.09.2022.
//

import SwiftUI

struct RootView: View {
    
    @EnvironmentObject var launchScreenManager : LaunchScreenViewModel
    
    @StateObject private var viewModel = RootViewModel()
    
    var body: some View {
        ZStack{
            NavigationView{
                TabView{
                    MarketView()
                        .tabItem {
                            Image(systemName: "chart.xyaxis.line")
                            Text("Market")
                        }
                    
                    PortfolioView()
                        .tabItem {
                            Image(systemName: "chart.pie")
                            Text("Portfolio")
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
      
       
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(LaunchScreenViewModel())
    }
}
