//
//  MarketViewModel.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 18.09.2022.
//

import Foundation
import Combine
class MarketViewModel:  ObservableObject {
    
    private var dataSubscription : AnyCancellable?
    
    @Published private(set) var cryptoCurrencies = [CryptoCurrency]()
    @Published private(set) var topCryptoCurrencies = [CryptoCurrency]()
    @Published var isLoading = true
    
    @Published private(set) var btnRankImageDirection = ""
    @Published private(set) var btnNameImageDirection = ""
    @Published private(set) var btnPriceImageDirection = ""
    @Published private(set) var btnPercentageImageDirection = ""
    
    @Published private(set) var isClickedBtnRank = false
    @Published private(set) var isClickedBtnName = false
    @Published private(set) var isClickedBtnPrice = false
    @Published private(set) var isClickedBtnPercentage = false
    
    private var lastSortType : ListSortType = .rankLow
    
    init(){
        fetchData()
        setSortButtonStyle()
    }
    
    private func fetchData(){
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
        
        guard let url = URL(string: urlString) else {return}
        
        dataSubscription = NetworkManager.download(url: url)
            .decode(type: [CryptoCurrency].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion ,
                  receiveValue: {[weak self] (returnedResponse) in
                
                self?.cryptoCurrencies = returnedResponse
                self?.sortTopMovingCryptoCurrencies()
                self?.isLoading = false
                
                self?.dataSubscription?.cancel()
               
            })
        
        
    }
    
    func sortTopMovingCryptoCurrencies(){
        if cryptoCurrencies.count > 5 {
            let tops = cryptoCurrencies.sorted(by: {$0.priceChangePercentage24H > $1.priceChangePercentage24H})
            
            self.topCryptoCurrencies = Array(tops.prefix(5))
        }
        
    }
    
    func refreshData(){
        print("DEBUG: Refresh data triggered")
        fetchData()
    }
    
    func sortList(type: SortType){
        
        switch type {
        case .price :
            if lastSortType == .priceLow {
                cryptoCurrencies = cryptoCurrencies.sorted(by: { $0.currentPrice > $1.currentPrice })
                lastSortType = .priceHigh
            }
            else {
                cryptoCurrencies = cryptoCurrencies.sorted(by: { $0.currentPrice < $1.currentPrice })
                lastSortType = .priceLow
            }
        case .name :
            if lastSortType == .nameAsc {
                cryptoCurrencies = cryptoCurrencies.sorted(by: { $0.name.lowercased() > $1.name.lowercased() })
                lastSortType = .nameDesc
            }
            else {
                cryptoCurrencies = cryptoCurrencies.sorted(by: { $0.name.lowercased() < $1.name.lowercased() })
                lastSortType = .nameAsc
            }
        case .percentage :
            if lastSortType == .percentageLow {
                cryptoCurrencies = cryptoCurrencies.sorted(by: { $0.priceChangePercentage24H > $1.priceChangePercentage24H })
                lastSortType = .percentageHigh
            }
            else {
                cryptoCurrencies = cryptoCurrencies.sorted(by: { $0.priceChangePercentage24H < $1.priceChangePercentage24H })
                lastSortType = .percentageLow
            }
        case .rank :
            if lastSortType == .rankLow {
                cryptoCurrencies = cryptoCurrencies.sorted(by: { $0.marketCapRank > $1.marketCapRank })
                lastSortType = .rankHigh
            }
            else {
                cryptoCurrencies = cryptoCurrencies.sorted(by: { $0.marketCapRank < $1.marketCapRank })
                lastSortType = .rankLow
            }
        }
        
        setSortButtonStyle()
    }
    
    private func setSortButtonStyle(){
        
        let downArrowEmpty = "arrowtriangle.down"
        let downArrow = "arrowtriangle.down.fill"
        let upArrow = "arrowtriangle.up.fill"
        
        btnRankImageDirection = downArrowEmpty
        btnNameImageDirection = downArrowEmpty
        btnPriceImageDirection = downArrowEmpty
        btnPercentageImageDirection = downArrowEmpty
        
        isClickedBtnRank = false
        isClickedBtnName = false
        isClickedBtnPrice = false
        isClickedBtnPercentage = false
        
        switch lastSortType {
        case .rankLow:
            btnRankImageDirection = downArrow
            isClickedBtnRank = true

        case .rankHigh:
            btnRankImageDirection = upArrow
            isClickedBtnRank = true

        case .nameAsc:
            btnNameImageDirection = downArrow
            isClickedBtnName = true

        case .nameDesc:
            btnNameImageDirection = upArrow
            isClickedBtnName = true

        case .priceLow:
            btnPriceImageDirection = upArrow
            isClickedBtnPrice = true

        case .priceHigh:
            btnPriceImageDirection = downArrow
            isClickedBtnPrice = true

        case .percentageLow:
            btnPercentageImageDirection = upArrow
            isClickedBtnPercentage = true

        case .percentageHigh:
            btnPercentageImageDirection = downArrow
            isClickedBtnPercentage = true

        }
        
    }
    
    enum SortType {
        case rank
        case name
        case price
        case percentage
    }
    
    private enum ListSortType {
        case rankLow
        case rankHigh
        case nameAsc
        case nameDesc
        case priceLow
        case priceHigh
        case percentageLow
        case percentageHigh
    }
}


/*
 
 old api call
 
 
 
 private func fetchMarketData(){
     
     let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h"
     
     guard let url = URL(string: urlString) else {return}
     
     URLSession.shared.dataTask(with: url){data, response, error in
         if let error = error {
             print("DEBUG: Error \(error.localizedDescription)")
             self.isLoading = false
             return
         }
         
         if let response = response as? HTTPURLResponse {
             print("DEBUG: Response Code \(response.statusCode)")
         }
         
         guard let data = data else { return }
         
         //let dataAsString = String(data: data, encoding: .utf8)
         //print("DEBUG: Data \(dataAsString!)")
         
         do {
             let cryptoCurrencies = try JSONDecoder().decode([CryptoCurrency].self, from: data)
             //print("DEBUG: Crypto Currencies \(cryptoCurrencies)")
             
             DispatchQueue.main.async {
                 self.cryptoCurrencies = cryptoCurrencies
                 self.sortTopMovingCryptoCurrencies()
                 self.isLoading = false
             }
         }catch let error {
             print("DEBUG: Crypto Currencies Data is failed to decode with error: \(error)")
             self.isLoading = false
         }
         
     }.resume()
 }
 */
