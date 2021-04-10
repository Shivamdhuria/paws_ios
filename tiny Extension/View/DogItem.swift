//
//  DogItem.swift
//  tiny Extension
//
//  Created by Shivam Dhuria on 11/04/21.
//

import SwiftUI
import URLImage

struct DogItem: View {
    
    let imageUrl : String
    
    var body: some View {
           
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
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                                
                                
                             })
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                      
                    
                }
                
                let breedName = imageUrl.components(separatedBy: "breeds/")[1].components(separatedBy: "/")[0]
                    .capitalized.replacingOccurrences(of: "-", with: " ")
                
                Text(breedName)
                    .foregroundColor(Color.gray)
                    .font(.system(size: 12, weight: .heavy))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .lineLimit(1)
                
            }
           
        
    }
}

struct DogItem_Previews: PreviewProvider {
    static var previews: some View {
        DogItem(imageUrl: "https://images.dog.ceo/breeds/hound-english/n02089973_3160.jpg")
    }
}
