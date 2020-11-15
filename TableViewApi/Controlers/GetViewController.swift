//
//  GetViewController.swift
//  TableViewApi
//
//  Created by Денис Каратеев on 27.10.2020.
//

import UIKit

class GetViewController: UIViewController {
   
    //var networkWeatherManager = Network()
    var capitalLabel = UILabel()
    var get = UIButton(frame: .zero)
    var name = UILabel()
    var flagImage = UIImageView()
    var net = NetworService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        get.isEnabled = true
        get.frame = CGRect(x: view.frame.midX, y: view.frame.midY, width: 200, height: 100)
        get.setTitle("Введите страну", for: .normal)
        get.setTitleColor(.black, for: .normal)
        get.setTitleColor(.green, for: .selected)
        get.addTarget(self, action: #selector(getData), for: .touchUpInside)
        view.addSubview(get)
        name.frame = CGRect(x: view.frame.midX, y: view.frame.midY - 150, width: 150, height: 100)
        view.backgroundColor = .white
        
        capitalLabel.frame = CGRect(x: view.frame.midX - name.frame.width , y: view.frame.midY - 150, width: 150, height: 100)
        view.addSubview(capitalLabel)
        name.textColor = .black
        view.addSubview(name)
        flagImage.frame = CGRect(x: view.frame.midX - 100 , y: view.frame.midY - flagImage.frame.height + 200, width: 200, height: 200)
     
        flagImage.image = UIImage(systemName: "bed.double")
        flagImage.contentMode = .scaleAspectFit
      view.addSubview(flagImage)
        
        view.backgroundColor = #colorLiteral(red: 0.3076115251, green: 0.5245267153, blue: 0.6718835831, alpha: 1)
       
       
    }

    @objc func getData() {
       
       
//        self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) {[unowned self] city in
//            self.net?.fetch(number: 1, forCountry: city) {  modelData in
//                do {
//                    try update(modelData: .success(modelData.get()[1]))
//                    
//                  } catch {
//                      print(error.localizedDescription)
//                  }
//            }
//          
//            }
        
        }
            
    func update(modelData: Result<CountrData, Error>)  {
        DispatchQueue.main.async {
          try! self.name.text = modelData.get().name
            try! self.capitalLabel.text = modelData.get().capital
           
//            let date = Date()
//            let dateFormater = DateFormatter()
//            dateFormater.dateFormat = "HH:mm:ss"
            
//            dateFormater.timeZone = TimeZone(abbreviation: "GMT")
//            var formatteddate = dateFormater.string(from: date as Date)
           // self.capitalLabel.text = "Capital: \(modelData.capital)"
//            self.capitalLabel.text = "\(modelData.capital) \(formatteddate)"
          
        }
        
    }
   
}
