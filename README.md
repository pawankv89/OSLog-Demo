
OSLog Demo
=========

## OSLog as a replacement of print and NSLog is the recommended way of logging by Apple, in Swift 5.
------------

 Added Some screens here.
 
![](https://github.com/pawankv89/OSLog-Demo/blob/master/images/screen_1.png)
![](https://github.com/pawankv89/OSLog-Demo/blob/master/images/screen_2.png)




## Usage
------------
 
OSLog makes it possible to log per category, which can be used to filter logs using the Console app. By defining a small extension you can easily adopt multiple categories

```swift

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

```

This extension uses the bundle identifier of the app and creates a static instance for each category. In this case, we have a view cycle category, which we can use to log in our app:

```swift
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

```

## Log levels
The OSLog API requires to pass in an OSLogType which can be used to automatically send messages at the appropriate level.

# default:
The default log level, which is not really telling anything about the logging. It’s better to be specific by using the other log levels.
# info:
Call this function to capture information that may be helpful, but isn’t essential, for troubleshooting.
# debug:
Debug-level messages are intended for use in a development environment while actively debugging.
# error:
Error-level messages are intended for reporting critical errors and failures.
# fault:
Fault-level messages are intended for capturing system-level or multi-process errors only.


## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).

## Change-log

A brief summary of each this release can be found in the [CHANGELOG](CHANGELOG.mdown). 
