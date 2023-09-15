

import XCTest
@testable import Interview

final class ListContactsViewControllerTests: XCTestCase {
    let sut = ListContactsViewController()
    
    func testTitleInitialIsCorrect() {
        sut.viewDidLoad()
        let title = sut.tabBarItem.title
        XCTAssertEqual(title, "Lista de contatos")
    }
}
