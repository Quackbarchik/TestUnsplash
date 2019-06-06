//
//  ResultViewController.swift
//  Unslash
//
//  Created by Zahar on 06/06/2019.
//

import UIKit
import SVProgressHUD

class ResultViewController: UIViewController {

    //MARK: Properties
    enum ViewMode {
        case normal
        case notData
    }
    
    var currentViewMode = ViewMode.normal {
        didSet {
            collectionView.isHidden = currentViewMode == .normal
            notHaveDataTitle.isHidden = currentViewMode == .normal
        }
    }

    var photos: [API.Photos.Photo] = []

    let collectionView = SearchPhotosCollectionView()
    private let collectionDataManager = PhotosCollectionManager()
    
    var notHaveDataTitle: UILabel = {
        let label = UILabel()
        label.text = "То что ты хотел - мы не нашли🌝"
        label.textAlignment = .center
        label.font = UIFont.regularFont(ofSize: 32)
        label.textColor = UIColor.appCharcoalGrey
        label.numberOfLines = 0
        label.isHidden = true
        
        return label
    }()
    
    //MARK: lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = collectionDataManager
        collectionView.dataSource = collectionDataManager
        
        view.addSubview(collectionView)
        view.addSubview(notHaveDataTitle)
        
        makeConstraints()
        
        if photos.isEmpty {
            currentViewMode = .notData
        } else {
            collectionDataManager.images = photos
            collectionDataManager.imageTap = { [weak self] image in
                
                let vc = ViewControllers.detailViewController.instance(fromStoryboard: Storyboard.main.instance) as! DetailViewController
                SVProgressHUD.show()
                vc.imageView.kf.setImage(with: URL(string: image.urls.full)!)
                SVProgressHUD.dismiss()
                self?.show(vc, sender: nil)
                
            }
        }
        
    }
    
    //MARK: Constraints
    private func makeConstraints() {
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        notHaveDataTitle.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16.0)
            make.top.equalToSuperview().offset(104.0)
            make.right.equalToSuperview().offset(-16.0)
        }
    }
    
}
