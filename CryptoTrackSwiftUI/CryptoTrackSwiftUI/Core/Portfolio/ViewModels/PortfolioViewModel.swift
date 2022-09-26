//
//  PortfolioViewModel.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 24.09.2022.
//

import Foundation
import Combine

class PortfolioViewModel:  ObservableObject {
    
    @Published private(set) var cryptoCurrencies = [CryptoCurrency]()
    @Published private(set) var portfolioCryptoCurrencies: [CryptoCurrency] = []
    
    private let dataService = CryptoCurrenciesService()
    private let portfolioEntityService = PortfolioDataService()
    private var cancellables = Set<AnyCancellable>()
    
    @Published var searchText : String = ""
    
    init(){
        fetchData()
    }
    
    private func fetchData(){
        
        $searchText
            .combineLatest(dataService.$cryptoCurrencies)
            .debounce(for: .seconds(0.7), scheduler: DispatchQueue.main)
            .map(searchCurrencies)
            .sink{[weak self] (searchedCurrencies) in
               
                self?.cryptoCurrencies = searchedCurrencies
            }
            .store(in: &cancellables)
        
        $cryptoCurrencies
            .combineLatest(portfolioEntityService.$entities)
            .map{(currencyModel, portfolioEntities) -> [CryptoCurrency] in
                
                currencyModel
                    .compactMap{(currency) -> CryptoCurrency? in
                        guard let entity = portfolioEntities.first(where: {$0.coinID == currency.id}) else {
                            return nil
                        }
                        return currency.updateHolding(unitPrice: entity.unitPrice, amount: entity.amount, transactionType: entity.transactionType ?? "b", dateCreated: entity.dateCreated ?? Date())
                        
                    }
            }
            .sink{[weak self] (portfolioCurrencies) in
                self?.portfolioCryptoCurrencies = portfolioCurrencies
            }
            .store(in: &cancellables)

    }
    
    private func searchCurrencies(text:String, searchCurrencies : [CryptoCurrency]) -> [CryptoCurrency]{
        
        guard !text.isEmpty else {
            return searchCurrencies
        }
        
        let lowercasedText = text.lowercased()
        
        let filteredCurrencies = searchCurrencies.filter { (crypto) -> Bool in
            let condition =
            crypto.name.lowercased().contains(lowercasedText) ||
            crypto.symbol.lowercased().contains(lowercasedText)
            
            return condition
        }
        
        return filteredCurrencies
    }
    
    func editPortfolio (currency : CryptoCurrency, unitPrice: Double = 0 , amount : Double = 0, trancastionType : String = "b" , crudType : PortfolioDataService.ECrudType){
        portfolioEntityService.editPortfolio(currency: currency,unitPrice: unitPrice , amount : amount, trancastionType : trancastionType, crudType: crudType)
    }
}
