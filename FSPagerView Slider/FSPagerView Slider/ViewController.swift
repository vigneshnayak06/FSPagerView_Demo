//
//  ViewController.swift
//  FSPagerView Slider

//

import UIKit
import FSPagerView

class ViewController: UIViewController, FSPagerViewDelegate, FSPagerViewDataSource {

    var numberOfItems = 7
    var imageNames=["dog","dog","dog","dog","dog","dog","dog"]
    
    @IBOutlet weak var pagerView: FSPagerView!
    
    
    override func viewDidLoad() {
        pagerView.dataSource = self
        pagerView.delegate = self
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "FSPagerViewCell")
        self.pagerView.itemSize = FSPagerView.automaticSize
        
        
        self.pagerView.transformer = FSPagerViewTransformer(type:.linear)
        let transform = CGAffineTransform(scaleX: 0.6, y: 0.75)
        self.pagerView.itemSize = self.pagerView.frame.size.applying(transform)
        self.pagerView.decelerationDistance = FSPagerView.automaticDistance
        
    }

    
   // MARK:- FSPagerView DataSource
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return self.numberOfItems
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "FSPagerViewCell", at: index)
        cell.
        cell.imageView?.image = UIImage(named: "dog")
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.clipsToBounds = true
//        cell.textLabel?.text = index.description+index.description
        return cell
    }
    
    // MARK:- FSPagerView Delegate
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }
    
//    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
//        self.pageControl.currentPage = targetIndex
//    }
//
//    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
//        self.pageControl.currentPage = pagerView.currentIndex
//    }

}

