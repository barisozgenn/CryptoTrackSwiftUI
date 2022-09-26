//
//  RootViewModel.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 26.09.2022.
//

import Foundation
import Combine

class RootViewModel:  ObservableObject {
    
    @Published private(set) var cryptoCurrencies : [CryptoCurrency] = []

    private let dataService = CryptoCurrenciesService()
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        fetchData()
    }
    
    private func fetchData(){
        
        dataService.$cryptoCurrencies
            .sink{[weak self] (currencies) in
                self?.cryptoCurrencies = currencies
            }
            .store(in: &cancellables)
        

    }
}
