//
//  PullToRefreshAnimator.swift
//  Joon
//
//  Created by MaziarSaadatfar on 10/26/21.
//

import Foundation
import UIKit
import CRRefresh

open class PullToRefreshAnimator: UIView, CRRefreshProtocol {
    open var pullToRefreshDescription = Label.pullDownToRefresh.rawValue {
        didSet {
            if pullToRefreshDescription != oldValue {
                titleLabel.text = pullToRefreshDescription
            }
        }
    }
    open var releaseToRefreshDescription = Label.releaseToRefresh.rawValue
    open var loadingDescription = "\(Label.loading.rawValue)..."

    open var view: UIView { return self }
    open var insets: UIEdgeInsets = .zero
    open var trigger: CGFloat  = 60.0
    open var execute: CGFloat  = 60.0
    open var endDelay: CGFloat = 0
    public var hold: CGFloat   = 60

    fileprivate let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Image.refreshArrow.rawValue)
        return imageView
    }()
    
    fileprivate let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor(white: 0.625, alpha: 1.0)
        label.textAlignment = .left
        return label
    }()
    
    fileprivate let indicatorView: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView(style: .medium)
        indicatorView.isHidden = true
        return indicatorView
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel.text = pullToRefreshDescription
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        self.addSubview(indicatorView)
    }
    
    public required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func refreshBegin(view: CRRefreshComponent) {
        indicatorView.startAnimating()
        indicatorView.isHidden = false
        imageView.isHidden     = true
        titleLabel.text        = loadingDescription
        imageView.transform    = CGAffineTransform(rotationAngle: 0.000001 - CGFloat(Double.pi))
    }
  
    open func refreshEnd(view: CRRefreshComponent, finish: Bool) {
        if finish {
            indicatorView.stopAnimating()
            indicatorView.isHidden = true
            imageView.isHidden = false
            imageView.transform = CGAffineTransform.identity
        } else {
            titleLabel.text = pullToRefreshDescription
            setNeedsLayout()
        }
    }
    
    public func refreshWillEnd(view: CRRefreshComponent) {
    }
    
    open func refresh(view: CRRefreshComponent, progressDidChange progress: CGFloat) {
    }
    
    open func refresh(view: CRRefreshComponent, stateDidChange state: CRRefreshState) {
        switch state {
        case .refreshing:
            titleLabel.text = loadingDescription
            setNeedsLayout()
        case .pulling:
            titleLabel.text = releaseToRefreshDescription
            self.setNeedsLayout()
            UIView.animate(withDuration: 0.2,
                           delay: 0.0,
                           options: UIView.AnimationOptions(),
                           animations: { [weak self] in
                self?.imageView.transform = CGAffineTransform(rotationAngle: 0.000001 - CGFloat(Double.pi))
            })
        case .idle:
            titleLabel.text = pullToRefreshDescription
            self.setNeedsLayout()
            UIView.animate(withDuration: 0.2,
                           delay: 0.0,
                           options: UIView.AnimationOptions(),
                           animations: { [weak self] in
                self?.imageView.transform = CGAffineTransform.identity
            })
        default:
            break
        }
    }

    open override func layoutSubviews() {
        super.layoutSubviews()
        let size = bounds.size
        let width = size.width
        let height = size.height
        
        UIView.performWithoutAnimation {
            titleLabel.sizeToFit()
            titleLabel.center = .init(x: width / 2.0, y: height / 2.0)
            indicatorView.center = .init(x: titleLabel.frame.origin.x - 16.0, y: height / 2.0)
            imageView.frame = CGRect(x: titleLabel.frame.origin.x - 28.0,
                                     y: (height - 18.0) / 2.0, width: 18.0, height: 18.0)
        }
    }
}
