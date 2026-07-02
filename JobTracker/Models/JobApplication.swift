//
//  JobApplication.swift
//  JobTracker
//
//  Created by Kalen Mclaughlin on 6/30/26.
//

import Foundation


struct JobApplication {
    
    // MARK: Properties
    var jobTitle: String
    var companyName: String
    var companyLocation: String
    var jobSalary: Int
    var aaplicationStatus = AppStatus.applied
    var applicationDate: Date
    
   
}

// MARK: Enums
enum AppStatus {
    
    case applied, underreview, interviewscheduled, interviewing, offerreceived,
         accepted, rejected, withdrawn
}


