//
//  TutorialViewController.swift
//  pets-social-app
//
//  Created by angelito on 4/11/15.
//  Copyright (c) 2015 Angelito. All rights reserved.
//

import UIKit

class TutorialViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    var pageHeadings = ["Personalize", "Locate", "Discover"]
    var pageImages = ["bg_1", "bg_2", "bg_3"]
    var pageSubHeadings = ["Pin your favourite restaurants and create your own food guide", "Search and locate your favourit restaurant on Maps", "Find restaurants pinned by your friends and other foodies around the world"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Set the data source to itself
        dataSource = self
        // Create the first walkthrough screen
        if let startingViewController = self.viewControllerAtIndex(0) {
                setViewControllers([startingViewController], direction: .Forward, animated: true,
                completion: nil)
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as TutorialStepViewController).index
        index++
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as TutorialStepViewController).index
        index--
        return self.viewControllerAtIndex(index)
    }

    func viewControllerAtIndex(index: Int) -> TutorialStepViewController? {
            if index == NSNotFound || index < 0 || index >= self.pageHeadings.count {
            return nil
            }
            // Create a new view controller and pass suitable data.
            if let tutorialStepViewController =
            storyboard?.instantiateViewControllerWithIdentifier("TutorialStepViewController") as?
            TutorialStepViewController {
                tutorialStepViewController.imageFile = pageImages[index]
                tutorialStepViewController.heading = pageHeadings[index]
                tutorialStepViewController.subHeading = pageSubHeadings[index]
                tutorialStepViewController.index = index
                return tutorialStepViewController
            }
            return nil
    }
    
    func forward(index: Int) {
        if let nextViewController = self.viewControllerAtIndex(index + 1) {
        setViewControllers([nextViewController], direction: .Forward, animated: true,
        completion: nil)
        }
    }

    
//    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
//        return pageHeadings.count
//    }
//    
//    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
//        if let tutorialStepViewController = storyboard?.instantiateViewControllerWithIdentifier("TutorialStepViewController") as? TutorialStepViewController {
//            return tutorialStepViewController.index
//        }
//        return 0
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
