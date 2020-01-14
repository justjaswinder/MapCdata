//
//  ViewController.swift
//  LocationAnnotationMap
//
//  Created by Dharam Singh on 2020-01-10.
//  Copyright © 2020 Dharam Singh. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,MKMapViewDelegate{
    
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    var locatonSingle = LocationData()
    var pTitle = ""
    var pSubTitle = 0
    var pLatitude = 0.0
    var pLongitude = 0.0
    var locationDataArray = [LocationData]()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
    }
    
    
    // Button Actions
    @IBAction func editBtnPressed(_ sender: Any) {
        
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EditViewController") as? EditViewController {
            
//            viewController.latitude = pLatitude
//            viewController.longitude = pLongitude
            
            
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    func setPins() {
        
        var locValue:CLLocationCoordinate2D = CLLocationCoordinate2D()
        
        print("latitude" + "\(locValue.latitude)")
        print("latitude" + "\(locValue.longitude)")
        
        
        var pinPoint = [MKPointAnnotation]()
        
        locationDataArray = appdelegate.fetchRecords()
        
        for i in 0..<locationDataArray.count{
            let annotation = MKPointAnnotation()
            
            locValue.latitude = locationDataArray[i].latitude
            locValue.longitude = locationDataArray[i].longitude
            
            annotation.coordinate = locValue
            mapView.isZoomEnabled = false
            
            mapView.removeAnnotations(mapView.annotations)
            
            annotation.title = locationDataArray[i].title
            annotation.subtitle = locationDataArray[i].subTitle.description
            
            self.mapView.showAnnotations(self.mapView.annotations, animated: true)
            
            pinPoint.append(annotation)
            //  mapView.addAnnotation(annotation)
        }
        mapView.addAnnotations(pinPoint)
        
        let loca = CLLocationCoordinate2DMake(locValue.latitude,
                                              locValue.longitude)
        let coordinateRegion = MKCoordinateRegion(center: loca,
                                                  latitudinalMeters: 4000000, longitudinalMeters: 4000000)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //     mapDelegate()
        setPins()
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        if let annotationTitle = view.annotation?.title
        {
            print("User tapped on annotation with title: \(annotationTitle!)")
        }
        
        let alert = UIAlertController(title: "Info", message: "Select one", preferredStyle: .alert)
        
        
        let ok = UIAlertAction(title: "Delete", style: .default, handler: { (action) -> Void  in
            
            //     var selectedAnnotation = view.annotation
            
            for i in 0..<self.locationDataArray.count{
                if(self.locationDataArray[i].subTitle ==  Int32(((view.annotation?.subtitle)!)!) ){
                    self.appdelegate.deleteRecord(location: self.locationDataArray[i])
                    
                    self.setPins()
                    break
                }
            }
        })
        let edit = UIAlertAction(title: "Edit", style: .default, handler: { (action) -> Void  in
            
            print("edit")
            
            if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UpdatePinController") as? UpdatePinController {
                
                
                for i in 0..<self.locationDataArray.count{
                    if(self.locationDataArray[i].subTitle ==  Int32(((view.annotation?.subtitle)!)!) ){
                        self.locatonSingle = self.locationDataArray[i]
                        break
                    }}
                //   viewController.latitude = pLatitude
                
                viewController.locaton = self.locatonSingle
                
                
                if let navigator1 = self.navigationController {
                    navigator1.pushViewController(viewController, animated: true)
                }
            }
            
            
            
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: { (action) -> Void  in
            
            print("cancel")
        })
        alert.addAction(edit)
        alert.addAction(ok)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
}

// Map Delegate functons




