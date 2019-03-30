//
//  ViewController.swift
//  OSLog Demo
//
//  Created by Pawan kumar on 29/03/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import UIKit
import os.log

extension OSLog {
    private static var subsystem = Bundle.main.bundleIdentifier!
    
    // Logs the view cycles like viewDidLoad.
    static let viewCycle = OSLog(subsystem: subsystem, category: "viewcycle")
    
    // Logs the view User Details like viewDidLoad.
    static let userDetails = OSLog(subsystem: subsystem, category: "userdetails")
    
    // Logs the User Email like viewDidLoad.
    static let userEmail = OSLog(subsystem: subsystem, category: "useremail")
    
    // Logs the User Account like viewDidLoad.
    static let userAccount = OSLog(subsystem: subsystem, category: "useraccount")
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //All Types of Logs
        os_log("View did load!", log: OSLog.viewCycle, type: .info)
        os_log("View did load!", log: OSLog.viewCycle, type: .default)
        os_log("View did load!", log: OSLog.viewCycle, type: .error)
        os_log("View did load!", log: OSLog.viewCycle, type: .debug)
        
        //Try this type of Logs
        os_log("User Full Name %{PUBLIC}@ logged in", log: OSLog.userDetails, type: .info, "Pawan Kumar")
        os_log("User Last Name %{PUBLIC}@ logged in", log: OSLog.userDetails, type: .info, "Sharma")
        os_log("User Email %{PRIVATE}@ logged in", log: OSLog.userEmail, type: .debug, "xyz@gmail.com")
        os_log("User Account %{PRIVATE}@ logged in", log: OSLog.userAccount, type: .debug, "iOS Developer")
    }

}

