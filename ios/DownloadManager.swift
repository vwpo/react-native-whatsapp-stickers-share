//
//  DownloadManager.swift
//  WhatsAppStickersShare
//
//  Created by Ivan K on 02/04/2020.
//  Copyright © 2020 Facebook. All rights reserved.
//

import Foundation

class DownloadManager {
    private init() {}
    
    static var shared: DownloadManager = {
        let instance = DownloadManager()
        return instance
    }()
    
    static func createTempFilename() {
        let directory = NSTemporaryDirectory()
        let fileName = NSUUID().uuidString

        return NSURL.fileURL(withPathComponents: [directory, fileName])
    }
 
    func get(url: NSURL, completion:(_ path:String, _ error:NSError!) -> Void) {
        let destination = DownloadManager.createTempFilename();
        
        if NSFileManager().fileExistsAtPath(destination.path!) {
            completion(path: destination.path!, error: nil)
        } else {
            let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
            let session = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
            let request = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "GET"
            let task = session.dataTaskWithRequest(request, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
                if (!error) {
                    if let response = response as? NSHTTPURLResponse {
                        if response.statusCode >= 200 && response.statusCode < 300 {
                            if data.writeToURL(destinationUrl, atomically: true) {
                                return completion(path: destinationUrl.path!, error: nil)
                            }
                        }
                    }
                }
                completion(path: destination.path!, error: NSError(domain: "Error saving file"))
            })
            task.resume()
        }
    }
}
