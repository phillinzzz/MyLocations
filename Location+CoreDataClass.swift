//
//  Location+CoreDataClass.swift
//  MyLocations
//
//  Created by 戴林 on 2018/9/8.
//  Copyright © 2018年 potatosoft.co.ltd. All rights reserved.
//
//

import Foundation
import CoreData
import MapKit

@objc(Location)
public class Location: NSManagedObject, MKAnnotation {
    public var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(latitude, longitude)
    }
    
    public var title: String? {
        if locationDescription.isEmpty {
            return "(No Description)"
        } else {
            return locationDescription
        }
    }
    
    public var subtitle: String? {
        return category
    }
    
    class func nextPhotoID() -> Int {
        let userDefaults = UserDefaults.standard
        let currentID = userDefaults.integer(forKey: "PhotoID") + 1
        userDefaults.set(currentID, forKey: "PhotoID")
        userDefaults.synchronize()
        return currentID
    }
    
    func removePhotoFile() {
        if hasPhoto {
            do  {
                try FileManager.default.removeItem(at: photoURL)
            } catch {
                print("Error removing file: \(error)")
            }
        }
    }
    
    var hasPhoto: Bool {
        return photoID != 0
    }
    
    var photoURL: URL {
        //assert(photoID != nil, "No Photo ID set!")
        let filename = "Photo-\(photoID.intValue).jpg"
        return applicationDocumentsDirectory.appendingPathComponent(filename)
    }
    
    var photoImage: UIImage? {
        return UIImage(contentsOfFile: photoURL.path)
    }

}
