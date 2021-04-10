//
//  DogItemView.swift
//  paws
//
//  Created by Shivam Dhuria on 11/04/21.
//

import SwiftUI
import URLImage

struct DogItemView: View {
    
    let imageUrl : String
    
    var body: some View {
        HStack{
            Spacer()
            VStack(){
                if let url = URL(string: imageUrl){
                    URLImage(url: url,
                             options: URLImageOptions(
                                identifier: imageUrl,
                                expireAfter: nil,
                                cachePolicy: .returnCacheElseLoad(cacheDelay: nil, downloadDelay: nil)
                             ),
                             content: { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .clipped()
                             })
                        .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(30.0)
                    
                }
                
                let breedName = imageUrl.components(separatedBy: "breeds/")[1].components(separatedBy: "/")[0]
                    .capitalized.replacingOccurrences(of: "-", with: " ")
              
                Text(breedName)
                    .foregroundColor(Color.gray)
                    .font(.system(size: 24, weight: .heavy))
                    .frame(width: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .lineLimit(1)
                
            } .cornerRadius(30.0)
            Spacer()
        }
    }
}

struct DogItemView_Previews: PreviewProvider {
    static var previews: some View {
        DogItemView(imageUrl: "https://images.dog.ceo/breeds/hound-english/n02089973_3160.jpg")
    }
}
