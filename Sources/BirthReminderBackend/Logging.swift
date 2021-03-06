//
//  Logging.swift
//  BirthReminderBackendPackageDescription
//
//  Created by Captain雪ノ下八幡 on 2018/2/9.
//

import PerfectLogger
import PerfectHTTP
import PerfectLib
import Foundation

public func logNew(request: HTTPRequest) -> String {
    let eventID = UUID().string
    LogFile.info("New request at \(request.path), requestBody: \(request.postBodyBytes?.string ?? "No")", eventid: eventID, logFile: logFilePath)
    return eventID
}

public func logInvalid(request: HTTPRequest, eventID: String, description: String? = nil) {
    LogFile.info("Invalid request at \(request.path), with description: \(description ?? "No")", eventid: eventID, logFile: logFilePath)
}

public func logInternalError(with request: HTTPRequest, eventID: String, description: String? = nil) {
    LogFile.error("Internal error at \(request.path), with description: \(description ?? "No")", eventid: eventID, logFile: logFilePath)
}

fileprivate extension Array where Element == UInt8 {
    var string: String? {
        let data = Data(bytes: self)
        return String(data: data, encoding: .utf8)
    }
}
