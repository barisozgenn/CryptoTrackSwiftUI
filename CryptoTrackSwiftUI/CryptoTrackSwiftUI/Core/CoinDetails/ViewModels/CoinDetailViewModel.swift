//
//  CoinDetailViewModel.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 15.09.2022.
//

import Foundation
class CoinDetailViewModel {
    
    private let cryptoCurrency : CryptoCurrency
    var chartData = [ChartData]()
    
    var overviewSectionModel : CoinDetailSectionModel {
        
        // price stats
        let price = cryptoCurrency.currentPrice.toUSDCurrency()
        let pricePercentChange = cryptoCurrency.priceChangePercentage24H
        let priceStat = StatisticModel(title: "Current Price",
                                       value: price,
                                       percentageChange: pricePercentChange)
        // market cap stats
        let marketCap = cryptoCurrency.marketCap
        let marketCapChange = cryptoCurrency.marketCapChangePercentage24H
        let marketCapStat = StatisticModel(title: "Market Capitalization",
                                           value: "\(marketCap)",
                                           percentageChange: marketCapChange)
        // rank stats
        let rank = cryptoCurrency.marketCapRank
        let rankStat = StatisticModel(title: "Rank",
                                      value: "\(rank)",
                                      percentageChange: nil)
        
        // volume stats
        let volume = cryptoCurrency.totalVolume
        let volumeStat = StatisticModel(title: "Volume",
                                        value: "\(volume)",
                                        percentageChange: nil)
        
        return CoinDetailSectionModel(title: "Overview", stats: [priceStat, marketCapStat, rankStat, volumeStat] )
    }
    
    var additionalDetailSectionModel : CoinDetailSectionModel {
        
        // 24H high
        let high = cryptoCurrency.high24H?.toUSDCurrency() ?? "n/a"
        let highStat = StatisticModel(title: "24h High",
                                      value: high,
                                      percentageChange: nil)
        
        // 24H low
        let low = cryptoCurrency.low24H?.toUSDCurrency() ?? "n/a"
        let lowStat = StatisticModel(title: "24h Low",
                                     value: low,
                                     percentageChange: nil)
        
        // 24H price change
        let priceChange24h = (cryptoCurrency.priceChange24H ).toUSDCurrency()
        let pricePercentChange24h = cryptoCurrency.priceChangePercentage24H
        let priceChangeStat = StatisticModel(title: "24h Price Change",
                                             value: priceChange24h,
                                             percentageChange: pricePercentChange24h)
        
        // 24H market cap change
        let marketCapChange = (cryptoCurrency.marketCapChange24H ?? 0).toUSDCurrency()
        let marketCapPercentChange = cryptoCurrency.marketCapChangePercentage24H ?? 0
        let marketCapChangeStat = StatisticModel(title: "24h Market Cap Change",
                                                 value: marketCapChange,
                                                 percentageChange: marketCapPercentChange)
        
        return CoinDetailSectionModel(title: "Additional Detail", stats: [
            highStat,
            lowStat,
            priceChangeStat,
            marketCapChangeStat
        ] )
    }
    
    init(cryptoCurrency: CryptoCurrency){
        self.cryptoCurrency = cryptoCurrency
        setChartData()
    }
    
    func setChartData(){
        guard let priceDatas = cryptoCurrency.sparklineIn7D?.price else {return}
        var index = 0
        let lastUpdatedDate = Date(coinGeckoDateString: cryptoCurrency.lastUpdated ?? "")

        for priceData in priceDatas.reversed() {
           
            let date = lastUpdatedDate.addingTimeInterval(-1*60*60*Double(index))
            
            let chartData = ChartData(date: date, value: priceData)
            
            index += 1
        }
    }
}
