//
//  ContentView.swift
//  JobTracker
//
//  Created by Kalen Mclaughlin on 6/18/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    // created state properties
    @State private var jobTitle = ""
    @State private var companyName = ""
    @State private var statusSelection: appStatus?
    

    var body: some View {
       // created a vstack that have leading alignment and 8 spaces
        VStack(alignment: .leading, spacing: 8) {
            // created a text with value job title
            Text("Job Title")
            // created a textfield name jobtitle and binded state property to it
            TextField("Job Title", text: $jobTitle)
            // change the textfieldstyle to a rounded border
                .textFieldStyle(.roundedBorder)
            // created a text with value company name
            Text("Company Name")
            // created a text field with a label and binded state var to it
            TextField("Company Name", text: $companyName)
            // change the textfieldstyle to a rounded border
                .textFieldStyle(.roundedBorder)
                
                
            
            
        }
        .padding()
        
        
    }

   
}
// created a enum for the picker 
enum appStatus {
    
    case Applied, UnderReview, InterviewScheduled, Interviewing, OfferReceived, Accepted, Rejected, Withdrawn
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
