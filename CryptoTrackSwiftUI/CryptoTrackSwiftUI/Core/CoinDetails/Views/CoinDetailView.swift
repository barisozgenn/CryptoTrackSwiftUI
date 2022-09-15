//
//  CoinDetailView.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 15.09.2022.
//

import SwiftUI

struct CoinDetailView: View {
    let viewModel : CoinDetailViewModel
    
    init(cryptoCurrency: CryptoCurrency){
        self.viewModel = CoinDetailViewModel(cryptoCurrency: cryptoCurrency)
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                // chart
                ChartView(viewModel: viewModel)
                    .frame(height:272)
                    .padding(.vertical)
                
                // overview
                CoinDetailSection(model: viewModel.overviewSectionModel)
                    .padding(.vertical)
                
                // additional details
                CoinDetailSection(model: viewModel.additionalDetailSectionModel)
                    .padding(.vertical)
            }
            
            .navigationTitle("Bitcoin")
            .padding()
        }
    }
}

struct CoinDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailView(cryptoCurrency: dev.cryptoCurrency)
    }
}
