//
//  PortfolioEditView.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 22.09.2022.
//

import SwiftUI

struct PortfolioEditView: View {
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    Text("edit")
                }
            }
            .toolbar(content: {
                ToolbarItem(
                    placement: .navigationBarLeading){
                        CloseButton()
                    }
            })
            .navigationTitle("Edit Portfolio")
        }
       
       
    }
}

struct PortfolioEditView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioEditView()
    }
}
