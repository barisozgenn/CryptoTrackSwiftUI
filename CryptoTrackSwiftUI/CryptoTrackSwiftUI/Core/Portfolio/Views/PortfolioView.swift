//
//  PortfolioView.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 23.09.2022.
//

import SwiftUI

struct PortfolioView: View {
    var body: some View {
        VStack{
            // head view
            PortfolioChart()
            
            // list view
            PortfolioListView()
        }
        .background(Color.theme.appBackgroundColor)
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
    }
}
