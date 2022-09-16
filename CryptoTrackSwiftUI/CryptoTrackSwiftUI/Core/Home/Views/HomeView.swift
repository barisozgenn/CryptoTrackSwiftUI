//
//  HomeView.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 14.09.2022.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView{
            ZStack {
                ScrollView(.vertical, showsIndicators: false){
                    
                    // top movers view
                    TopMoversView(viewModel: viewModel)
                    
                    Divider()
                    
                    // all coins view
                    AllCoinsView(viewModel: viewModel)
                    
                }
                if viewModel.isLoading {
                    CustomLoadingIndicator()
                }
                
            }
            .background(Color.theme.appBackgroundColor)
            .navigationTitle("Live Datas")

        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
