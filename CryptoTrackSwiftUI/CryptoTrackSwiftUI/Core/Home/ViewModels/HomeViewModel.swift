//
//  HomeViewModel.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 14.09.2022.
//

import Foundation

class HomeViewModel: ObservableObject {

    @Published var cryptoCurrencies = [CryptoCurrency]()
    @Published var topCryptoCurrencies = [CryptoCurrency]()

    init(){
        fetchMarketData()
    }
    
    func fetchMarketData(){
        
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h"
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url){data, response, error in
            if let error = error {
                print("DEBUG: Error \(error.localizedDescription)")
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
                }
            }catch let error {
                print("DEBUG: Crypto Currencies Data is failed to decode with error: \(error)")
            }

        }.resume()
    }
    
    func sortTopMovingCryptoCurrencies(){
        let tops = cryptoCurrencies.sorted(by: {$0.priceChangePercentage24H > $1.priceChangePercentage24H})
        
        self.topCryptoCurrencies = Array(tops.prefix(5))
    }
}
