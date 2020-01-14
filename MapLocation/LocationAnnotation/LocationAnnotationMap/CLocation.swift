//
//  CLocation.swift
//  CoreLocation
//
//  Created by Dharam Singh on 2020-01-10.
//  Copyright © 2020 Dharam Singh. All rights reserved.
//

import MapKit
import UIKit
import CoreLocation

class MyAnnotation: NSObject,MKAnnotation {

var title : String?
var subTit : String?
var coordinate : CLLocationCoordinate2D

init(title:String,coordinate : CLLocationCoordinate2D,subtitle:String){

    self.title = title;
    self.coordinate = coordinate;
    self.subTit = subtitle;

}

}
