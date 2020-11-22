//
//  ViewController.swift
//  TableViewApi
//
//  Created by Денис Каратеев on 19.10.2020.
//

import UIKit
import SVGKit
class CountriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    var network = NetworkService()
    private var models: [CountrData]
    private let service: CountriesServiceProtocol
   
	var viewTable = UITableView()

	init(interactor: CountriesServiceProtocol) {
		self.service = interactor
		self.models = []
       
        super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}


    override func viewDidLoad() {
      
        super.viewDidLoad()
        self.navigationController?.title = "Country"
        viewTable.tableHeaderView = .init()
        service.getCountries() { countries in
			self.models = countries
			self.viewTable.reloadData()
        }
		viewTable.frame = view.frame
        viewTable.dataSource = self
        viewTable.delegate = self
        viewTable.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseIdentifier)
        view.addSubview(viewTable)
      
        
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
        return models.count
    }
    
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as! TableViewCell

		let model = models[indexPath.row]
		cell.labelCountry.text = "Country: \(model.name)"
		cell.labelCapital.text = "Capital: \(model.capital)"
		service.loadImage(from: model.flag) { image in
			cell.image2.image = image?.uiImage
		}
		return cell
	}

    // MARK: Delegate    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80.0)
    }
}

