//
//  ContentView.swift
//  JobTracker
//
//  Created by Kalen Mclaughlin on 6/18/26.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    
    // MARK: Properties
    // created state properties
    @State private var viewmodel = JobApplicationViewModel(modelContext: <#ModelContext#>)
    
    
    var body: some View {
        
        // MARK: Life Line
        
     
        NavigationStack {
            Form {
                
                Section("Job Application") {
                    // created a text with value job title
                    Text("Job Title")
                    // created a textfield name jobtitle and binded state property to it
                    TextField("", text: $viewmodel.jobTitle)
                    // change the textfieldstyle to a rounded border
                        .textFieldStyle(.roundedBorder)
                    // created a text with value company name
                    Text("Company Name")
                    // created a text field with a label and binded state var to it
                    TextField("", text: $viewmodel.companyName)
                    // change the textfieldstyle to a rounded border
                        .textFieldStyle(.roundedBorder)
                    // created a text field with a label and binded state var to it
                    Text("Location")
                    TextField("", text: $viewmodel.companyLocation)
                        .textFieldStyle(.roundedBorder)
                    
                    // created a text field with a label and binded state var to it
                    Text("Salary")
                    TextField("", text: $viewmodel.jobSalary)
                        .textFieldStyle(.roundedBorder)
                    
                    Picker("Status", selection: $viewmodel.applicationStatus) {
                        Text("Applied").tag(AppStatus.applied)
                        Text("Under Review").tag(AppStatus.underreview)
                        Text("Interview Scheduled")
                            .tag(AppStatus.interviewscheduled)
                        Text("Interviewing")
                            .tag(AppStatus.interviewing)
                            Text("Offer Received").tag(AppStatus.offerreceived)
                            Text("Accepted").tag(AppStatus.accepted)
                            Text("Rejected").tag(AppStatus.rejected)
                            Text("Withdrawn").tag(AppStatus.withdrawn)
                    }
                    
                    // Date picker that allow users to click their application date and time
                    DatePicker("Date", selection: $viewmodel.applicationDate)
                    
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

// MARK: Enums / Functions

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
