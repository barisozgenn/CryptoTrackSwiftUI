//
//  PortfolioListView.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 23.09.2022.
//

import SwiftUI

struct PortfolioListView: View {
    @StateObject var viewModel = MarketViewModel()

    var body: some View {
        NavigationView{
            VStack(alignment: .trailing){
                HStack{
                    // search bar
                    SearchBarView(searchText: $viewModel.searchText)
                    
                    // add portfolio button
                    AddButton()
                }
                .padding(.trailing, 10)
                
                // table title
                PortfolioTableTitleView()
                
                // portfolio list view
                ScrollView(showsIndicators: false){
                    LazyVStack(spacing: 14){
                        
                        ForEach(viewModel.cryptoCurrencies){cryptoCurrency in
                            
                            NavigationLink{
                                LayzNavigationView(build: CoinDetailView(cryptoCurrency: cryptoCurrency))
                                
                            }
                        label:{
                            
                            PortfolioCellView(cryptoCurrency: cryptoCurrency)
                            
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
}

struct PortfolioListView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioListView()
    }
}
