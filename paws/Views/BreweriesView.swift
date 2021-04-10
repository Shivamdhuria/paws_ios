//
//  BreweriesView.swift
//  paws
//
//  Created by Shivam Dhuria on 10/04/21.
//

import SwiftUI

struct BreweriesView: View {
    
    let breweries = [Brewery]()
    
    var body: some View {
        NavigationView {
            List(breweries, id: \.self) {
                BreweryView(brewery: $0)
            }.navigationBarTitle("Breweries")
        }
    }
}
//struct BreweriesView_Previews: PreviewProvider {
//    static var previews: some View {
////        BreweriesView()
//    }
//}
