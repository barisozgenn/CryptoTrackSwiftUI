//
//  CryptoCurrencyListView.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 18.09.2022.
//

import SwiftUI

struct CryptoCurrencyListView: View {
    @StateObject var viewModel = MarketViewModel()
    
    var body: some View {
        VStack(alignment: .leading){
            
            // page title
            Text("Cryptocurrencies")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom)
                .padding(.leading)
            
            // table titles
            HStack{
                HStack{
                    Text("#")
                }
                .padding(.leading, -3)
                .onTapGesture {
                    viewModel.sortList(type: .rank)
                }
                
                HStack{
                    Text("Name")
                    Image(systemName: viewModel.btnNameImageDirection)
                }
                .padding(.leading, 45)
                .onTapGesture {
                    viewModel.sortList(type: .name)
                }
                .foregroundColor(viewModel.isClickedBtnName ? .orange : .gray)
                .fontWeight(viewModel.isClickedBtnName ? .bold : .regular)
                
                Spacer()
                Spacer()
                Spacer()
                
                
                HStack{
                    Text("Price")
                    Image(systemName: viewModel.btnPriceImageDirection)
                }
                .onTapGesture {
                    viewModel.sortList(type: .price)
                }
                .foregroundColor(viewModel.isClickedBtnPrice ? .orange : .gray)
                .fontWeight(viewModel.isClickedBtnPrice ? .bold : .regular)
                
                Spacer()
                
                
                HStack{
                    Text("24h %")
                    Image(systemName: viewModel.btnPercentageImageDirection)
                }
                .onTapGesture {
                    viewModel.sortList(type: .percentage)
                }
                .foregroundColor(viewModel.isClickedBtnPercentage ? .orange : .gray)
                .fontWeight(viewModel.isClickedBtnPercentage ? .bold : .regular)
            }
            .font(.caption)
            .padding(.horizontal)
            .foregroundColor(.gray)
            
            // table list
            ScrollView(showsIndicators: false){
                VStack{
                    ForEach(viewModel.cryptoCurrencies){cryptoCurrency in
                        NavigationLink{
                            // LazyVStack search
                            LayzNavigationView(build: CoinDetailView(cryptoCurrency: cryptoCurrency))
                        }
                    label:{
                        CryptoCurrencyCellView(cryptoCurrency: cryptoCurrency)
                    }
                        
                    }
                }
            }
            
        }
    }
}

struct CryptoCurrencyListView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoCurrencyListView()
    }
}
