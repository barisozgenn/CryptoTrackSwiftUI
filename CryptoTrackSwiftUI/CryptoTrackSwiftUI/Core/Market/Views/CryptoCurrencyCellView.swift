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
    
    var body: some View {
        HStack{
            // market rank
            Text("\(cryptoCurrency.marketCapRank)")
                .font(.caption)
                .foregroundColor(.gray)
            
            // image
            KFImage(URL(string: cryptoCurrency.image))
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                
            // name
            VStack(alignment: .leading, spacing: 4){
                Text(cryptoCurrency.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.theme.primaryTextColor)
                    .padding(.leading, 4)
                
                Text(cryptoCurrency.symbol.uppercased())
                    .font(.caption)
                    .padding(.leading, 6)
                    .foregroundColor(.gray)
            }
            .padding(.leading,2)
            
            Spacer()
            Spacer()
            Spacer()
            
            // last price
            VStack(alignment: .leading, spacing: 4){
                Text(cryptoCurrency.currentPrice.toUSDCurrency())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(cryptoCurrency.priceChangePercentage24H.toPercentColor())
                
                Text(cryptoCurrency.currentPrice.toUSDCurrency(minDigit: 2, maxDigit: 4))
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            
            Spacer()
            
            
            // 24h Change
            VStack{
                Text(cryptoCurrency.priceChangePercentage24H.toPercentString())
                    .font(.caption)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                    .foregroundColor(.white)
            }
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
