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
        
        if let cityName = self.cityNameTextField.text {
            
            self.getCurrentWeather(cityName: cityName)
            self.view.endEditing(true)
        }
    }
    
    
    
    func getCurrentWeather(cityName: String) {
        
       
        
        
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=16882ac4cd0b46d7e00aa2af67233f5c") else{
            return
        }
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: url){ data , response , error in
            
            guard let data = data, error == nil else {return} // 데이터가 있고 에러가 없을때 다음 줄이 실행되게 옵셔널 바인딩
            let decoder = JSONDecoder()
            let weatherInformation = try? decoder.decode(weatherInformation.self, from: data) //서버에서 받은걸 weahter information 객체로 변환
            
            debugPrint(cityName)
            debugPrint(weatherInformation)
        }.resume()
        
    }
    
}

