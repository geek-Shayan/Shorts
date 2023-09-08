//
//  ViewController.swift
//  Shorts
//
//  Created by SHAYANUL HAQ SADI on 7/9/23.
//

import UIKit

class ViewController: UIViewController {

    
//    static let identifier = "ViewController"
    
//    private var cellHorizontalScrolled: ((_: IndexPath) -> Void)? = nil
//    private var cellWillDisplay: ((_: IndexPath) -> Void)? = nil
//    private var cellDidEndDisplaying: ((_: IndexPath) -> Void)? = nil
    
    private var cellScrollingRight: Bool = true
    private var cellScrollingLeft: Bool = true
    
    var data: Shorts()


    private let collectionView: UICollectionView = {
        
        let layout = UICollectionViewCompositionalLayout { sectionNumber, env in
            AppLayouts.shared.createPlayerSection()
        }
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(UINib(nibName: PlayerCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PlayerCollectionViewCell.identifier)
                                                                                       
        return collection
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callShortsAPI()
        
        setupView()

        loadCollectionView()
        
        
    }

    
    
    override func viewDidLayoutSubviews() {
//        collectionView.frame = view.bounds
        
        let tabBarHeight = tabBarController?.tabBar.frame.size.height ?? 0
        
        collectionView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height - tabBarHeight)
    }
    
    
    private func setupView() {
        
    }
    
    private func callShortsAPI() {
        // Usage example
        fetchData { (apiResponse, error) in
            if let apiResponse = apiResponse {
                // Use the parsed data
                print("Success: \(apiResponse.success)")
                
//                let data = Shorts.init(success: apiResponse.success, shorts: apiResponse.shorts
                
                for short in apiResponse.shorts {
                    print("shorts: \(apiResponse.shorts)")
//                    print("Description: \(short.description)")
//                    print("Thumbnail URL: \(short.thumbnail)")
                    // Add more properties as needed
                    
                    
                }
            } else if let error = error {
                // Handle the error
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    
    private func loadCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = .systemTeal
        
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.isPagingEnabled = true
 
        view.addSubview(collectionView)
        
        collectionView.refreshControl = UIRefreshControl()
        collectionView.refreshControl?.addTarget(self, action: #selector(pullDownToRefresh), for: .valueChanged)
    }
    
    
    @objc private func pullDownToRefresh() {
        print("Refresh")
        
//        sectionData0 = []
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.collectionView.reloadData()
            self.collectionView.refreshControl?.endRefreshing()
        }
    }

}



extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        print("Cell indexPath row, section, item", indexPath.row, indexPath.section, indexPath.item)
                
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayerCollectionViewCell.identifier, for: indexPath) as! PlayerCollectionViewCell
        cell.playerView.backgroundColor = indexPath.item == 0 ? .yellow : indexPath.item == 1 ? .green : indexPath.item == 2 ? .yellow : indexPath.item == 3 ? .blue : .cyan
//        cell.playVideo()
        
        cell.m3u8Url =
        return cell

    }

    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleCells = self.collectionView.indexPathsForVisibleItems
            .sorted { top, bottom -> Bool in
                return top.section < bottom.section || top.row < bottom.row
            }.compactMap { indexPath -> UICollectionViewCell? in
                return self.collectionView.cellForItem(at: indexPath)
            }
        let indexPaths = self.collectionView.indexPathsForVisibleItems.sorted()
        let cellCount = visibleCells.count
        guard let firstCell = visibleCells.first as? PlayerCollectionViewCell, let firstIndex = indexPaths.first else {return}
        checkVisibilityOfCell(cell: firstCell, indexPath: firstIndex)
        if cellCount == 1 {return}
        guard let lastCell = visibleCells.last as? PlayerCollectionViewCell, let lastIndex = indexPaths.last else {return}
        checkVisibilityOfCell(cell: lastCell, indexPath: lastIndex)
    }
    
    func checkVisibilityOfCell(cell: PlayerCollectionViewCell, indexPath: IndexPath) {
        if let cellRect = (collectionView.layoutAttributesForItem(at: indexPath)?.frame) {
            let completelyVisible = collectionView.bounds.contains(cellRect)
            if completelyVisible {cell.playVideo()} else {cell.stopVideo()}
        }
    }
    
}


extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let vc = UIViewController()
//
//        vc.view.backgroundColor = indexPath.section == 0 ? .yellow : indexPath.section == 1 ? .blue : .orange
//
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        cellHorizontalScrolled?(indexPath)
////        cellWillDisplay?(indexPath)
//
//
////        collectionView.cellForItem(at: <#T##IndexPath#>)
////        let ite = collectionView.indexPathsForVisibleItems
////        print("indexPathsForVisibleItems  ", ite)
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
////        cellDidEndDisplaying?(indexPath)
//
//    }

}

