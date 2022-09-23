//
//  PortfolioChart.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 23.09.2022.
//

import SwiftUI
struct PortfolioChart: View {
    var body: some View {
        
        HStack(spacing:0){
            
            // chart pie
            VStack{
                PieChartView(slices:[
                    PieChartModel(price: 4, color: .yellow, title: "BTC"),
                    PieChartModel(price: 1, color: .green, title: "ETH"),
                    PieChartModel(price: 5, color: .blue, title: "CAKE"),
                    PieChartModel(price: 4, color: .indigo, title: "MITH"),
                    PieChartModel(price: 2, color: .purple, title: "LIT")
                ])
            }
                .padding()
            
            // portfolio general values
            VStack(alignment: .trailing){
                
                Text("Amount (BTC)")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                Text("1.234")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.theme.primaryTextColor)
                
                Divider()
                
                Text("USD")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                Text((2412.65).toUSDCurrencyFormatted())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.theme.primaryTextColor)
                
                Divider()
                
                Text("Profit & Loss")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                Text((-14.29).toPercentString())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .fontWeight(.semibold)
                    .foregroundColor((-14.29).toPercentColor())
                
            }
            .padding()
            .frame(width: 140)
        }
    }
}

struct PortfolioChart_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioChart()
    }
}
