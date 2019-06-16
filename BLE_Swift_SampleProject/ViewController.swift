//
//  ViewController.swift
//  testBLESwift
//
//  Created by local on 3/21/19.
//  Copyright © 2019 pierdr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var simpleBluetoothIO: SimpleBluetoothIO!
    
    @IBOutlet var virtualButton:UISwitch!
    @IBOutlet weak var ledToggleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        simpleBluetoothIO = SimpleBluetoothIO(serviceUUID: "4fafc201-1fb5-459e-8fcc-c5c9c331914b", delegate: self)
    }
    
    @IBAction func ledToggleButtonDown(_ sender: UIButton) {
        simpleBluetoothIO.writeValue(value:49)
    }
    
    @IBAction func ledToggleButtonUp(_ sender: UIButton) {
        simpleBluetoothIO.writeValue(value: 77)
    }
    
}

extension ViewController: SimpleBluetoothIODelegate {
    func simpleBluetoothIO(simpleBluetoothIO: SimpleBluetoothIO, didReceiveValue value: Int8) {
        if value > 0 {
            //view.backgroundColor = UIColor.yellow
            virtualButton.setOn(false, animated: true)
        } else {
            //view.backgroundColor = UIColor.black
            virtualButton.setOn(true, animated: true)
        }
    }
}
