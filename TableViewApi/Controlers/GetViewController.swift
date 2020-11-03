//
//  GetViewController.swift
//  TableViewApi
//
//  Created by Денис Каратеев on 27.10.2020.
//

import UIKit
class GetViewController: UIViewController {
 
    //var networkWeatherManager = Network()
    
    var get = UIButton(frame: .zero)
    var name = UILabel()
    var net = NetworService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        get.isEnabled = true
        get.frame = CGRect(x: view.frame.midX, y: view.frame.midY, width: 100, height: 100)
        get.setTitle("Get", for: .normal)
        get.setTitleColor(.black, for: .normal)
        get.setTitleColor(.green, for: .selected)
        get.addTarget(self, action: #selector(getData), for: .touchUpInside)
        view.addSubview(get)
        name.frame = CGRect(x: view.frame.midX, y: view.frame.midY + 150, width: 100, height: 100)
        view.backgroundColor = .white
        name.text = "fsf"
        
        name.textColor = .black
        view.addSubview(name)
        net.fetch(forCountry: "USA") {[ unowned self] modelData in
            
        }
       
    }

    @objc func getData() {
       
       
        self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) {[unowned self] city in
            self.net.fetch(forCountry: city) { modelData in
                update(modelData: modelData)
            }
          
            }
        
        }
            
    func update(modelData: Country)  {
        DispatchQueue.main.async {
            self.name.text = modelData.name
        }
        
    }
   
}
