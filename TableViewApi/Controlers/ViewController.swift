//
//  ViewController.swift
//  TableViewApi
//
//  Created by Денис Каратеев on 19.10.2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var models: [CountrData]
    
    private let interactor: NetworService
    var viewTable = UITableView()
    var network = NetworService()
        init(interactor: NetworService) {
                self.interactor = interactor
                self.models = []
           
                super.init(nibName: nil, bundle: nil)
            }
    
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    
    override func viewDidLoad() {
      
        super.viewDidLoad()
        self.interactor.fetch(number: 4) {  modelData in
            DispatchQueue.main.async {
                do {
                     self.models = try modelData.get()
                    self.viewTable.reloadData()
                   
                  } catch {
                      print(error.localizedDescription)
                  }
            }
            
        }
        
       
       
        print(self.models.count)
        viewTable.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.viewTable.dataSource = self
        self.viewTable.delegate = self
        //
        self.viewTable.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        self.view.addSubview(viewTable)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
        }
        if indexPath.row == 3 {
            
            //
        } else if indexPath.row == 4 {
            
            navigationController?.pushViewController(GetViewController(), animated: true)
        } else   {
            navigationController?.pushViewController(PreviewVC(text: "\(indexPath.row)", nibName: nil, bundle: nil), animated: true)
        }
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.interactor.fetch(number: 4) {  modelData in

            do {
                 self.models = try modelData.get()
               
              } catch {
                  print(error.localizedDescription)
              }
        }
        return self.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        if indexPath.row == 4 {
            cell.labelCountry.text = "vdvfvdf"
            cell.labelCountry.frame = CGRect(x: 0, y: 0, width: 100, height: 0)
            cell.imageView?.image = UIImage(named: "lamba")
            cell.imageView?.layer.cornerRadius = 20
            cell.imageView?.clipsToBounds = true
            cell.textLabel?.text = "Parse json"
        } else {
            self.interactor.fetch(number: indexPath.row) {  modelData in
                DispatchQueue.main.async {
                    do {
                        try cell.textLabel?.text = modelData.get()[indexPath.row].name
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            
            cell.imageView?.layer.cornerRadius = 20
            cell.imageView?.clipsToBounds = true
            cell.imageView?.image = UIImage(named: "lamba")
        }
        
        return cell
    }
    
    
    
    // MARK: Delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80.0)
    }
    
    
}

