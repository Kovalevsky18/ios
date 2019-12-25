//
//  RecordsViewController.swift
//  RealRacing
//
//  Created by Родион Ковалевский on 11/21/19.
//  Copyright © 2019 Родион Ковалевский. All rights reserved.
//

import UIKit

class RecordsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var user = UserDefaults.standard.value(BaseElement.self, forKey: "name")
        print(user)

    }
    

    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)

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
