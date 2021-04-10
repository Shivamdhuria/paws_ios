//
//  BreweryView.swift
//  paws
//
//  Created by Shivam Dhuria on 10/04/21.
//

import SwiftUI

struct BreweryView: View {
    private let brewery: Brewery
    init(brewery: Brewery) {
        self.brewery = brewery
    }
    
    var body: some View {
        HStack {
            Image(uiImage: UIImage(named: "beer")!)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
            VStack(alignment: .leading, spacing: 15) {
                Text(brewery.name)
                    .font(.system(size: 18))
                    .foregroundColor(Color.blue)
                Text("\(brewery.city) - \(brewery.street)")
                    .font(.system(size: 14))
            }
        }
    }
}
//struct BreweryView_Previews: PreviewProvider {
//    static var previews: some View {
////        BreweryView()
//    }
//}
