//
//  ContentView.swift
//  Betho
//
//  Created by Paull Stanley on 4/11/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        VStack {
            HeaderView()
            Spacer()
            HomeView()
            Spacer()
            Text("Developed by Paullished Software")
                .fontWeight(Font.Weight.ultraLight)
                .font(.callout)
                .foregroundColor(.gray)
        }
        
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, CoreDataManager.shared.viewContext)
    }
}
