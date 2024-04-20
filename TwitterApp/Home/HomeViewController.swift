import UIKit

final class HomeViewController: BaseTableViewController {
}

extension HomeViewController {
    override func setupViews() {
        super.setupViews()
        setupNavigationBar()
        tableView.register(HomeCell.self, forCellReuseIdentifier: HomeCell.identifier)
    }
    
    private func setupNavigationBar() {
        let logoImageView = UIImageView(image: .twitter)
        logoImageView.contentMode = .scaleAspectFill
        
        navigationItem.titleView = logoImageView
        
        let profileImage = UIImage(systemName: "person")
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: profileImage,
            style: .plain,
            target: self,
            action: #selector(didTapProfile)
        )
    }
}

extension HomeViewController {
    @objc private func didTapProfile() {
        let controller = ProfileViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension HomeViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.identifier, for: indexPath) as? HomeCell else { return UITableViewCell() }
        cell.delegate = self
        return cell
    }
}

extension HomeViewController: HomeCellDelegate {
    func homeCellDidTapReply() {
        print(#function)
    }
    
    func homeCellDidTapRetweet() {
        print(#function)
    }
    
    func homeCellDidTapLike() {
        print(#function)
    }
    
    func homeCellDidTapShare() {
        print(#function)
    }
}
