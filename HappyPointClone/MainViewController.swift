//
//  ViewController.swift
//  HappyPointClone
//
//  Created by WonDongHyun on 1/9/24.
//

import UIKit
import SwiftUI

import UIKit

class MainViewController: UIViewController, UIScrollViewDelegate {

    var imageNames: [String] = ["banner1", "banner2"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNaviItems()
        setScrollView()
        setContentView()
        setStackView()
        setBannerCollectionView()
        setTestView()
        scrollView.delegate = self
    }

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .white
        scrollView.bounces = false
        return scrollView
    }()

    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let bannerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    let testView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .brown
        return view
    }()

    func setScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20),
        ])
    }

    func setContentView() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -0),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }

    func setStackView() {
        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

    func setBannerCollectionView() {
        stackView.addArrangedSubview(bannerCollectionView)
        let nibName = UINib(nibName: "BannerCollectionViewCell", bundle: nil)
        bannerCollectionView.register(nibName, forCellWithReuseIdentifier: "MyCell")

        bannerCollectionView.dataSource = self
        bannerCollectionView.delegate = self

        NSLayoutConstraint.activate([
            bannerCollectionView.heightAnchor.constraint(equalToConstant: 300),
        ])
    }

    func setTestView() {
        stackView.addArrangedSubview(testView)

        NSLayoutConstraint.activate([
            testView.heightAnchor.constraint(equalToConstant: 1500),
        ])
    }
    
    
    
    func setNaviItems() {
        let leftBarButton = UIButton(type: .custom)
        leftBarButton.setImage(UIImage(named: "happypointlogo"), for: .normal)
        leftBarButton.setImage(UIImage(named: "happypointlogoup"), for: .highlighted)
        leftBarButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30) //
        let leftBarButtonItem = UIBarButtonItem(customView: leftBarButton)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        leftBarButton.addTarget(self, action: #selector(leftBarButtonTapped), for: .touchUpInside)
        
        
        let rightBatButton = UIButton(type: .custom)
        rightBatButton.setImage(UIImage(named: "rightbarbuttonlogo"), for: .normal)
        rightBatButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        let rightBarButtonItem = UIBarButtonItem(customView: rightBatButton)
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        
    }
    

    
    
    
    
    
    @objc func leftBarButtonTapped() {
        print("Left bar button tapped")
        
    }
    
    
    

    
    
    
    
}

extension MainViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { //아이템 몇개?
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell { //어떤 셀?
        
        guard let cell = bannerCollectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as? BannerCollectionViewCell
        else{
            return UICollectionViewCell()
        }
        cell.imageView.image = UIImage(named: "\(imageNames[indexPath.row])")
        

        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize { //아이템의 크기
        return CGSize(width: view.frame.width, height: 200)
    }
    
    
}


    
    
    
    
    
    
    
    
    
    // 프리뷰 보려고 스유로 래핑함.
    
    struct CalendarViewControllerWrapper: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> MainViewController {
            return MainViewController()
        }
        
        func updateUIViewController(_ uiViewController: MainViewController, context: Context) {
            // 뷰 컨트롤러를 업데이트해야 하는 경우 업데이트합니다.
        }
    }
    
    struct CalendarViewController_Preview: PreviewProvider {
        static var previews: some View {
            CalendarViewControllerWrapper()
            
        }
    }
    
    

