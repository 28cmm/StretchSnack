//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Yilei Huang on 2019-02-21.
//  Copyright © 2019 Joshua Fang. All rights reserved.
//

import UIKit

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath as IndexPath)
       // let index = info[indexPath.row]
        cell.textLabel!.text = "\(info[indexPath.row])"
        return cell
    }
    
    
}

class ViewController: UIViewController{

    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var navBarView: UIView!
    @IBOutlet weak var addBut: UIButton!
    
    var info = [String]()
    var titleLabel: UILabel!
    var titleTopCons:NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myTableView.delegate = self
        myTableView.dataSource = self
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.contentMode = .scaleAspectFill
        stackView.clipsToBounds = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
       
        titleLabel = UILabel()
        titleLabel.text = "SNACKS"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        navBarView.addSubview(titleLabel)
        
        titleTopCons = titleLabel.topAnchor.constraint(equalTo: navBarView.topAnchor, constant:40)
        titleLabel.trailingAnchor.constraint(equalTo: navBarView.trailingAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: navBarView.leadingAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        titleTopCons.isActive = true
        
        
        stackView.topAnchor.constraint(equalTo: navBarView.topAnchor, constant: 20 + addBut.frame.height  + titleTopCons.constant).isActive = true
        stackView.bottomAnchor.constraint(equalTo: navBarView.bottomAnchor, constant: -10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: navBarView.trailingAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: navBarView.leadingAnchor).isActive = true
   
       
        
        
        
        let imageView1 = UIImageView(image: UIImage(named: "oreos"))
         let imageView2 = UIImageView(image: UIImage(named: "pizza_pockets"))
         let imageView3 = UIImageView(image: UIImage(named: "pop_tarts"))
         let imageView4 = UIImageView(image: UIImage(named: "popsicle"))
         let imageView5 = UIImageView(image: UIImage(named: "ramen"))
        stackView.addArrangedSubview(imageView1)
        stackView.addArrangedSubview(imageView2)
        stackView.addArrangedSubview(imageView3)
        stackView.addArrangedSubview(imageView4)
        stackView.addArrangedSubview(imageView5)
       
        
        for i in 0..<5{
            stackView.subviews[i].isUserInteractionEnabled = true
            stackView.subviews[i].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.image)))
          }
    }
    @objc func image(_ sender: UITapGestureRecognizer){
        let viewImg = sender.view as! UIImageView
        if viewImg.image == UIImage(named: "oreos"){
            info.append("oreos")
        }else if viewImg.image == UIImage(named: "pizza_pockets"){
            info.append("pizza_pockets")
        }else if viewImg.image == UIImage(named: "pop_tarts"){
            info.append("pop_tarts")
        }else if viewImg.image == UIImage(named: "popsicle"){
            info.append("popsicle")
        }else if viewImg.image == UIImage(named: "ramen"){
            info.append("ramen")
        }
        myTableView.reloadData()
        
    }

    @IBAction func addButton(_ sender: Any) {
        if(heightConstraint.constant == 200){
            heightConstraint.constant = 66
            titleTopCons.constant = 40
            titleLabel.text = "SNACKS"
        }else{
            heightConstraint.constant = 200
            titleLabel.text = "Add a SNACK"
            titleTopCons.constant = 60
            
        }
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
            self.addBut.transform = self.addBut.transform.rotated(by: CGFloat.pi/4)
        })
      
        
    }
    
}

