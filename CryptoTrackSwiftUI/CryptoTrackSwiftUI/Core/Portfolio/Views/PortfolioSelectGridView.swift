//
//  PortfolioSelectGridView.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 24.09.2022.
//

import SwiftUI

struct PortfolioSelectGridView: View {
    @StateObject var viewModel : MarketViewModel

    private let adaptiveCell = [GridItem(.adaptive(minimum:86))]
                                         
    var body: some View {
        VStack {
            // search bar
            SearchBarView(searchText: $viewModel.searchText)
            
            // portfolio list view
            ScrollView(showsIndicators: false){
                LazyVGrid(columns: adaptiveCell, spacing: 4){
                    
                    ForEach(viewModel.cryptoCurrencies){cryptoCurrency in
                        
                        NavigationLink{
                            LayzNavigationView(build: CoinDetailView(cryptoCurrency: cryptoCurrency))
                            
                        }
                    label:{
                        
                        PortfolioSelectCellView(cryptoCurrency: cryptoCurrency)
                        
                    }
                        
                    }
                }
            }
        }
    }
}

struct PortfolioSelectGridView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioSelectGridView(viewModel: MarketViewModel())
    }
}
