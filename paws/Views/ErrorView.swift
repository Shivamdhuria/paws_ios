//
//  ErrorView.swift
//  paws
//
//  Created by Shivam Dhuria on 10/04/21.
//

import SwiftUI

struct ErrorView: View {
  
    
    
    typealias ErrorViewActionHandler = () -> Void
    
    let error: Error
    let handler: ErrorViewActionHandler
    
    internal init(error: Error, handler: @escaping ErrorView.ErrorViewActionHandler) {
        self.error = error
        self.handler = handler
    }
    
    var body: some View {
        VStack{
            Image(systemName: "exclamationmark.icloud.fill")
                .foregroundColor(.gray)
                .font(.system(size: 50, weight: .heavy))
                .padding(.bottom, 4)
            Text("Oops")
                .font(.system(size: 50, weight: .medium))
            Text(error.localizedDescription)
                .foregroundColor(.gray)
                .font(.system(size: 15, weight: .medium))
            Button (action : {
                handler()
            },label :{Text("Retry")})
            .padding(15)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .font(.system(size: 20, weight: .heavy))
            .cornerRadius(10.0)
            
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error : APIError.decodingError){}
    }
}
