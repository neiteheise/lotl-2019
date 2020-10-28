//
//  AboutController.swift
//  LOTL_ed1
//
//  Created by Nathan Hellmuth on 5/30/19.
//  Copyright © 2019 Lighting of the Lawn. All rights reserved.
//

import UIKit

class AboutController: UIViewController {

    @IBOutlet weak var trailing: NSLayoutConstraint!
    @IBOutlet weak var leading: NSLayoutConstraint!
    
    @IBOutlet weak var menuview: UIView!
    
    
    var menuout = true;
    
    override func viewDidLoad() {
        let scrsize:  CGRect = UIScreen.main.bounds
        let swidth = scrsize.width
        super.viewDidLoad()
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
        //header
        let screensize: CGRect = UIScreen.main.bounds
        let swidth = screensize.width
        let sheight = screensize.height
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: navigationController!.navigationBar.frame.size.height, width: swidth, height: sheight))
        
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        
        view.addSubview(scrollView)
        
        
        //images
        let image = #imageLiteral(resourceName: "aboutfullfinal")
        let imageView = UIImageView(image: image)
        
        let iWidth = scrollView.frame.width + 12
        let iHeight = scrollView.frame.width * 1.926
        let iX = scrollView.frame.minX
        let iY = scrollView.frame.minY
        imageView.sizeToFit()
        imageView.frame = CGRect(x: iX - 7, y: iY, width: iWidth, height : iHeight)
        imageView.contentMode = .scaleAspectFill
        scrollView.addSubview(imageView)
        
        scrollView.contentSize = CGSize(width: swidth, height: iHeight + 130)
        
        //Links to website and instagram
        //facebook button
        let fb = UIImage(named: "fbicon")
        let fbbutton = UIButton()
        fbbutton.setImage(fb, for: .normal)
        fbbutton.addTarget(self, action: #selector(fblink), for: .touchUpInside)
        fbbutton.frame = CGRect(x: swidth / 3.4, y: iHeight, width: 50, height: 50)
        scrollView.addSubview(fbbutton)
        
        //website button
        let web = UIImage(named: "webicon1")
        let webbutton = UIButton()
        webbutton.setImage(web, for: .normal)
        webbutton.addTarget(self, action: #selector(weblink), for: .touchUpInside)
        webbutton.frame = CGRect(x: swidth / 7, y: iHeight, width: 50, height: 50)
        scrollView.addSubview(webbutton)
        
        //instagram button
        let inst = UIImage(named: "instaicon")
        let instbutton = UIButton()
        instbutton.setImage(inst, for: .normal)
        instbutton.addTarget(self, action: #selector(instalink), for: .touchUpInside)
        instbutton.frame = CGRect(x: swidth / 2.2, y: iHeight, width: 50, height: 50)
        scrollView.addSubview(instbutton)
        
        let livbutton = UIButton()
        livbutton.setTitle("LIVESTREAM", for: .normal)
        livbutton.setTitleColor(UIColor(red:0.00, green:0.00, blue:0.15, alpha:1.0), for: .normal)
        livbutton.sizeToFit()
        livbutton.addTarget(self, action: #selector(livelink), for: .touchUpInside)
        livbutton.frame = CGRect(x: swidth / 1.6, y: iHeight, width: 120, height: 50)
        livbutton.layer.cornerRadius = 15
        livbutton.layer.borderWidth = 5
        livbutton.layer.borderColor = UIColor(red:0.00, green:0.00, blue:0.15, alpha:1.0).cgColor
        scrollView.addSubview(livbutton)
        
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
    
    @objc func fblink(_ sender: UIButton!){
        if let url = URL(string: "https://www.facebook.com/events/428826381347249/") {
            UIApplication.shared.open(url)
        }
    }
    
    @objc func weblink(_ sender: UIButton!){
        if let url = URL(string: "http://www.lightingofthelawn.com/") {
            UIApplication.shared.open(url)
        }
    }
    
    @objc func instalink(_ sender: UIButton!){
        if let url = URL(string: "https://www.instagram.com/lotluva/") {
            UIApplication.shared.open(url)
        }
    }
    
    @objc func livelink(_ sender: UIButton!){
           if let url = URL(string: "http://www.lightingofthelawn.com/livestream") {
               UIApplication.shared.open(url)
           }
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
