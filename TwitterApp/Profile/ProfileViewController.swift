import UIKit

final class ProfileViewController: BaseTableViewController {
}

extension ProfileViewController {
    override func setupViews() {
        super.setupViews()
        tableView.register(HomeCell.self, forCellReuseIdentifier: HomeCell.identifier)
        let header = ProfileHeaderView(frame: CGRect(x: 0, y: 0, width: 0, height: 390))
        tableView.tableHeaderView = header
        navigationItem.title = "Profile"
    }
}

extension ProfileViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.identifier, for: indexPath) as? HomeCell else { return UITableViewCell() }
        return cell
    }
}
