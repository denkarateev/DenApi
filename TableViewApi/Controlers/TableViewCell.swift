//
//  TableViewCell.swift
//  TableViewApi
//
//  Created by Денис Каратеев on 19.10.2020.
//

import UIKit

class TableViewCell: UITableViewCell {
    var image2 = UIImageView()
    var labelCountry = UILabel()
    
 
  
    override func awakeFromNib() {
        super.awakeFromNib()
        
        labelCountry.frame = CGRect(x: 0, y: 0, width: 200, height: 20)
       addSubview(labelCountry)
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
