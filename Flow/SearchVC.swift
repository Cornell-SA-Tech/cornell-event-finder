//
//  SearchVC.swift
//  Flow
//
//  Created by Vicente Caycedo on 12/3/16.
//  Copyright © 2016 SA Tech. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {

    @IBOutlet weak var segControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Hides navigation bar from all views
        self.navigationController?.isNavigationBarHidden = true
        
        segControl.removeBorders()
        
        //TODO: Segmented Control Appearance
        
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func viewWillDisappear(_ animated: Bool) {
        //Shows navigation bar on all views.
        self.navigationController?.isNavigationBarHidden = false
    }
    
}




extension UISegmentedControl {
    func removeBorders() {
        setBackgroundImage(imageWithColor(color: UIColor.white), for: .normal, barMetrics: .default)
        setBackgroundImage(imageWithColor(color: tintColor!), for: .selected, barMetrics: .default)
        setDividerImage(imageWithColor(color: UIColor.clear), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
    }
    
    // create a 1x1 image with this color
    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }
}



