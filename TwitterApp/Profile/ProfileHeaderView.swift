import UIKit

final class ProfileHeaderView: BaseView {
    private var selectedTab: Int = 0 {
        didSet {
            for (index, view) in sectionStackView.arrangedSubviews.enumerated() {
                UIView.animate(withDuration: 0.3) { [weak self] in
                    guard let self else { return }
                    view.tintColor = index == self.selectedTab ? .label : .secondaryLabel
                    leadingAnchors[index].isActive = self.selectedTab == index
                    trailingAnchors[index].isActive = self.selectedTab == index
                    self.layoutIfNeeded()
                }
            }
        }
    }
    
    private let headerImageView: UIImageView = {
        $0.image = .header
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    private let avatarImageView: UIImageView = {
        $0.backgroundColor = .systemRed
        $0.layer.cornerRadius = 40
        $0.layer.masksToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    private let displayNameLabel: UILabel = {
        $0.text = "Vladimir"
        $0.font = .systemFont(ofSize: 22, weight: .bold)
        $0.textColor = .label
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let usernameLabel: UILabel = {
        $0.text = "@macuser"
        $0.font = .systemFont(ofSize: 18)
        $0.textColor = .secondaryLabel
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let bioLabel: UILabel = {
        $0.text = "Urgent help for iPhone, iPad, MacBook, iMac, Mac Pro, Mac mini."
        $0.font = .systemFont(ofSize: 18)
        $0.numberOfLines = 3
        $0.textColor = .label
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let linkImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.tintColor = .secondaryLabel
        $0.image = UIImage(systemName: "link", withConfiguration: UIImage.SymbolConfiguration(pointSize: 14))
        return $0
    }(UIImageView())
    
    private let linkLabel: UILabel = {
        $0.text = "macservice.kz"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .label
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let joinImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.tintColor = .secondaryLabel
        $0.image = UIImage(systemName: "calendar", withConfiguration: UIImage.SymbolConfiguration(pointSize: 14))
        return $0
    }(UIImageView())
    
    private let joinLabel: UILabel = {
        $0.text = "2010"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .label
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let followingTextLabel: UILabel = {
        $0.text = "Following"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .secondaryLabel
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let followingCountLabel: UILabel = {
        $0.text = "314"
        $0.font = .systemFont(ofSize: 14, weight: .bold)
        $0.textColor = .label
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let followersTextLabel: UILabel = {
        $0.text = "Followers"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .secondaryLabel
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let followersCountLabel: UILabel = {
        $0.text = "314"
        $0.font = .systemFont(ofSize: 14, weight: .bold)
        $0.textColor = .label
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private lazy var sectionStackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.distribution = .equalSpacing
        return $0
    }(UIStackView())
    
    private let indicatorView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .label
        return $0
    }(UIView())
    
    private var leadingAnchors: [NSLayoutConstraint] = []
    private var trailingAnchors: [NSLayoutConstraint] = []
}

extension ProfileHeaderView {
    @objc private func buttonTapped(_ sender: UIButton) {
        selectedTab = sender.tag
    }
}

extension ProfileHeaderView {
    override func setupViews() {
        [headerImageView, 
         avatarImageView,
         displayNameLabel,
         usernameLabel,
         bioLabel,
         linkImageView,
         linkLabel,
         joinImageView,
         joinLabel,
         followingTextLabel,
         followingCountLabel,
         followersTextLabel,
         followersCountLabel,
         sectionStackView,
         indicatorView].forEach { addSubview($0)}
        
        for (index, title) in ["Tweets", "Tweets & Replies", "Media", "Likes"].enumerated() {
            let button = UIButton(type: .system)
            button.setTitle(title, for: [])
            button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
            button.tintColor = index == 0 ? .label : .secondaryLabel
            button.tag = index
            button.addTarget(self, action: #selector(buttonTapped), for: .primaryActionTriggered)
            button.translatesAutoresizingMaskIntoConstraints = false
            leadingAnchors.append(indicatorView.leadingAnchor.constraint(equalTo: button.leadingAnchor))
            trailingAnchors.append(indicatorView.trailingAnchor.constraint(equalTo: button.trailingAnchor))
            sectionStackView.addArrangedSubview(button)
        }
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            headerImageView.topAnchor.constraint(equalTo: topAnchor),
            headerImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerImageView.heightAnchor.constraint(equalToConstant: 150),
            
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            avatarImageView.centerYAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: 10),
            avatarImageView.widthAnchor.constraint(equalToConstant: 80),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            displayNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            trailingAnchor.constraint(equalTo: displayNameLabel.trailingAnchor, constant: 10),
            displayNameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 20),
            
            usernameLabel.leadingAnchor.constraint(equalTo: displayNameLabel.leadingAnchor),
            usernameLabel.topAnchor.constraint(equalTo: displayNameLabel.bottomAnchor, constant: 5),
            
            bioLabel.leadingAnchor.constraint(equalTo: displayNameLabel.leadingAnchor),
            bioLabel.trailingAnchor.constraint(equalTo: displayNameLabel.trailingAnchor),
            bioLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 5),
            
            linkImageView.topAnchor.constraint(equalTo: bioLabel.bottomAnchor, constant: 5),
            linkImageView.leadingAnchor.constraint(equalTo: bioLabel.leadingAnchor),
            
            linkLabel.centerYAnchor.constraint(equalTo: linkImageView.centerYAnchor),
            linkLabel.leadingAnchor.constraint(equalTo: linkImageView.trailingAnchor, constant: 10),
            
            joinImageView.centerYAnchor.constraint(equalTo: linkImageView.centerYAnchor),
            joinImageView.leadingAnchor.constraint(equalTo: linkLabel.trailingAnchor, constant: 20),
            
            joinLabel.centerYAnchor.constraint(equalTo: linkImageView.centerYAnchor),
            joinLabel.leadingAnchor.constraint(equalTo: joinImageView.trailingAnchor, constant: 10),
            
            followingCountLabel.leadingAnchor.constraint(equalTo: displayNameLabel.leadingAnchor),
            followingCountLabel.topAnchor.constraint(equalTo: linkImageView.bottomAnchor, constant: 10),
            
            followingTextLabel.leadingAnchor.constraint(equalTo: followingCountLabel.trailingAnchor, constant: 4),
            followingTextLabel.centerYAnchor.constraint(equalTo: followingCountLabel.centerYAnchor),
            
            followersCountLabel.leadingAnchor.constraint(equalTo: followingTextLabel.trailingAnchor, constant: 8),
            followersCountLabel.centerYAnchor.constraint(equalTo: followingCountLabel.centerYAnchor),
            
            followersTextLabel.leadingAnchor.constraint(equalTo: followersCountLabel.trailingAnchor, constant: 4),
            followersTextLabel.centerYAnchor.constraint(equalTo: followingCountLabel.centerYAnchor),
            
            sectionStackView.leadingAnchor.constraint(equalTo: displayNameLabel.leadingAnchor),
            sectionStackView.trailingAnchor.constraint(equalTo: displayNameLabel.trailingAnchor),
            sectionStackView.topAnchor.constraint(equalTo: followersTextLabel.bottomAnchor, constant: 10),
            
            indicatorView.topAnchor.constraint(equalTo: sectionStackView.bottomAnchor),
            indicatorView.heightAnchor.constraint(equalToConstant: 4),
            leadingAnchors[0],
            trailingAnchors[0]
        ])
    }
}
