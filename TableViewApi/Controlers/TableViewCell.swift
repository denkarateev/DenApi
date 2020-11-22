//
//  TableViewCell.swift
//  TableViewApi
//
//  Created by Денис Каратеев on 19.10.2020.
//

import UIKit
import SVGKit
class TableViewCell: UITableViewCell {
   

    var activity = UIActivityIndicatorView()
    static let reuseIdentifier = "AllCountryTableViewCell"
    var image2 = UIImageView()
    var labelCountry = UILabel()
    var labelCapital = UILabel()
  //  var svgImage = SVGKImage(named: "afg")
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        labelCapital = .init()
        labelCountry = .init()
        image2 = .init()
        image2.translatesAutoresizingMaskIntoConstraints = false
        labelCountry.translatesAutoresizingMaskIntoConstraints = false
        labelCapital.translatesAutoresizingMaskIntoConstraints = false
        labelCapital.textColor = .black
        labelCountry.textColor = .black
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
        

       // let namSvgImgVyuVar = SVGKImageView(svgkImage: namSvgImgVar)
        
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView() {
        contentView.addSubview(labelCountry)
        contentView.addSubview(labelCapital)
        contentView.addSubview(image2)
        contentView.addSubview(activity)
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            labelCapital.topAnchor.constraint(equalTo: labelCountry.bottomAnchor, constant: 10),
            labelCapital.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 150),
            labelCountry.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            labelCountry.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 150),
            image2.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            image2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            image2.heightAnchor.constraint(equalToConstant: 70),
            image2.widthAnchor.constraint(equalToConstant: 70),
            
        ])
       // image2.frame.size.height = contentView.frame.height - 50
       
        
        activity.center.y = self.contentView.center.y
        activity.center.x = self.contentView.center.x - 90
        activity.startAnimating()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
