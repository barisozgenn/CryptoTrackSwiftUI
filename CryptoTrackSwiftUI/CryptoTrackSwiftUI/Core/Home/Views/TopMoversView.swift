//
//  TopMoversView.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 14.09.2022.
//

import SwiftUI

struct TopMoversView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Top Movers")
                .font(.title2)
                .fontWeight(.bold)
            
            ScrollView(.horizontal){
                HStack(spacing:8){
                    ForEach(0..<5, id: \.self){_ in
                        TopMoversItemView()
                    }
                }
            }
        }.padding()
    }
}

struct TopMoversView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoversView()
    }
}
