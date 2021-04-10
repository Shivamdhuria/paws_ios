//
//  ContentView.swift
//  paws
//
//  Created by Shivam Dhuria on 10/04/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = UsersViewmodel(service: UserServiceImpl())
    
    var body: some View {
        
        VStack{
            NavigationView {
                List(viewModel.dogUrls, id: \.self) { user in
                    DogItemView(imageUrl: user).padding(.bottom, 20)
                }.navigationBarTitle("Dogs")
                
            }
            
            switch viewModel.state {
            case .loading: ProgressView()
            case .failed(let error):ErrorView(error: error, handler: viewModel.getDogs)
            case .success(_):
                
                    Spacer()
                    Button (action : viewModel.getDogs ,label :{Text("Load more ")})
                
            }
        }.onAppear(perform: viewModel.getDogs)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
