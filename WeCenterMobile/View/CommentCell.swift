//
//  CommentCell.swift
//  WeCenterMobile
//
//  Created by Darren Liu on 15/2/3.
//  Copyright (c) 2015年 Beijing Information Science and Technology University. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {
    
    @IBOutlet weak var userAvatarView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userAvatarView.layer.masksToBounds = true
        userAvatarView.layer.cornerRadius = userAvatarView.bounds.width / 2
        selectedBackgroundView = UIView()
        selectedBackgroundView.backgroundColor = UIColor.msr_materialBrown700()
    }
    
    func update(#answerComment: AnswerComment) {
        let comment = answerComment
        msr_userInfo = comment
        userAvatarView.wc_updateWithUser(comment.user)
        userNameLabel.text = comment.user?.name
        bodyLabel.text = comment.body
        if comment.atUser?.name != nil {
            bodyLabel.text = "@" + comment.atUser!.name! + ": " + (bodyLabel.text ?? "")
        }
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    func update(#articleComment: ArticleComment) {
        let comment = articleComment
        msr_userInfo = comment
        userAvatarView.wc_updateWithUser(comment.user)
        userNameLabel.text = comment.user?.name
        bodyLabel.text = comment.body
        setNeedsLayout()
        layoutIfNeeded()
    }
    
}
