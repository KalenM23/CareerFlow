//
//  ContentView.swift
//  JobTracker
//
//  Created by Kalen Mclaughlin on 6/18/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    

    var body: some View {
       
        Text("Hello World!")
            .foregroundStyle(.blue)
        
        
        
    }

   
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
