//
//  CoinCellView.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 14.09.2022.
//

import SwiftUI

struct CoinCellView: View {
    var body: some View {
        HStack{
            // market rank
            Text("X.")
                .font(.caption)
                .foregroundColor(.gray)
            
            // image
            Image(systemName: "bitcoinsign.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
                
            // name
            VStack(alignment: .leading, spacing: 4){
                Text("Bitcoin")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Text("BTC")
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
                Text("20.123,45")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.green)
                
                Text("$20.123.450")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            
            Spacer()
            
            
            // 24h Change
            VStack{
                Text("+%7,29")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                    .foregroundColor(.white)
            }
            .padding(.all, 10)
            .background(.green)
            .cornerRadius(4)
        }
        .padding(.horizontal)
        .padding(.vertical , 4)
    }
}

struct CoinCellView_Previews: PreviewProvider {
    static var previews: some View {
        CoinCellView()
    }
}
