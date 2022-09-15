//
//  CoinDetailView.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 15.09.2022.
//

import SwiftUI

struct CoinDetailView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                // chart
                
                // overview
                //CoinDetailSection() .padding(.vertical)
                
                // additional details
               //CoinDetailSection() .padding(.vertical)
            }
        }
        .padding()
        .navigationTitle("Bitcoin")
    }
}

struct CoinDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailView()
    }
}
