//
//  PageViewController.swift
//  TestPageViewController
//
//  Created by Paul Aguilar on 1/26/18.
//  Copyright © 2018 aguilarpgc. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    
    lazy var controllers: [UIViewController] = {
        
        return [self.createViewControler(identifier: "controller1"),
                self.createViewControler(identifier: "controller2")]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        
        self.setViewControllers([controllers[0]], direction: .forward, animated: true, completion: nil)
    }
}

extension PageViewController {
    
    func createViewControler(identifier: String) -> UIViewController {
        
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let current = controllers.index(of: viewController) else { return nil }
        guard let before = controllers.index(current, offsetBy: -1, limitedBy: 0) else { return nil }
        
        return controllers[before]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let current = controllers.index(of: viewController) else { return nil }
        guard let after = controllers.index(current, offsetBy: +1, limitedBy: self.controllers.count - 1) else { return nil }
        
        return controllers[after]
    }
}

extension PageViewController: UIPageViewControllerDelegate {
    
}
