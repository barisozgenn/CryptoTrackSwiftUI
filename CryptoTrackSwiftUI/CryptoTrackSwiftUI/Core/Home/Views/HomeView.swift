//
//  HomeView.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 14.09.2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                
                // top movers view
                TopMoversView()
                
                Divider()
                
                // all coins view
                AllCoinsView()
                
            }.navigationTitle("Live Datas")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
