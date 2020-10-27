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
    
    private var viewTable = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewTable.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.viewTable.dataSource = self
        self.viewTable.delegate = self
        //
        self.viewTable.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        self.view.addSubview(viewTable)
        print("didload")
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 3 {
            UIApplication.shared.openURL(URL(string: "https://api.instagram.com/oauth/authorize?client_id=990602627938098&redirect_uri=https://socialsizzle.herokuapp.com/auth/&scope=user_profile,user_media&response_type=code")!)
        } else {
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
        cell.imageView?.image = UIImage(named: "lamba")
        cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
    }
   
    
}
// MARK: Delegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(70.0)
    }
    
}

