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
    @State private var applicationDate = Date()
   
    

    var body: some View {
        
        NavigationStack {
            Form {
                
                Section("Job Application") {
                    // created a text with value job title
                    Text("Job Title")
                    // created a textfield name jobtitle and binded state property to it
                    TextField("", text: $jobTitle)
                    // change the textfieldstyle to a rounded border
                        .textFieldStyle(.roundedBorder)
                    // created a text with value company name
                    Text("Company Name")
                    // created a text field with a label and binded state var to it
                    TextField("", text: $companyName)
                    // change the textfieldstyle to a rounded border
                        .textFieldStyle(.roundedBorder)
                    
                    Picker("Status", selection: $statusSelection) {
                        Text("Applied").tag(appStatus.Applied)
                        Text("UnderReview").tag(appStatus.UnderReview)
                        Text("Interview Scheduled").tag(appStatus.InterviewScheduled)
                        Text("Interviewing").tag(appStatus.Interviewing)
                        Text("Offer Received").tag(appStatus.OfferReceived)
                        Text("Accepted").tag(appStatus.Accepted)
                        Text("Rejected").tag(appStatus.Rejected)
                        Text("Withdrawn").tag(appStatus.Withdrawn)
                    }
                        
                    // Date picker that allow users to click their application date and time
                    DatePicker("Date", selection: $applicationDate)
                    
                    Button {
                        // Action goes here
                        // what does the button do
                    } label: {
                        Text("Add Application")
                            .frame(maxWidth: 350)
                            
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle)
                    
                    
                }
                    
            }
       }
        
            
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
