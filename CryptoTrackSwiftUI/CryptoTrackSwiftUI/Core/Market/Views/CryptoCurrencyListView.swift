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
        VStack(){
    
            // search bar
            SearchBarView(searchText: $viewModel.searchText)
            
            // table titles
            HStack{
                HStack{
                    Text("#")
                        .frame(width: 25, alignment: .center)
                }
                .onTapGesture {
                    viewModel.sortList(type: .rank)
                }
                
                HStack{
                    Text("Name")
                    Image(systemName: viewModel.btnNameImageDirection)
                }
                .onTapGesture {
                    viewModel.sortList(type: .name)
                }
                .withSortButtonViewModifier(frameWidth: 120, isClicked: viewModel.isClickedBtnName)
                
                
                HStack{
                    Text("Price")
                    Image(systemName: viewModel.btnPriceImageDirection)
                }
                .onTapGesture {
                    viewModel.sortList(type: .price)
                }
                .withSortButtonViewModifier(frameWidth: 90, isClicked: viewModel.isClickedBtnPrice)
                
                
                HStack{
                    Text("24h %")
                    Image(systemName: viewModel.btnPercentageImageDirection)
                }
                .onTapGesture {
                    viewModel.sortList(type: .percentage)
                }
                .withSortButtonViewModifier(frameWidth: 80, isClicked: viewModel.isClickedBtnPercentage)
            }
           
            // table list
            ScrollView(showsIndicators: false){
                LazyVStack(spacing: 14){
                    
                    ForEach(viewModel.cryptoCurrencies){cryptoCurrency in
                        
                        NavigationLink{
                            LayzNavigationView(build: CoinDetailView(cryptoCurrency: cryptoCurrency))
                            
                        }
                    label:{
                        
                        CryptoCurrencyCellView(cryptoCurrency: cryptoCurrency)
                        
                      
                    }
                        
                    }
                }
            }
            .refreshable {
                viewModel.refreshData()
            }
        }
    }
}

struct CryptoCurrencyListView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoCurrencyListView()
    }
}
