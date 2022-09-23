//
//  AddButton.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 23.09.2022.
//

import SwiftUI

struct AddButton: View {
    @State private var showingSheet = false
    @EnvironmentObject private var viewModel : MarketViewModel
    
    var body: some View {
        Button(action: {
            showingSheet.toggle()
        }, label:{
            Image(systemName: "plus")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(14)
                .background(.blue)
                .cornerRadius(.infinity)
        })
        .sheet(isPresented: $showingSheet) {
            PortfolioEditView()
                .environmentObject(viewModel)
        }
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton()
    }
}
