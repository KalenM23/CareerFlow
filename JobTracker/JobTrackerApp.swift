//
//  JobTrackerApp.swift
//  JobTracker
//
//  Created by Kalen Mclaughlin on 6/18/26.
//

import SwiftUI
import SwiftData

@main
struct JobTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            // RootView (not ContentView directly) is now the entry point,
            // since it's responsible for showing splash vs. real content.
            RootView()
        }
        // Sets up SwiftData's storage for JobApplicationModel,
        // available to every view in the app via @Environment(\.modelContext) and @Query.
        .modelContainer(for: JobApplicationModel.self)
    }
}
