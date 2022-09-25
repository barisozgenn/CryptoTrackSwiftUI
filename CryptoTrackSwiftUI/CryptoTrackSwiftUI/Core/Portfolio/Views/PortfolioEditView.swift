//
//  PortfolioEditView.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 22.09.2022.
//

import SwiftUI

struct PortfolioEditView: View {
    
    let cryptoCurrency : CryptoCurrency
    @State private var currencyAmountText : String = "0.00"
    @State private var currencyPriceText : String
    @State private var transactionType = "BUY"
    @State private var totalHoldings : Double = 0
    
    init(cryptoCurrency : CryptoCurrency){
        self.cryptoCurrency = cryptoCurrency
        self.currencyPriceText =
        String(format: "%.2f", cryptoCurrency.currentPrice)
    }
    var body: some View {
        ZStack{
            ScrollView{
                
                PortfolioCellView(cryptoCurrency: cryptoCurrency)
                    .padding(.top)
                
                Divider()
                
                portfolioEditSection
                
                
                portfolioResultSection
            }
            .navigationTitle("Edit Portfolio")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing){
                    portfolioSaveButton
                }
            })
        }
        
        
    }
}

extension PortfolioEditView {
    private func getTotalCost() -> Double {
        if let amount = Double(currencyAmountText),
           let price = Double(currencyPriceText) {
            return amount * price
        }
        return 0
    }
    private func getTotalHolding() -> Double {
        if let amount = Double(currencyAmountText) {
            var total = totalHoldings
            if transactionType == "BUY"{
                total += amount
            } else if transactionType == "SELL"{
                total -= amount
            }
                        
            return total
        }
        return 0
    }
    private func canBeSaved() -> Bool {
        if getTotalHolding() > 0 && getTotalCost() > 0 { return true}
        return false
    }
    
    private var portfolioEditSection: some View {
        VStack(alignment: .leading, spacing: 10){
            
            VStack(spacing: 20){
                
                // SELL & BUY
                Menu {
                    Button {
                        transactionType = "BUY"
                    } label: {
                        Text("BUY")
                        Image(systemName: "arrow.up.right.circle")
                    }
                    Button {
                        transactionType = "SELL"
                    } label: {
                        Text("SELL")
                        Image(systemName: "arrow.down.right.circle")
                    }
                } label: {
                    HStack{
                        Text("Transaction Type")
                        
                        Spacer()
                        
                        HStack{
                            Text(transactionType)
                                .fontWeight(.bold)
                            Image(systemName: transactionType == "BUY" ? "arrow.up.right.circle" : "arrow.down.right.circle")
                        }
                        .foregroundColor(transactionType == "BUY" ? Color.theme.currencyGreenColor : Color.theme.currencyRedColor)
                        
                    }
                }
                
                Divider()
                
                // PRICE
                HStack{
                    Text("Currency Price")
                    
                    Spacer()
                    
                    TextField(String(format: "%.2f", cryptoCurrency.currentPrice),
                              text: $currencyPriceText)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
                    .fontWeight(.semibold)
                }
                
                Divider()
                
                // AMOUNT
                HStack{
                    Text("Transaction Amount")
                    
                    Spacer()
                    
                    TextField("Ex: 1.29",
                              text: $currencyAmountText)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
                    .fontWeight(.semibold)
                }
                
            }.padding()
            
            
        }
        .foregroundColor(Color.theme.primaryTextColor)
    }
    
    private var portfolioResultSection: some View {
        VStack(alignment: .leading, spacing: 10){
            
            VStack(spacing: 20){
                
                // Transaction Value
                HStack{
                    Text("Transaction Value")
                    Spacer()
                    Text(getTotalCost().toUSDCurrencyFormatted())
                        .frame(alignment: .trailing)
                    
                }
                
                Divider()
                
                // AMOUNT
                HStack{
                    Text("Total Holding")
                    
                    Spacer()
                    
                    Text(String(format: "%.3f", getTotalHolding()))
                        .frame(alignment: .trailing)
                        .fontWeight(.semibold)
                }
                
                Divider()
                
                // Unit Cost
                HStack{
                    Text("Unit Cost")
                    
                    Spacer()
                    
                    Text(getTotalCost().toUSDCurrencyFormatted())
                        .frame(alignment: .trailing)
                        .fontWeight(.semibold)
                }
                
            }.padding()
            
            
        }
        .foregroundColor(.gray)
        .background(Color.theme.appBackgroundColor)
    }
    
    private var portfolioSaveButton: some View {
        Button(action: {
            if canBeSaved() {
                
            }
        },
               label: {
            Image(systemName: "checkmark")
                .fontWeight(.bold)
                .opacity(canBeSaved() ? 1 : 0)
            Text("Save".uppercased())
                .fontWeight(.bold)
                .opacity(canBeSaved() ? 1 : 0.3)
        })
    }
}

struct PortfolioEditView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioEditView(cryptoCurrency: dev.cryptoCurrency)
    }
    
    
}
