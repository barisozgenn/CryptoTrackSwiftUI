//
//  CryptoCurrencyHorizontalListView.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 18.09.2022.
//

import SwiftUI

struct CryptoCurrencyHorizontalListView:  View {
    @StateObject var viewModel = MarketViewModel()
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Top Gainers")
                .font(.title2)
                .fontWeight(.bold)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing:8){
                    ForEach(viewModel.topCryptoCurrencies){cryptoCurrency in
                        NavigationLink{
                            LayzNavigationView(build: CoinDetailView(cryptoCurrency: cryptoCurrency))
                        }
                    label:{
                        CryptoCurrencyHorizontalCellView(cryptoCurrency: cryptoCurrency)
                    }
                        
                    }
                }
            }
        }.padding()
    }
}

struct CryptoCurrencyHorizontalListView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoCurrencyHorizontalListView()
    }
}
