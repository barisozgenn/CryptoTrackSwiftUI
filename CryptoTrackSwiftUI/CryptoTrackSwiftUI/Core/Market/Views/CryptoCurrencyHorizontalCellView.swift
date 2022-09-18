//
//  CryptoCurrencyHorizontalCellView.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 18.09.2022.
//

import SwiftUI
import Kingfisher

struct CryptoCurrencyHorizontalCellView: View {
    let cryptoCurrency : CryptoCurrency

    var body: some View {
        VStack(alignment: .leading,spacing: 2){
            // image
            KFImage(URL(string: cryptoCurrency.image))
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
                .padding(.bottom,6)
            
            
            // coin info
            HStack(spacing : 2){
                Text(cryptoCurrency.symbol.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.primaryTextColor)

                Text(cryptoCurrency.currentPrice.toUSDCurrency())
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        
            
            // coin percent change
            Text(cryptoCurrency.priceChangePercentage24H.toPercentString())
                .font(.title2)
                .foregroundColor(cryptoCurrency.priceChangePercentage24H.toPercentColor())
        }
        .frame(width: 150, height: 150)
        .background(Color.theme.itemBackgroundColor)
        .overlay(
            RoundedRectangle(cornerRadius:14)
                .stroke(Color(.systemGray5), lineWidth: 2)
        )
       
    }
}
struct CryptoCurrencyHorizontalCellView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoCurrencyHorizontalCellView(cryptoCurrency: dev.cryptoCurrency)
    }
}
