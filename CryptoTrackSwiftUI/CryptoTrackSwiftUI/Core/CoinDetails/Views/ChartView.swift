//
//  ChartView.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 15.09.2022.
//

import SwiftUI

struct ChartView: View {
    let viewModel : CoinDetailViewModel
    
    var body: some View {
        VStack{
            Chart{
                ForEach(viewModel.chartData){ item in
                    LineMark(
                        x: .value("Date", item.date),
                        y:.value("Price", item.price)
                    )
                }
            }
        }
       
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(viewModel: CoinDetailViewModel(cryptoCurrency: dev.cryptoCurrency))
    }
}
