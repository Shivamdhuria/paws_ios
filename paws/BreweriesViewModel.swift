////
////  BreweriesViewModel.swift
////  paws
////
////  Created by Shivam Dhuria on 10/04/21.
////
//
//import Foundation
//import Combine
//
//class BreweriesViewModel: ObservableObject {
//    
//    
//    private let url = "https://api.openbrewerydb.org/breweries"
//    private var task: AnyCancellable?
//    
//    @Published var time = ""
//    @Published var breweries: [Brewery] = []
//    @Published var users: [User] = []
//    
//    private var anyCancellable: AnyCancellable?
//    
//    init() {
//        setUpPublisher()
//    }
//    private func setUpPublisher(){
//        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
//        anyCancellable =  URLSession.shared.dataTaskPublisher(for: url)
//            .tryMap{(data,response) in
//                guard let httpResponse = response as? HTTPURLResponse,
//                      httpResponse.statusCode == 200 else {
//                    throw URLError(.badServerResponse)
//                }
//                return data
//            }
//            .decode(type: [User].self, decoder: JSONDecoder())
//            .receive(on: DispatchQueue.main)
//            .sink(receiveCompletion: {_ in }){users in
//                self.users = users
//            }
//        
//    }
//}
//
////extension BreweriesViewModel {
////    enum State {
////        case idle
////        case loading
////        case loaded([User])
////        case error(Error)
////    }
////
////    enum Event {
////        case onAppear
////        case onSelectMovie(Int)
////        case onMoviesLoaded([User])
////        case onFailedToLoadMovies(Error)
////    }
////}
//
//
//
