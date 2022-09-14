//
//  TopMoversItemView.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 14.09.2022.
//

import SwiftUI

struct TopMoversItemView: View {
    var body: some View {
        VStack(alignment: .leading,spacing: 2){
            // image
            Image(systemName: "bitcoinsign.circle.fill")
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
                .padding(.bottom,6)
            
            
            // coin info
            HStack(spacing : 2){
                Text("BTC")
                    .font(.caption)
                    .fontWeight(.bold)
                
                Text("$20.123.00")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        
            
            // coin percent change
            Text("+ 3.29%")
                .font(.title2)
                .foregroundColor(.green)
        }
        .frame(width: 120, height: 120)
        .overlay(
            RoundedRectangle(cornerRadius:14)
                .stroke(Color(.systemGray5), lineWidth: 2)
        )
       
    }
}

struct TopMoversItemView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoversItemView()
    }
}
