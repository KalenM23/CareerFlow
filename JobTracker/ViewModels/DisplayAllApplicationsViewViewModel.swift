//
//  DisplayAllApplicationsViewViewModel.swift
//  JobTracker
//
//  Created by Kalen Mclaughlin on 7/10/26.
//

import Foundation
import SwiftData


@Observable
class DisplayAllApplicationsViewViewModel {
    
    private var modelContext: ModelContext

        init(modelContext: ModelContext) {
            self.modelContext = modelContext
        }

        func groupedByCompany(_ applications: [JobApplicationModel]) -> [String: [JobApplicationModel]] {
            Dictionary(grouping: applications, by: \.companyName)
        }

        func deleteApplication(_ application: JobApplicationModel) {
            modelContext.delete(application)
        }
    
    
    
    
}
