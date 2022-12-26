//
//  PullUpAddAnimator.swift
//  Joon
//
//  Created by MaziarSaadatfar on 10/26/21.
//

import Foundation
import UIKit
import CRRefresh

open class PullUpAddAnimator: UIView, CRRefreshProtocol {
    open var loadingMoreDescription = Label.more.rawValue
    open var noMoreDataDescription  = Label.noMore.rawValue
    open var releaseToRefreshDescription = Label.releaseToRefresh.rawValue
    open var loadingDescription = Label.loading.rawValue

    open var view: UIView { return self }
    open var duration: TimeInterval = 0.3
    open var insets: UIEdgeInsets   = .zero
    open var trigger: CGFloat       = 50.0
    open var execute: CGFloat       = 50.0
    open var endDelay: CGFloat      = 0
    open var hold: CGFloat          = 50
    
    fileprivate lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor(white: 160.0 / 255.0, alpha: 1.0)
        label.textAlignment = .center
        return label
    }()
    
    fileprivate lazy var indicatorView: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        indicatorView.isHidden = true
        return indicatorView
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel.text = loadingMoreDescription
        addSubview(titleLabel)
        addSubview(indicatorView)
    }
    
    public required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func refreshBegin(view: CRRefreshComponent) {
        indicatorView.startAnimating()
        titleLabel.text = loadingDescription
        indicatorView.isHidden = false
    }
    
    public func refreshWillEnd(view: CRRefreshComponent) {}
    
    open func refreshEnd(view: CRRefreshComponent, finish: Bool) {
        indicatorView.stopAnimating()
        titleLabel.text = loadingMoreDescription
        indicatorView.isHidden = true
    }
    
    open func refresh(view: CRRefreshComponent, progressDidChange progress: CGFloat) {}
    
    open func refresh(view: CRRefreshComponent, stateDidChange state: CRRefreshState) {
        switch state {
        case .refreshing:
            titleLabel.text = loadingDescription
        case .noMoreData:
            titleLabel.text = noMoreDataDescription
        case .pulling:
            titleLabel.text = loadingMoreDescription
        default:
            break
        }
        setNeedsLayout()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        let sValue = self.bounds.size
        let wValue = sValue.width
        let hValue = sValue.height
        titleLabel.sizeToFit()
        titleLabel.center = CGPoint(x: wValue / 2.0, y: hValue / 2.0 - 5.0 + insets.top)
        indicatorView.center = CGPoint(x: titleLabel.frame.origin.x - 18.0, y: titleLabel.center.y)
    }
}
