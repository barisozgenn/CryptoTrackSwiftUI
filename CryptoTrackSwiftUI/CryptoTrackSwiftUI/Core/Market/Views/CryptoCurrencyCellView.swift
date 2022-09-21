//
//  CryptoCurrencyCellView.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 18.09.2022.
//

import SwiftUI
import Kingfisher

struct CryptoCurrencyCellView:View {
    
    let cryptoCurrency : CryptoCurrency
    
    init(cryptoCurrency : CryptoCurrency){
        self.cryptoCurrency = cryptoCurrency
        print("Loading row \(cryptoCurrency.marketCapRank)")
    }
    var body: some View {
        HStack{
            HStack{
                // market rank
                Text("\(cryptoCurrency.marketCapRank)")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .frame(width: 25, alignment: .center)
                
                // image
                CurrencyImageView(cryptoCurrency: cryptoCurrency)
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                
            }
            
            // name
            VStack(alignment: .leading,spacing:0){
                Text(cryptoCurrency.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.theme.primaryTextColor)
                    .frame(alignment: .leading)
                
                Text(cryptoCurrency.symbol.uppercased())
                    .font(.caption)
                    .foregroundColor(.gray)
                    .frame(alignment: .leading)
                
            }
            .frame(width: 120, alignment: .leading)
            
            // last price
            VStack(alignment: .trailing, spacing: 1){
                Text(cryptoCurrency.currentPrice.toUSDCurrency())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(cryptoCurrency.priceChangePercentage24H.toPercentColor())
                
                Text(cryptoCurrency.currentPrice.toUSDCurrency())
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(width: 90,alignment: .trailing)
            
            // 24h Change
            VStack{
                Text(cryptoCurrency.priceChangePercentage24H.toPercentString())
                    .font(.caption)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                    .foregroundColor(.white)
            }
            .frame(width: 61)
            .padding(.all, 10)
            .background(cryptoCurrency.priceChangePercentage24H.toPercentColor())
            .cornerRadius(4)
        }
        .padding(.horizontal)
        .padding(.vertical , 4)
        .background(Color.theme.itemBackgroundColor)
        
    }
}

struct CryptoCurrencyCellView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoCurrencyCellView(cryptoCurrency: dev.cryptoCurrency)
    }
}
