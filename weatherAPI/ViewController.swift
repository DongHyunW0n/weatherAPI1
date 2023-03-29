//
//  ViewController.swift
//  weatherAPI
//
//  Created by WonDongHyun on 2023/03/27.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var cityNameTextField : UITextField!
    
    @IBOutlet weak var cityNameLabel : UILabel!
    
    @IBOutlet weak var weatherDescriptLabel : UILabel!
    
    @IBOutlet weak var tempLabel : UILabel!
    
    @IBOutlet weak var minTempLabel : UILabel!
    
    @IBOutlet weak var maxTempLabel : UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tabGetButton(_ sender: UIButton) {
    }
    
    
    
    func getCurrentWeather(cityName: String) {
        
        
        let url = URL(string: <#T##String#>)
        
    }
}

