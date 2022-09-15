//
//  PreviewProvider.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 15.09.2022.
//

import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview{
        return DeveloperPreview.instance
    }
}

class DeveloperPreview{
    static let instance = DeveloperPreview()
    
    let stat0x0 = StatisticModel(title: "Currenct Price", value: "$20.123.45", percentageChange: 1.29)
    let stat0x1 = StatisticModel(title: "Market Capitalization", value: "$429.14Bn", percentageChange: 1.92)
    let stat1x0 = StatisticModel(title: "Rank", value: "1", percentageChange: nil)
    let stat1x1 = StatisticModel(title: "Volume", value: "$29.07Bn", percentageChange: nil)
    
    let sectionModel = CoinDetailSectionModel(title: "Overview",
                                              stats: [
                                                StatisticModel(title: "Currenct Price", value: "$20.123.45", percentageChange: 1.29),
                                                StatisticModel(title: "Market Capitalization", value: "$429.14Bn", percentageChange: 1.92),
                                                StatisticModel(title: "Rank", value: "1", percentageChange: nil),
                                                StatisticModel(title: "Volume", value: "$29.07Bn", percentageChange: nil)
                                              ])
}
