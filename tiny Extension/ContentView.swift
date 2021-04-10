//
//  ContentView.swift
//  tiny Extension
//
//  Created by Shivam Dhuria on 11/04/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = UsersViewmodel(service: UserServiceImpl())
    
    var body: some View {
        
        VStack{
            NavigationView {
                List(viewModel.dogUrls, id: \.self) { user in
                    DogItem(imageUrl: user)
                }.navigationBarTitle("Dogs")
                
            }
            Spacer()
            
            Button (action : viewModel.getDogs ,label :{Text("Load more ")})
            
//            switch viewModel.state {
//            case .loading: ProgressView()
//            case .failed(let error):{}
//            case .success(_):{}
//
//                    Spacer()
//                    Button (action : viewModel.getDogs ,label :{Text("Load more ")})
//
//            }
        }.onAppear(perform: viewModel.getDogs)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
