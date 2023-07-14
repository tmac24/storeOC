//
//  HostViewController.swift
//  CDDStoreDemo
//
//  Created by cdql10103 on 2023/7/14.
//  Copyright © 2023 RocketsChen. All rights reserved.
//

import UIKit

class HostViewController: UIViewController, DataModelObserver {

    var countView :UILabel = {
        let label = UILabel();
        return label
    }()
    
    var addBtn :UIButton = {
        let btn = UIButton.init(type: .custom);
        btn.setTitle("add", for: .normal)
        btn.backgroundColor = UIColor.blue
        btn.addTarget(self, action: #selector(addBtnClick), for: .touchUpInside)
        return btn
    }()
    
    var nextBtn :UIButton = {
        let btn = UIButton.init(type: .custom);
        btn.setTitle("next", for: .normal)
        btn.backgroundColor = UIColor.blue
        btn.addTarget(self, action: #selector(nextBtnClick), for: .touchUpInside)
        return btn
    }()
    
    deinit {
      DataModel.shared.removeObserver(observer: self)
    }
    
    func onCountUpdate(newCount: Int64) {
      self.countView.text = String(format: "%d", newCount)
    }

    override func viewDidLoad() {
      super.viewDidLoad()
      
        view.backgroundColor = UIColor.white;
        countView.frame = CGRectMake(200, 200, 46, 60)
        view.addSubview(countView)

        addBtn.frame = CGRectMake(200, 500, 46, 60)
        view.addSubview(addBtn)
        
        nextBtn.frame = CGRectMake(200, 600, 46, 60)
        view.addSubview(nextBtn)

      DataModel.shared.addObserver(observer: self)
      onCountUpdate(newCount: DataModel.shared.count)
    }

    
    @objc func addBtnClick() {
        DataModel.shared.count = DataModel.shared.count + 1
    }
    
    @objc func nextBtnClick() {
        let navController = self.navigationController!
        // Based on the number of view controllers in the stack we push a
        // SingleFlutterViewController or DoubleFlutterViewController to alternatve
        // between the two.
        if DataModel.shared.count % 2 == 1 {
          let vc = SingleFlutterVC(withEntrypoint: nil)
          navController.pushViewController(vc, animated: true)
        } else {
          let vc = DoubleFlutterViewController()
          navController.pushViewController(vc, animated: true)
        }
    }
}
