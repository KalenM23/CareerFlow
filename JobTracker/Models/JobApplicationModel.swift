//
//  JobApplication.swift
//  JobTracker
//
//  Created by Kalen Mclaughlin on 6/30/26.
//

import Foundation
import SwiftData

@Model
class JobApplicationModel {
    
    // MARK: Properties
    var jobTitle: String
    var companyName: String
    var companyLocation: String
    var jobSalary: String
    var applicationStatus: AppStatus = AppStatus.applied
    var applicationDate: Date
    
    
    // MARK: Initializer
    
    init(
        jobTitle: String,
        companyName: String,
        companyLocation: String,
        jobSalary: String,
        applicationStatus: AppStatus,
        applicationDate: Date
    ) {
        self.jobTitle = jobTitle
        self.companyName = companyName
        self.companyLocation = companyLocation
        self.jobSalary = jobSalary
        self.applicationStatus = applicationStatus
        self.applicationDate = applicationDate
    }
    
    
   
}

// MARK: Enums
enum AppStatus: String, Codable {
    
    case applied, underreview, interviewscheduled, interviewing, offerreceived,
         accepted, rejected, withdrawn
}




