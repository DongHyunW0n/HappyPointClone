//
//  ViewController.swift
//  HappyPointClone
//
//  Created by WonDongHyun on 1/9/24.
//

import UIKit
import SwiftUI


class MainViewController: UIViewController, UIScrollViewDelegate {

    private var imageNames: [String] = ["banner1", "banner2"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNaviItems()
        setScrollView()
        setContentView()
        setMainStackView()
        scrollView.delegate = self
    }

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .white
        scrollView.bounces = false
        return scrollView
    }()

    private let contentView: UIView = { //콘텐츠뷰
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    private let stackView: UIStackView = { //스택뷰
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let bannerCollectionView: UICollectionView = { //최상단 배너콜렉션뷰
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    let pointMissionStackView : UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 5
        
        return stackView
        
    }()
    
    
    let pointMissionlabel : UILabel = { //포인트 미션 글자 라벨
        
        let label = UILabel()
        label.text = "포인트 미션"
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    let missionCollectionView : UICollectionView = { //포인트 미션 배너 콜렉션뷰
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    private func setScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
    }

    private func setContentView() {
        
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }

    private func setMainStackView() {
        
        //뷰 기초설정
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(bannerCollectionView)
        stackView.addArrangedSubview(pointMissionlabel)
        stackView.addArrangedSubview(missionCollectionView)
        
        //메인배너(가장 큰 배너) 설정
        let MainBannerNibName = UINib(nibName: "BannerCollectionViewCell", bundle: nil)
        bannerCollectionView.register(MainBannerNibName, forCellWithReuseIdentifier: "MyCell")

        bannerCollectionView.dataSource = self
        bannerCollectionView.delegate = self
        
        //포인트 미션 배너 설정
        
        missionCollectionView.delegate = self
        missionCollectionView.dataSource = self
        missionCollectionView.backgroundColor = .white
        
        let nibname = UINib(nibName: "MissionCollectionViewCell", bundle: nil)
        missionCollectionView.register(nibname, forCellWithReuseIdentifier: "MissionCell")
        

        //오토레이아웃 설정
        
        NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
                stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant:  -0), // 수정된 부분
                
                bannerCollectionView.heightAnchor.constraint(equalToConstant: 350),
                missionCollectionView.heightAnchor.constraint(equalToConstant: 150 )

            ])
    }

 
    
    
    
    
    private func setNaviItems() {
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
        if collectionView == bannerCollectionView {
            print("콜렉션뷰 인식됨. ")
            return imageNames.count
        }
        if collectionView == missionCollectionView {
            print("콜렉션뷰 인식됨2")
            return imageNames.count
        }
        return 0


    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell { //어떤 셀?
        
        
        if collectionView == bannerCollectionView {
            guard let cell = bannerCollectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as? BannerCollectionViewCell
            else{
                return UICollectionViewCell()
            }
            cell.imageView.image = UIImage(named: "\(imageNames[indexPath.row])")
            
            
            return cell
            
        }
        if collectionView == missionCollectionView {
            

            guard let cell = missionCollectionView.dequeueReusableCell(withReuseIdentifier:  "MissionCell", for: indexPath) as? MissionCollectionViewCell
            else{
                return UICollectionViewCell()
            }
            
            cell.missionImage.image =  UIImage(named: "\(imageNames[indexPath.row])")
            
            return cell
        }
        return UICollectionViewCell()
        
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize { //아이템의 크기
        
        if collectionView == bannerCollectionView {
            return CGSize(width: stackView.frame.width , height: stackView.frame.width  )

        }
        else if collectionView == missionCollectionView {
            
            return CGSize(width: stackView.frame.width / 3, height: stackView.frame.width / 3)
            
        }
        return CGSize(width: 100, height: 100)
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
    
    

