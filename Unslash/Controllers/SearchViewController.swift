//
//  SearchViewController.swift
//  Unslash
//
//  Created by Zahar on 05/06/2019.
//

import UIKit
import SnapKit


class SearchViewController: UIViewController {
    
    //MARK: Properties
    let httpClient: APIHTTPClient = APIHTTPClientImpl(baseUrl: Config.shared.apiUrl) //генерируем клиента для дальнейших с ним действий
    
    var searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.returnKeyType = .search
        sb.placeholder = "Введите запрос..."
        return sb
    }()
    
    var welcomeTitle: UILabel = {
        let label = UILabel()
        label.text = "Добро пожаловать в тестовое задание!\nВведи свой запрос выше and see the magic\n✨✨✨"
        label.textAlignment = .center
        label.font = UIFont.regularFont(ofSize: 32)
        label.textColor = UIColor.appCharcoalGrey
        
        label.numberOfLines = 0
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Поиск"
        searchBar.delegate = self

        hideKeyboard()
        
        view.addSubview(searchBar)
        view.addSubview(welcomeTitle)
        makeConstraints()
    }
    
    //MARK: Constraints
    private func makeConstraints() {
        searchBar.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(40.0)
            make.top.equalToSuperview().offset(64.0)
        }
        welcomeTitle.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16.0)
            make.top.equalTo(searchBar.snp.bottom).offset(55.0)
            make.right.equalToSuperview().offset(-16.0)
        }
        
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        httpClient.request(API.Photos.getPhotosWith(query: text)) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .failure(let fail):
                print(fail)
            case .success(let value):
                let photos = value.results
                print(photos)
                let vc = ViewControllers.resultViewController.instance(fromStoryboard: Storyboard.main.instance) as! ResultViewController
                vc.photos = photos
                vc.title = text
                strongSelf.show(vc, sender: nil)
            }
        }
    }
}
