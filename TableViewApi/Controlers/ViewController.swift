//
//  ViewController.swift
//  TableViewApi
//
//  Created by Денис Каратеев on 19.10.2020.
//

import UIKit
protocol MyProtol {
    func number(indexPath: Int) -> Int
}
class ViewController: UIViewController{
 //   var networkWeatherManager = Network()
  
    private var viewTable = UITableView()
    var name2 = "Russia"
    override func viewDidLoad() {
        super.viewDidLoad()
        viewTable.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.viewTable.dataSource = self
        self.viewTable.delegate = self
        //
        self.viewTable.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        self.view.addSubview(viewTable)
        
      
    }
//    func updateInterfaceWith(weather: ModelData) {
//        DispatchQueue.main.async {
//            
//            self.name2 = weather.name
//            print(self.name2)
//        }
//    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        
        if indexPath.row == 2 {
//
        }
        if indexPath.row == 3 {
            
//            guard let url = URL(string: "https://restcountries.eu/rest/v2/name/\(self.name)") else { return }
//            let sesion  = URLSession.shared
//            sesion.dataTask(with: url) { (data, response, error) in
//                if let response = response {
//                    print(response)
//                }
//                guard let data = data else { return }
//                print(data)
//                do {
//                    let json = try JSONDecoder().decode(City.self, from: data)
//
//                    print(json)
//                } catch {
//                    print(error)
//                }
//            }.resume()
           // print(name)
        } else if indexPath.row == 4 {
            
            self.navigationController?.pushViewController(GetViewController(), animated: true)
        } else   {
            self.navigationController?.pushViewController(PreviewVC(text: "\(indexPath.row)", nibName: nil, bundle: nil), animated: true)
        }
    }
    deinit {
        print("deinit")
    }
   
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        if indexPath.row == 4 {
            
            cell.imageView?.image = UIImage(named: "lamba")
            cell.textLabel?.text = "Parse json"
        } else {
            cell.imageView?.image = UIImage(named: "lamba")
            cell.textLabel?.text = "\(indexPath.row)"
        }
       
        
        return cell
    }
   
    
}
// MARK: Delegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(70.0)
    }
    
}

