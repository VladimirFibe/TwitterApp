import UIKit

protocol HomeCellDelegate: AnyObject {
    func homeCellDidTapReply()
    func homeCellDidTapRetweet()
    func homeCellDidTapLike()
    func homeCellDidTapShare()
}

final class HomeCell: BaseTableViewCell {
    static let identifier = "HomeCell"
    weak var delegate: HomeCellDelegate?
    
    private let avatarImageView: UIImageView = {
        $0.backgroundColor = .systemRed
        $0.layer.cornerRadius = 25
        $0.layer.masksToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    private let displayNameLabel: UILabel = {
        $0.text = "Vladimir"
        $0.font = .systemFont(ofSize: 18, weight: .bold)
        $0.textColor = .label
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let usernameLabel: UILabel = {
        $0.text = "@macuser"
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .secondaryLabel
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let tweetLabel: UILabel = {
        $0.text = "UXR/UX: You can only bring one item to a remote island to assist your research of native use of tools and usability. What do you bring? #TellMeAboutYou"
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 16)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let replyButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(.reply, for: .normal)
        $0.tintColor = .systemGray2
        return $0
    }(UIButton(type: .system))
    
    
    private let retweetButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(.retweet, for: .normal)
        $0.tintColor = .systemGray2
        return $0
    }(UIButton(type: .system))
    
    private let likeButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(.react, for: .normal)
        $0.tintColor = .systemGray2
        return $0
    }(UIButton(type: .system))
    
    
    private let shareButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(.share, for: .normal)
        $0.tintColor = .systemGray2
        return $0
    }(UIButton(type: .system))
    
    private let stackView: UIStackView = {
        $0.distribution = .equalSpacing
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
}

extension HomeCell {
    @objc private func didTapReply() {
        delegate?.homeCellDidTapReply()
    }
    
    @objc private func didTapRetweet() {
        delegate?.homeCellDidTapRetweet()
    }
    
    @objc private func didTapLike() {
        delegate?.homeCellDidTapLike()
    }
    
    @objc private func didTapShare() {
        delegate?.homeCellDidTapShare()
    }
}

extension HomeCell {
    override func setupViews() {
        [avatarImageView, displayNameLabel, usernameLabel, tweetLabel, stackView].forEach { contentView.addSubview($0)}
        [replyButton, retweetButton, likeButton, shareButton].forEach { stackView.addArrangedSubview($0)}
        setupButtons()
    }
    
    private func setupButtons() {
        replyButton.addTarget(self, action: #selector(didTapReply), for: .primaryActionTriggered)
        retweetButton.addTarget(self, action: #selector(didTapRetweet), for: .primaryActionTriggered)
        likeButton.addTarget(self, action: #selector(didTapLike), for: .primaryActionTriggered)
        shareButton.addTarget(self, action: #selector(didTapShare), for: .primaryActionTriggered)
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            avatarImageView.widthAnchor.constraint(equalToConstant: 50),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            displayNameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
            usernameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
            
            displayNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            usernameLabel.leadingAnchor.constraint(equalTo: displayNameLabel.trailingAnchor, constant: 10),
            contentView.trailingAnchor.constraint(equalTo: usernameLabel.trailingAnchor, constant: 10),
            
            tweetLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 14),
            tweetLabel.leadingAnchor.constraint(equalTo: displayNameLabel.leadingAnchor),
            tweetLabel.trailingAnchor.constraint(equalTo: usernameLabel.trailingAnchor),
            
            stackView.topAnchor.constraint(equalTo: tweetLabel.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: tweetLabel.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: tweetLabel.trailingAnchor),
            
            contentView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 14)
        ])
    }
}
