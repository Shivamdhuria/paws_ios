//
//  UsersViewmodel.swift
//  paws
//
//  Created by Shivam Dhuria on 10/04/21.
//

import Foundation
import Combine

class UsersViewmodel: ObservableObject {
    
    private let service : UserService
    
    private(set) var users = [User]()
    
    private var cancellables = Set<AnyCancellable>()
    //injecting service
    init(service: UserService) {
        self.service = service
    }
    
    @Published private(set) var state: ResultState = .loading
    
    func getArticles() {
        self.state = .loading
        let cancellable = service
            .request(from: .getUsers)
            .sink{res in
                switch res {
                
                case .finished:
                    self.state = .success(content: self.users)
                    break
                    
                case .failure(let error):
                    self.state = .failed(error: error)
                    break
                }
            }
            receiveValue: { users in
                self.users = users
            }
        //To keep hold of the request
        self.cancellables.insert(cancellable)
    }
    
    
}

//    init() {
//        setUpPublisher()
//    }
//private var anyCancellable: AnyCancellable?

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

//extension BreweriesViewModel {
//    enum State {
//        case idle
//        case loading
//        case loaded([User])
//        case error(Error)
//    }
//
//    enum Event {
//        case onAppear
//        case onSelectMovie(Int)
//        case onMoviesLoaded([User])
//        case onFailedToLoadMovies(Error)
//    }
//}




