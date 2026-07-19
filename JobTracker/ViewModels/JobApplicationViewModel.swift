//
//  JobApplicationViewModel.swift
//  JobTracker
//
//  Created by Kalen Mclaughlin on 7/2/26.
//

import Foundation
import SwiftData

@Observable
class JobApplicationViewModel {

    var jobTitle: String = ""
    var companyName: String = ""
    var companyLocation: String = ""
    var jobSalary: Int = 0
    var applicationStatus: AppStatus = .applied
    var applicationDate: Date = .now
    var errorMessage: String?

    private var modelContext: ModelContext?

    func configure(with context: ModelContext) {
        self.modelContext = context
    }

    func addApplication() {
        guard let modelContext else { return }

        guard !jobTitle.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Job title can't be empty."
            return
        }
        guard !companyName.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Company name can't be empty."
            return
        }

        let newApplication = JobApplicationModel(
            jobTitle: jobTitle,
            companyName: companyName,
            companyLocation: companyLocation,
            jobSalary: String(jobSalary),
            applicationStatus: applicationStatus,
            applicationDate: applicationDate
        )

        modelContext.insert(newApplication)
        clearForm()
    }

    func clearForm() {
        jobTitle = ""
        companyName = ""
        companyLocation = ""
        jobSalary = 0
        applicationStatus = .applied
        applicationDate = .now
        errorMessage = nil
    }
}
