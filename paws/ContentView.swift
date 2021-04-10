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
        
        Group{
            
            switch viewModel.state {
            
            case .loading: ProgressView()
                
            case .failed(let error):ErrorView(error: error, handler: viewModel.getArticles)
                
            case .success(let users):
                NavigationView {
                    List(users) { user in
                        Text(user.name)
                    }.navigationBarTitle("Users")
                }
                
            }
            
            }.onAppear(perform: viewModel.getArticles)
            //        NavigationView {
            //            List(viewModel.users) { user in
            //                Text(user.name)
            //            }.navigationBarTitle("Users")
            //                .onAppear {
            //
            //            }
            //        }
        }
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
