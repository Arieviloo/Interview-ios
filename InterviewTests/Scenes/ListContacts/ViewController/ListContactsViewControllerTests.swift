

import XCTest
@testable import Interview

final class ListContactsViewControllerTests: XCTestCase {
    let sut = ListContactsViewController()
    let mock = [
        Contact(id: 1, name: "Shakira", photoURL: "https://picsum.photos/id/237/200/200"),
        Contact(id: 2, name: "Beyonce", photoURL: "https://picsum.photos/id/236/200/200"),
        Contact(id: 3, name: "Tom Cruise", photoURL: "https://picsum.photos/id/235/200/200"),
    ]
    
    func testTitleInitialIsCorrect() {
        sut.viewDidLoad()
        let title = sut.tabBarItem.title
        XCTAssertEqual(title, "Lista de contatos")
    }
    
    func testDataIsPresentCorrect() {
        sut.contacts = mock
        sut.tableView.reloadData()
        let primaryCell = sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! ContactCell
        XCTAssertEqual(primaryCell.fullnameLabel.text, "Shakira")
    }
    
    func testSelectCellIsCorrect() {
        sut.contacts = mock
        sut.tableView.reloadData()
        sut.tableView.delegate?.tableView?(sut.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0)))
    }
}
