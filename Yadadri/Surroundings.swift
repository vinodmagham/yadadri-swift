//
//  Surroundings.swift
//  Yadadri
//
//  Created by Kvana Inc 2 on 10/06/16.
//  Copyright © 2016 Kvana Inc 2. All rights reserved.
//

import MapKit

class Surroundings: NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    var latitude: Double
    var longitude:Double
    var image:String?
    var pinEvent : NSArray?
    
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
