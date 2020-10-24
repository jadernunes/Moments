//
//  RefreshControl.swift
//  moments
//
//  Created by Jader Borba Nunes on 24/10/20.
//

import UIKit

final class RefreshControl: UIRefreshControl {

    // MARK: - Attributes

    private weak var actionTarget: AnyObject?
    private var actionSelector: Selector?

    // MARK: - Life cycle

    override init() {
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    convenience init(actionTarget: AnyObject?, actionSelector: Selector) {
        self.init()

        self.actionTarget = actionTarget
        self.actionSelector = actionSelector
        addTarget()
    }

    // MARK: - Custom methods

    private func addTarget() {
        guard let actionTarget = actionTarget, let actionSelector = actionSelector else { return }
        addTarget(actionTarget, action: actionSelector, for: .valueChanged)
    }

    func endRefreshing(deadline: DispatchTime? = nil) {
        guard let deadline = deadline else {
            endRefreshing()
            return
        }

        DispatchQueue.global(qos: .default).asyncAfter(deadline: deadline) { [weak self] in
            DispatchQueue.main.async { self?.endRefreshing() }
        }
    }

    func refreshActivityIndicatorView() {
        guard let selector = actionSelector else { return }
        let _isRefreshing = isRefreshing
        removeTarget(actionTarget, action: selector, for: .valueChanged)
        endRefreshing()
        if _isRefreshing { beginRefreshing() }
        addTarget()
    }

    func generateRefreshEvent() {
        beginRefreshing()
        sendActions(for: .valueChanged)
    }
}

extension UIScrollView {

    // MARK: - Attributes

    private var _refreshControl: RefreshControl? {
        refreshControl as? RefreshControl
    }

    private var canStartRefreshing: Bool {
        refreshControl != nil && refreshControl?.isRefreshing == false
    }

    // MARK: - Custom methods

    func addRefreshControll(actionTarget: AnyObject?, action: Selector, replaceIfExist: Bool = false) {
        if !replaceIfExist && refreshControl != nil { return }
        refreshControl = RefreshControl(actionTarget: actionTarget, actionSelector: action)
    }

    func scrollToTopAndShowRunningRefreshControl(changeContentOffsetWithAnimation: Bool = false) {
        _refreshControl?.refreshActivityIndicatorView()
        guard
            let refreshControl = refreshControl,
            contentOffset.y != -refreshControl.frame.height
        else { return }
        setContentOffset(CGPoint(x: 0, y: -refreshControl.frame.height),
                         animated: changeContentOffsetWithAnimation)
    }

    func startRefreshing() {
        guard canStartRefreshing else { return }
        _refreshControl?.generateRefreshEvent()
    }

    func pullAndRefresh() {
        guard canStartRefreshing else { return }
        scrollToTopAndShowRunningRefreshControl(changeContentOffsetWithAnimation: true)
        _refreshControl?.generateRefreshEvent()
    }

    func endRefreshing(deadline: DispatchTime? = nil) {
        _refreshControl?.endRefreshing(deadline: deadline)
    }
}
