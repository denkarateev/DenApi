//
//  PreviewVC.swift
//  TableViewApi
//
//  Created by Денис Каратеев on 19.10.2020.
//

import UIKit

class PreviewVC: UIViewController {
  
    
    var previewImage = UIImageView()
    
    var privewlabel = UILabel(frame: .zero)
   
    init(text: String, nibName: String?, bundle: Bundle?) {
        self.privewlabel.text = text
           super.init(nibName: nibName, bundle: bundle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        addLabel(privewlabel)
        addImage(previewImage)
        privewlabel.translatesAutoresizingMaskIntoConstraints = false
        privewlabel.topAnchor.constraint(equalTo: previewImage.bottomAnchor, constant: 100).isActive = true
        privewlabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 150).isActive = true
        privewlabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 150).isActive = true
        privewlabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
     //   privewlabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        print("didload")
     //   CityElement(name: <#T##String#>)
       
    }
    override func viewWillLayoutSubviews() {
      
    }
    override func updateViewConstraints() {
        privewlabel.topAnchor.constraint(equalTo: previewImage.bottomAnchor, constant: 170).isActive = true
        super.updateViewConstraints()
    }
    private func addLabel(_ label: UILabel) {
     //   label.frame = CGRect(x: self.view.bounds.size.width / 4, y: self.view.center.y + 200, width: 150, height: 50)
        self.view.addSubview(label)
    }
    private func addImage(_ preview: UIImageView) {
    preview.frame = CGRect(x: self.view.center.x, y: self.view.center.y, width: 30, height: 30)
    preview.center = self.view.center
    preview.image = UIImage(named: "lamba")
        self.view.addSubview(preview)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

