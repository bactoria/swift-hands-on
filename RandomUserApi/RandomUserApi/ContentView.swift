//
//  ContentView.swift
//  RandomUserApi
//
//  Created by kakao on 2023/09/08.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @ObservedObject var randomUserViewModel = RandomUserViewModel()
    
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        List(randomUserViewModel.randomUsers) { aRandomUser in
            RandomUserRowView(aRandomUser)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
