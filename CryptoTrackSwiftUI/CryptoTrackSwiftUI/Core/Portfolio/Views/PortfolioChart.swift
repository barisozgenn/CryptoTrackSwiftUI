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
                    PieChartModel(price: 4, color: .orange, title: "BTC"),
                    PieChartModel(price: 2, color: .green, title: "ETH"),
                    PieChartModel(price: 5, color: .teal, title: "CAKE"),
                    PieChartModel(price: 4, color: .yellow, title: "MITH"),
                    PieChartModel(price: 1, color: .gray, title: "LIT")
                ])
            }
            .padding()
            
            // portfolio general values
            VStack(alignment: .trailing){
                
                portfolioValue(title: "Amount (BTC)", value: "1.24")
                Divider()
                portfolioValue(title: "Invesment", value: (2412.65).toUSDCurrencyFormatted())
                Divider()
                portfolioValue(title: "Current", value: (2004.05).toUSDCurrencyFormatted())
                Divider()
                portfolioValue(
                    title: "Profit & Loss",
                    value: (-14.29).toPercentString(),
                    valueColor: (-14.29).toPercentColor())
                
            }
            .padding()
            .frame(width: 140)
        }
    }
}

extension PortfolioChart {
    
    private func portfolioValue( title : String,
                                 value : String ,
                                 valueColor : Color = Color.theme.primaryTextColor) -> some View {
        
        return  VStack(alignment: .trailing){
            Text(title)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
            Text(value)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(valueColor)
        }
    }
}
struct PortfolioChart_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioChart()
    }
}
