//
//  UpdatePinController.swift
//  LocationAnnotationMap
//
//  Created by MacStudent on 2020-01-13.
//  Copyright © 2020 Dharam Singh. All rights reserved.
//

import Foundation
import UIKit
class UpdatePinController: UIViewController {
    
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var tileTxt: UITextField!
    
    @IBOutlet weak var longTxt: UITextField!
    @IBOutlet weak var latTxt: UITextField!
    @IBOutlet weak var subtitleTxt: UITextField!
    
    
    
    @IBAction func updatePindata(_ sender: Any) {
        
        
        self.appdelegate.updateRecord(location: locaton, title: tileTxt.text!, subTitle: Int(subtitleTxt.text!)!, latitude: Double(latTxt.text!)!, longitude: Double(longTxt.text!)!)
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    var locaton = LocationData()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tileTxt.text = locaton.title
        subtitleTxt.text = locaton.subTitle.description
        longTxt.text = locaton.longitude.description
        latTxt.text = locaton.latitude.description
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    
    
    
}
// Tableview Datasource and Delegate



