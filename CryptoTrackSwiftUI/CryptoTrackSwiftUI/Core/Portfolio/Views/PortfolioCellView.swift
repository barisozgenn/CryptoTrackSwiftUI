//
//  PortfolioCellView.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 23.09.2022.
//

import SwiftUI

struct PortfolioCellView: View {
  
        let cryptoCurrency : CryptoCurrency
        
        init(cryptoCurrency : CryptoCurrency){
            self.cryptoCurrency = cryptoCurrency
            print("Loading row \(cryptoCurrency.marketCapRank)")
        }
        var body: some View {
            HStack{
                // image
                HStack{
                    
                    // image
                    CurrencyImageView(cryptoCurrency: cryptoCurrency)
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .padding(.leading, 4)
                    
                }
                .frame(alignment: .leading)
                
                // name & symbol
                VStack(alignment: .leading,spacing:0){
                    Text(cryptoCurrency.symbol.uppercased())
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.theme.primaryTextColor)
                        .frame(alignment: .leading)
                    
                }
                .frame(width: 45, alignment: .leading)
                
                // 24h Change
                VStack{
                    Text(cryptoCurrency.priceChangePercentage24H.toPercentString())
                        .font(.system(size: 11))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                .frame(width: 55)
                .padding(.vertical, 11)
                .padding(.horizontal,3)
                .background(cryptoCurrency.priceChangePercentage24H.toPercentColor())
                .cornerRadius(4)
               
                Spacer()
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: 50)
                
                // Avg price
                VStack(alignment: .trailing, spacing: 1){
                    Text(cryptoCurrency.currentPrice.toUSDCurrencyFormatted())
                        .font(.system(size:
                                        cryptoCurrency.currentPrice > 0.0001 ? 14 : 12)  )
                        .fontWeight(.semibold)
                        .foregroundColor(Color.theme.primaryTextColor)
                    
                    Text("100.000.345")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                }
                .frame(width: 80,alignment: .trailing)
                
                // last price
                VStack(alignment: .trailing, spacing: 1){
                    Text(cryptoCurrency.currentPrice.toUSDCurrencyFormatted())
                        .font(.system(size:
                                        cryptoCurrency.currentPrice > 0.0001 ? 14 : 12)  )
                        .fontWeight(.semibold)
                        .foregroundColor(Color.theme.primaryTextColor)
                    
                    Text(cryptoCurrency.priceChangePercentage24H.toPercentString())
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(cryptoCurrency.priceChangePercentage24H.toPercentColor())
                }
                .frame(width: 80,alignment: .trailing)
                
                
            }
            .background(Color.theme.itemBackgroundColor)
            .padding(.horizontal,4)
        }
    
    
}

struct PortfolioCellView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioCellView(cryptoCurrency: dev.cryptoCurrency)
    }
}
