//
//  Bundle+Extensions.swift
//
//
//  Created by TaimurAyaz on 2024-03-15.
//

import Foundation

// MARK: - Application
public extension Bundle {
    /// Retrieves the display name of the application from the Info.plist file.
    var applicationName: String {
        object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ??
            object(forInfoDictionaryKey: "CFBundleName") as? String ?? ""
    }
    
    /// Retrieves the bundle identifier of the application.
    var applicationIdentifier: String { getInfo("CFBundleIdentifier") }
    
    /// Retrieves the build version of the application.
    var applicationBuildVersion: String { getInfo("CFBundleVersion") }
    
    /// Retrieves the version number of the application.
    var applicationVersion: String { getInfo("CFBundleShortVersionString") }
    
    /// Retrieves the development region of the application.
    var applicationLanguage: String { getInfo("CFBundleDevelopmentRegion") }
    
    /// Retrieves the copyright information of the application.
    var applicationCopyright: String { getInfo("NSHumanReadableCopyright").replacingOccurrences(of: "\\\\n", with: "\n") }
}

// MARK: - Private
private extension Bundle {
    /// Retrieves information from the Info.plist file based on the provided key.
    /// - Parameter str: The key to search for in the Info.plist file.
    /// - Returns: The value associated with the provided key, if found; otherwise, an empty string.
    func getInfo(_ str: String) -> String { infoDictionary?[str] as? String ?? "" }
}
