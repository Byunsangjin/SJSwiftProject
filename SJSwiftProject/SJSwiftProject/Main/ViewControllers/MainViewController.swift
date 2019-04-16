//
//  ViewController.swift
//  SJSwiftProject
//
//  Created by Byunsangjin on 16/04/2019.
//  Copyright © 2019 Byunsangjin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK:- Variables
    
    
    
    // MARK:- Constants
    let titleArray = ["Gradation"]
    let viewControllerArray = ["GradationViewController"]
    
    
    // MARK:- Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}



extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboardName = titleArray[indexPath.row]
        let storyboard = UIStoryboard.init(name: storyboardName, bundle: nil)
        
        let VCName = viewControllerArray[indexPath.row]
        let VC = storyboard.instantiateViewController(withIdentifier: VCName)
        
        self.navigationController?.pushViewController(VC, animated: true)
    }
}



extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! tableCell
        
        cell.titleLabel.text = self.titleArray[indexPath.row]
        
        return cell
    }
}



class tableCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    
}

