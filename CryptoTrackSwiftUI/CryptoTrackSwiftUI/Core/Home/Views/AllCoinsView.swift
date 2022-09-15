//
//  AllCoinsView.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 14.09.2022.
//

import SwiftUI

struct AllCoinsView: View {
    @StateObject var viewModel = HomeViewModel()
    
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
                HStack{
                    Text("Name")
                    Image(systemName: "arrowtriangle.down.fill")
                }
                .padding(.leading, 64)
                
                Spacer()
                Spacer()
                Spacer()
                
                
                HStack{
                    Text("Price")
                    Image(systemName: "arrowtriangle.down.fill")
                }
                
                Spacer()
                
                
                HStack{
                    Text("24h %")
                    Image(systemName: "arrowtriangle.down.fill")
                }
            }
            .font(.caption)
            .padding(.horizontal)
            .foregroundColor(.gray)
            
            // table list
            ScrollView{
                VStack{
                    ForEach(viewModel.cryptoCurrencies){cryptoCurrency in
                        NavigationLink{
                            CoinDetailView()
                        }
                    label:{
                        CoinCellView(cryptoCurrency: cryptoCurrency)
                    }
                        
                    }
                }
            }
        }
    }
}

/*struct AllCoinsView_Previews: PreviewProvider {
 static var previews: some View {
 AllCoinsView()
 }
 }*/
