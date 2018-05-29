//
//  MainViewController.swift
//  MyEffect
//
//  Created by Patricia Freire Sestari on 22/05/18.
//  Copyright © 2018 MyEffect. All rights reserved.
//

import UIKit
import FontAwesome_swift
import MaterialComponents

class MainViewController: UIViewController, MDCTabBarDelegate {
    
    @IBOutlet weak var rightBarButton: UIBarButtonItem!
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    var tabsViewController: Array<UIViewController> = []
    var currentTab:Int = 0
    var contentView: UIView!
    var tabBar: MDCTabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabsViewController = [storyboard?.instantiateViewController(withIdentifier: "actionsViewController"),storyboard?.instantiateViewController(withIdentifier: "groupsViewController"),storyboard?.instantiateViewController(withIdentifier: "challengesViewController")] as! Array<UIViewController>
        
        //left image on Navigation
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        let image = UIImage(named: "action13.jpg")!
        
        UIGraphicsBeginImageContextWithOptions(button.frame.size, false, image.scale)
        let rect  = CGRect(x: 0, y: 0, width: button.frame.size.width, height: button.frame.size.height)
        UIBezierPath(roundedRect: rect, cornerRadius: rect.width/2).addClip()
        image.draw(in: rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
        let color = UIColor(patternImage: newImage!)
        button.backgroundColor = color
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.layer.borderColor = UIColor(displayP3Red: 0, green: 184.0/255, blue: 241.0/255, alpha: 1.0).cgColor
        button.layer.borderWidth = 3
        let barButton = UIBarButtonItem()
        barButton.customView = button
        self.navigationItem.leftBarButtonItem = barButton
        
        //Logo center
        let logoImage = #imageLiteral(resourceName: "MyEffectLogo")
        let logoImageView = UIImageView(image: logoImage)
        let navWidth = self.navigationController?.navigationBar.frame.size.width
        let navHeight = self.navigationController?.navigationBar.frame.size.height
        let navX = navWidth!/2 - image.size.width/2
        let navY = navHeight!/2 - image.size.height/2
        
        logoImageView.frame = CGRect(x: navX, y: navY, width: navWidth!, height: navHeight!)
        logoImageView.contentMode = .scaleAspectFit
        
        self.navigationItem.titleView = logoImageView
        
        //Right icon
        let attributes = [NSAttributedStringKey.font: UIFont.fontAwesome(ofSize: 25)]
        rightBarButton.setTitleTextAttributes(attributes, for: .normal)
        rightBarButton.setTitleTextAttributes(attributes, for: .selected)
        rightBarButton.setTitleTextAttributes(attributes, for: .highlighted)
        rightBarButton.title = String.fontAwesomeIcon(name: .bell)
        
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        addTabs()
        addContentView()
    }

    func addTabs(){
        let navHeight = self.navigationController?.navigationBar.frame.size.height
        
        tabBar = MDCTabBar(frame: CGRect(x: 0, y: navHeight!+20, width: view.bounds.width, height: view.bounds.height-navHeight!))
        tabBar.delegate = self
        tabBar.items = [
            UITabBarItem(title: "Actions", image: nil, tag: 0),
            UITabBarItem(title: "Groups", image: nil, tag: 1),
            UITabBarItem(title: "Challenges", image: nil, tag: 2)
        ]
        tabBar.itemAppearance = .titles
        tabBar.autoresizingMask = [.flexibleWidth]
        tabBar.alignment = MDCTabBarAlignment.center
        tabBar.displaysUppercaseTitles = false
        //tabBar.selectedItemTintColor = UIColor(displayP3Red: 0, green: 184.0/255, blue: 241.0/255, alpha: 1.0)
        tabBar.sizeToFit()
        view.addSubview(tabBar)
        
        tabBar.selectedItemTintColor = UIColor(displayP3Red: 0, green: 184.0/255, blue: 241.0/255, alpha: 1.0)
        tabBar.tintColor = UIColor(displayP3Red: 0, green: 184.0/255, blue: 241.0/255, alpha: 1.0)
        tabBar.unselectedItemTintColor = UIColor(displayP3Red: 3.0/255, green: 88.0/255, blue: 153.0/255, alpha: 1.0)
        //tabBar.addSubview(tabsViewController[2].view)
        //tabBar.addSubview(tabsViewController[1].view)
        //tabBar.addSubview(tabsViewController[0].view)
    }
    
    func addContentView(){
        let contY = tabBar.frame.origin.y + tabBar.frame.height + 10
        let contHeight = view.bounds.height-contY
        contentView = UIView(frame: CGRect(x: 0, y: contY, width: tabBar.frame.width, height: contHeight))
        contentView.addSubview(tabsViewController[2].view)
        contentView.addSubview(tabsViewController[1].view)
        contentView.addSubview(tabsViewController[0].view)
        view.addSubview(contentView)
    }
    
    func tabBar(_ tabBar: MDCTabBar, didSelect item: UITabBarItem) {
        if(currentTab != item.tag){
            contentView.bringSubview(toFront: tabsViewController[item.tag].view)
            currentTab = item.tag
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
