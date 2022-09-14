//
//  AllCoinsView.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 14.09.2022.
//

import SwiftUI

struct AllCoinsView: View {
    var body: some View {
        VStack(alignment: .leading){
            
            // page title
            Text("Popular Cryptocurrencies")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom)
                .padding(.leading)
        
            // table titles
            HStack{
                Text("Name")
                Spacer()
                Spacer()
                Spacer()
                Text("Last Price")
                Spacer()
                Text("24h chg%")
            }
            .font(.caption)
            .padding(.horizontal)
            .foregroundColor(.gray)
            
            // table list
            ScrollView{
                VStack{
                    ForEach(0..<60, id: \.self){_ in
                        CoinCellView()
                    }
                }
            }
        }
    }
}

struct AllCoinsView_Previews: PreviewProvider {
    static var previews: some View {
        AllCoinsView()
    }
}
