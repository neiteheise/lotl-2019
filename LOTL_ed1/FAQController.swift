//
//  FAQController.swift
//  LOTL_ed1
//
//  Created by Nathan Hellmuth on 5/30/19.
//  Copyright © 2019 Lighting of the Lawn. All rights reserved.
//

import UIKit

class FAQController: UIViewController {

    @IBOutlet weak var menuview: UIView!
    @IBOutlet weak var leading: NSLayoutConstraint!
    @IBOutlet weak var trailing: NSLayoutConstraint!
    
    var menuout = true;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scrsize:  CGRect = UIScreen.main.bounds
        let swidth = scrsize.width
        leading.constant = -240
        trailing.constant = swidth
        navBarImage()
        content()
        menuview.superview?.bringSubviewToFront(menuview)
        // Do any additional setup after loading the view.
    }
    
   func navBarImage(){
        let navControl = navigationController!
        navControl.navigationBar.barStyle = UIBarStyle.black;
        let image = #imageLiteral(resourceName: "Bar image")
        let imageView = UIImageView(image: image)
                  
        let bannerWidth = navControl.navigationBar.frame.size.width
        let bannerHeight = navControl.navigationBar.frame.size.height
                
        let bannerX = bannerWidth / 2 - image.size.width
        let bannerY = bannerHeight / 2 - image.size.height
                  
        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height : bannerHeight)
        imageView.contentMode = .scaleAspectFit
                  
        navigationItem.titleView = imageView
                  
        let imgvb = UIImage(named: "Hamburger_icon.svg")
        let button = UIBarButtonItem(image: imgvb, style: .plain, target: self, action: #selector(menuslide))
        button.image = imgvb
        button.tintColor = UIColor.white
        navigationItem.leftBarButtonItem = button
                  
        let button2 = UIBarButtonItem()
        button2.title = "            "
        button2.tintColor = UIColor(red:0.00, green:0.12, blue:0.42, alpha:1.0)
        navigationItem.rightBarButtonItem = button2
                  
    }
    
    func content(){
        let screensize: CGRect = UIScreen.main.bounds
        let swidth = screensize.width
        let sheight = screensize.height
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: swidth, height: sheight))
        
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        
        view.addSubview(scrollView)
        
        
        let image = #imageLiteral(resourceName: "FAQfinalp1")
        let imageView = UIImageView(image: image)
        
        let iWidth = scrollView.frame.width + 12
        let iHeight = scrollView.frame.width * 1.926
        let iX = scrollView.frame.minX
        let iY = scrollView.frame.minY
        imageView.sizeToFit()
        imageView.frame = CGRect(x: iX, y: iY, width: iWidth, height : iHeight)
        imageView.contentMode = .scaleAspectFill
        scrollView.addSubview(imageView)
        
        
        let image2 = #imageLiteral(resourceName: "FAQfinalp2")
        let imageView2 = UIImageView(image: image2)
        
        let iWidth2 = scrollView.frame.width
        let iHeight2 = scrollView.frame.width * 1.9
        let iX2 = scrollView.frame.minX
        let iY2 = imageView.frame.size.height
        imageView2.sizeToFit()
        imageView2.frame = CGRect(x: iX2 - 7, y: iY2, width: iWidth2, height : iHeight2)
        imageView2.contentMode = .scaleAspectFill
        scrollView.addSubview(imageView2)
        
        let image3 = #imageLiteral(resourceName: "FAQfinalp3")
        let imageView3 = UIImageView(image: image3)
        
        let iWidth3 = scrollView.frame.width
        let iHeight3 = scrollView.frame.width * 1.25
        let iX3 = scrollView.frame.minX
        let iY3 = imageView.frame.size.height + imageView2.frame.size.height
        imageView3.sizeToFit()
        imageView3.frame = CGRect(x: iX3, y: iY3, width: iWidth3, height : iHeight3)
        imageView3.contentMode = .scaleAspectFill
        scrollView.addSubview(imageView3)
        
        scrollView.contentSize = CGSize(width: swidth, height: iY3+iHeight3 + 20)
    }
              
    @objc func menuslide(_ sender: UIBarButtonItem!) {
        let scrsize:  CGRect = UIScreen.main.bounds
        let swidth = scrsize.width
        if !menuout {
            leading.constant = -240
            trailing.constant = swidth
            menuout = true
        }
        else if menuout {
            leading.constant = 0
            trailing.constant = swidth - 240
            menuout = false
        }
        UIView.animate(withDuration: 0.2, animations: {self.view.layoutIfNeeded()})
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
