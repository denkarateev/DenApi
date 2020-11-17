//
//  TableViewCell.swift
//  TableViewApi
//
//  Created by Денис Каратеев on 19.10.2020.
//

import UIKit

class TableViewCell: UITableViewCell {
    static let reuseIdentifier = "AllCountryTableViewCell"
    var image2 = UIImageView()
    var labelCountry = UILabel()
    var labelCapital = UILabel()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        labelCapital = .init()
        labelCountry = .init()
        labelCountry.translatesAutoresizingMaskIntoConstraints = false
        labelCapital.translatesAutoresizingMaskIntoConstraints = false
        labelCapital.textColor = .black
        labelCountry.textColor = .black
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()  
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView() {
        contentView.addSubview(labelCountry)
        contentView.addSubview(labelCapital)
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            labelCapital.topAnchor.constraint(equalTo: labelCountry.bottomAnchor, constant: 10),
            labelCapital.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 150),
            labelCountry.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            labelCountry.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 150)
            
        ])
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
