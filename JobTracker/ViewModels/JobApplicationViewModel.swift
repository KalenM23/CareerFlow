//
//  JobApplicationViewModel.swift
//  JobTracker
//
//  Created by Kalen Mclaughlin on 7/2/26.
//

import Foundation
import SwiftData


@Observable
class JobApplicationViewModel  {

    // MARK: Properties
        var jobTitle: String = ""
        var companyName: String = ""
        var companyLocation: String = ""
        var jobSalary: String = ""
        var applicationStatus: AppStatus = .applied
        var applicationDate: Date = .now
        var errorMessage: String?

    // This will save the data to swiftdata
    private var modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    
    
    // MARK: Functions
    
    func AddApplication() -> Bool {
        
        guard !jobTitle.isEmpty, !companyName.isEmpty else {
                    errorMessage = "Please fill out all fields."
                    return false
                }
                let newApp = JobApplicationModel(
                    jobTitle: jobTitle,
                    companyName: companyName,
                    companyLocation: companyLocation,
                    jobSalary: jobSalary,
                    applicationStatus: applicationStatus,
                    applicationDate: applicationDate
                )
                modelContext.insert(newApp)
                return true
        
        
        
    }
    
    
}
