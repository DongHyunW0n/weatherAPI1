//
//  ViewController.swift
//  weatherAPI
//
//  Created by WonDongHyun on 2023/03/27.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var stackView: UIStackView!
    
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
    func configureView(weatherInformation : weatherInformation){
        
        self.cityNameLabel.text = weatherInformation.name
        
        if let weather = weatherInformation.weather.first {
            self.weatherDescriptLabel.text = weather.description
        }
        self.tempLabel.text = "\(Int(weatherInformation.temp.temp - 273.15))'C"
        self.minTempLabel.text = "최저 : \(Int(weatherInformation.temp.minTemp - 273.15))'C"
        
        self.maxTempLabel.text = "최고 : \(Int(weatherInformation.temp.maxTemp - 273.15))'C"
        
        
    }
    
    func showAlert (message : String) {
        
        let alert = UIAlertController(title: "ERROR", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        self.present(alert, animated: true)
    }
    
    
    
    func getCurrentWeather(cityName: String) {
        
       
        
        
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=16882ac4cd0b46d7e00aa2af67233f5c") else{
            return
        }
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: url){ [weak self] data , response , error in
            
            let successRange = (200..<300)
            guard let data = data, error == nil else {return} // 데이터가 있고 에러가 없을때 다음 줄이 실행되게 옵셔널 바인딩
            let decoder = JSONDecoder()
            
            if let response = response as? HTTPURLResponse, successRange.contains(response.statusCode) {
                guard let weatherInformation = try? decoder.decode(weatherInformation.self, from: data) else{
                    return
                } //서버에서 받은걸 weahter information 객체로 변환
                DispatchQueue.main.async {
                    self?.stackView.isHidden = false
                    self?.configureView(weatherInformation: weatherInformation)
                }
                
            } else {
                
                guard let errorMessage = try? decoder.decode(errorMessage.self, from: data) else {return}
                DispatchQueue.main.async {
                    self?.showAlert(message: errorMessage.message)
                }
            }
            
            
        }.resume()
        
    }
    
}

