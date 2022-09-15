//
//  ChartView.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 15.09.2022.
//

import SwiftUI
import Charts

struct ChartView: View {
    let viewModel : CoinDetailViewModel
    
    var body: some View {
        VStack{
            if #available(iOS 16.0, *){
                Chart{
                    ForEach(viewModel.chartData){ item in
                        LineMark(
                            x: .value("Date", item.date),
                            y:.value("Price", item.value)
                        )
                        .interpolationMethod(.cardinal)
                    }
                }
                .chartXScale(domain: ClosedRange(uncheckedBounds:
                                                    (lower: viewModel.startChartDate,
                                                     upper: viewModel.endChartDate)))
                .chartXAxis{
                    AxisMarks(
                        position: .bottom,
                        values: viewModel.xChartValues
                    )
                }
                .chartYScale(domain: ClosedRange(uncheckedBounds:
                                                    (lower: viewModel.minChartPrice,
                                                     upper: viewModel.maxChartPrice)))
                .chartYAxis{
                    AxisMarks(
                        position: .leading,
                        values: viewModel.yChartValues
                    )
                }
            }
            
        }
       
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(viewModel: CoinDetailViewModel(cryptoCurrency: dev.cryptoCurrency))
    }
}
