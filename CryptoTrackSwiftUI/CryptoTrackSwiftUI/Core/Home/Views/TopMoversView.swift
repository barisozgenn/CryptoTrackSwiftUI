//
//  TopMoversView.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 14.09.2022.
//

import SwiftUI
struct TopMoversView: View {
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        VStack(alignment: .leading){
            Text("Top Gainers")
                .font(.title2)
                .fontWeight(.bold)
            
            ScrollView(.horizontal){
                HStack(spacing:8){
                    ForEach(viewModel.topCryptoCurrencies){cryptoCurrency in
                        TopMoversItemView(cryptoCurrency: cryptoCurrency)
                    }
                }
            }
        }.padding()
    }
}

struct TopMoversView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoversView(viewModel: HomeViewModel())
    }
}
