//
//  PortfolioView.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 22.09.2022.
//

import SwiftUI

struct PortfolioView: View {
    var body: some View {
        HStack(spacing: 3){
            Text("left")
                .padding()
                .padding(.horizontal,20)
                .background(.gray)
            
            Text("right")
                .padding()
                .padding(.horizontal,40)
                .background(.yellow)
                .position(x:UIScreen.main.bounds.midX, y: 0)
                .offset(x: 0, y: 40)
        }
        .background(Color.red)
        .frame(height: 100)
       
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
    }
}
