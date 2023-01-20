//
//  ViewController.swift
//  CameraFilter.RXSwift.StudyProject
//
//  Created by Вадим Гамзаев on 13.01.2023.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navC = segue.destination as? UINavigationController,
              let photosCVC = navC.viewControllers.first as? PhotosCollectionViewController
        else {
            fatalError("Segue destination is not found")
        }
        
        photosCVC.selectedPhoto.subscribe { [weak self] photo in
            self?.photoImageView.image = photo
        }.disposed(by: disposeBag)
    }
}

