//
//  HomeView.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 14.09.2022.
//

import SwiftUI
import Kingfisher

struct HomeView: View {
    @EnvironmentObject var launchScreenManager : LaunchScreenViewModel
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView{
            
            
            ZStack {
                ScrollView(.vertical, showsIndicators: false){
                    
                  
                    VStack{
                        // arrow and indicator
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundColor(.orange)
                            .offset(y: -170)
                        
                        // top movers view
                        TopMoversView(viewModel: viewModel)
                        
                        Divider()
                        
                        // all coins view
                        AllCoinsView(viewModel: viewModel)
                    }
                    
                    
                }
              
               
                
                if viewModel.isLoading {
                    CustomLoadingIndicator()
                }
                
            }
            .refreshable {
                viewModel.refreshData()
            }
            .background(Color.theme.appBackgroundColor)
            .navigationBarTitleDisplayMode(.automatic)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            HStack {
                                Image(uiImage: UIImage(named: "logo-crypto-track")!)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 32)
                                Text("CryptoTrack").font(.headline)
                            }
                        }
                    }
                    .navigationTitle("Live Datas")
        }
        .onAppear{
            DispatchQueue
                .main
                .asyncAfter(deadline: .now() + 1.74 ) {
                    launchScreenManager.dismiss()
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(LaunchScreenViewModel())
    }
}
