import UIKit

final class ProfileHeaderView: BaseView {
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
        $0.text = "Urgent help for iPhone, iPad, MacBook, iMac, Mac Pro, Mac mini. Urgent help for iPhone, iPad, MacBook, iMac, Mac Pro, Mac mini."
        $0.font = .systemFont(ofSize: 18)
        $0.numberOfLines = 0
        $0.textColor = .label
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
}

extension ProfileHeaderView {
    override func setupViews() {
        [headerImageView, avatarImageView, displayNameLabel, usernameLabel, bioLabel].forEach { addSubview($0)}
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
            bioLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 5)
        ])
    }
}
