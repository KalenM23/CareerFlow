//
//  ContentView.swift
//  JobTracker
//
//  Created by Kalen Mclaughlin on 6/18/26.
//

import SwiftData
import SwiftUI

struct ContentView: View {

    @Environment(\.modelContext) private var modelContext
    @State private var viewmodel = JobApplicationViewModel()

    var body: some View {
        NavigationStack {
            Form {
                Section("Job Application") {
                    Text("Job Title")
                    TextField("", text: $viewmodel.jobTitle)
                        .textFieldStyle(.roundedBorder)

                    Text("Company Name")
                    TextField("", text: $viewmodel.companyName)
                        .textFieldStyle(.roundedBorder)

                    Text("Location")
                    TextField("", text: $viewmodel.companyLocation)
                        .textFieldStyle(.roundedBorder)

                    Text("Salary")
                    TextField("", value: $viewmodel.jobSalary, format: .number)
                        .textFieldStyle(.roundedBorder)

                    Picker("Status", selection: $viewmodel.applicationStatus) {
                        Text("Applied").tag(AppStatus.applied)
                        Text("Under Review").tag(AppStatus.underreview)
                        Text("Interview Scheduled").tag(AppStatus.interviewscheduled)
                        Text("Interviewing").tag(AppStatus.interviewing)
                        Text("Offer Received").tag(AppStatus.offerreceived)
                        Text("Accepted").tag(AppStatus.accepted)
                        Text("Rejected").tag(AppStatus.rejected)
                        Text("Withdrawn").tag(AppStatus.withdrawn)
                    }

                    DatePicker("Date", selection: $viewmodel.applicationDate)

                    if let errorMessage = viewmodel.errorMessage {
                        Text(errorMessage)
                            .foregroundStyle(.red)
                            .font(.caption)
                    }

                    Button {
                        viewmodel.addApplication()
                    } label: {
                        Text("Add Application")
                            .frame(maxWidth: 350)
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle)
                }
            }
        }
        .onAppear {
            viewmodel.configure(with: modelContext)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: JobApplicationModel.self, inMemory: true)
}
