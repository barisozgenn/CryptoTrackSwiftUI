//
//  MarketView.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 18.09.2022.
//

import SwiftUI

struct MarketView: View {
    
    @StateObject var viewModel = MarketViewModel()
    
    var body: some View {
        NavigationView{
                ScrollView(.vertical, showsIndicators: false){

                    VStack{
                        // arrow and indicator
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundColor(.orange)
                            .offset(y: -170)
                        
                        // top movers view
                        CryptoCurrencyHorizontalListView(viewModel: viewModel)
                        
                        Divider()
                        
                        // all coins view
                        CryptoCurrencyListView(viewModel: viewModel)
                    }
                    
                    
                }
                
                if viewModel.isLoading {
                    CustomLoadingIndicator()
                }
                
            }
            .refreshable {
                viewModel.refreshData()
            }
            .background(Color.theme.appBackgroundColor)
            .navigationTitle("Live Datas")
        
    }
}

struct MarketView_Previews: PreviewProvider {
    static var previews: some View {
        MarketView()
    }
}
