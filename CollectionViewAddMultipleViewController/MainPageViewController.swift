//
//  ViewController.swift
//  CollectionViewAddMultipleViewController
//
//  Created by 丁偉哲 on 2017/3/9.
//  Copyright © 2017年 丁偉哲. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    fileprivate var storyboardNames = ["VC1","VC2","VC3","VC1","VC2","VC3","VC1","VC2","VC3","VC1","VC2","VC3","VC1","VC2","VC3","VC1","VC2","VC3","VC1","VC2","VC3","VC1","VC2","VC3","VC1","VC2","VC3","VC1","VC2","VC3","VC1","VC2","VC3","VC1","VC2","VC3","VC1","VC2","VC3","VC1","VC2","VC3","VC1","VC2","VC3"]//設定要加入的storyBoardName
    fileprivate var pageViews = [UIView]()//儲存實體化的vc的view進來
    let screenSize = UIScreen.main.bounds//取得螢幕尺寸
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal//設定滾動的方向，也可以在storyboard去改
        }
        initPageVCs()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /// 實體化vc，並將vc的View存入陣列中
    fileprivate func initPageVCs(){
        for (_, value) in storyboardNames.enumerated() {
            let storyboard = UIStoryboard(name: value, bundle: nil)
            let vc = storyboard.instantiateInitialViewController()!
            addChildViewController(vc)
            vc.didMove(toParentViewController: self)
            if let subView = vc.view{
                pageViews.append(subView)
            }
        }
        collectionView.reloadData()
    }

}
extension MainPageViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return  pageViews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PageCell", for: indexPath) as! MainPageCollectionViewCell
        
        let view = pageViews[indexPath.row]
        view.tag  = 100//給view tag,用它來移除舊的view，加入新的view
        if let oldView = cell.view4Page.viewWithTag(100){
            oldView.removeFromSuperview()
        }
        cell.view4Page.addSubview(view)
        return cell
        
    }
}

extension MainPageViewController : UICollectionViewDelegateFlowLayout {
    //設置集合視圖單元格大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: screenSize.width, height: screenSize.height)
    }
    
    // 設置cell和視圖邊的間距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    // 設置每一個cell最小 行 間距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // 設置每一個cell的 列 間距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return 0
    }
  
    
}

