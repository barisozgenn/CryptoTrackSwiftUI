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
        ScrollView(showsIndicators: false) {
            // chart
            ChartView(viewModel: viewModel)
                .frame(height:272)
                .padding(.vertical)
                .shadow(color: viewModel.chartGraphicLineColor,radius: 12)
                .shadow(color: viewModel.chartGraphicLineColor.opacity(0.7),radius: 14)
            
            // overview
            CoinDetailSection(model: viewModel.overviewSectionModel)
                .padding(.vertical)
            
            // additional details
            CoinDetailSection(model: viewModel.additionalDetailSectionModel)
                .padding(.vertical)
        }
        .padding()
        .navigationTitle(viewModel.currencyName)
    }
}

struct CoinDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailView(cryptoCurrency: dev.cryptoCurrency)
    }
}
