//
//  CustomLoadingIndicator.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 16.09.2022.
//

import SwiftUI

struct CustomLoadingIndicator: View {
    var body: some View {
       ProgressView()
            .progressViewStyle(.circular)
            .accentColor(.white)
            .scaleEffect(x: 1.5, y:1.5, anchor: .center)
            .frame(width: 92, height: 92)
            .background(Color(.systemGray4))
            .cornerRadius(14)
    }
}

struct CustomLoadingIndicator_Previews: PreviewProvider {
    static var previews: some View {
        CustomLoadingIndicator()
    }
}
