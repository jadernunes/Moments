//
//  GalleriesTests.swift
//  moments
//
//  Created by Jader Borba Nunes on 24/10/20.
//

import XCTest

final class GalleriesTests: XCTestCase {
    
    // MARK: - Services
    
    func testRequestGalleriesSucess() {
        let expect = expectation(description: #function)
        
        let service = GalleriesStubSuccess()
        let viewModel = GalleriesViewModel(service: service)
        viewModel.getData {
            expect.fulfill()
            XCTAssertGreaterThan(viewModel.countGalleries(), 0)
        }
        
        waitForExpectations(timeout: 60)
    }
    
    func testRequestGalleriesFail() {
        let expect = expectation(description: #function)
        
        let service = GalleriesStubFail()
        let viewModel = GalleriesViewModel(service: service)
        viewModel.getData {
            expect.fulfill()
            XCTAssertTrue(viewModel.hasError.value)
        }
        
        waitForExpectations(timeout: 60)
    }
}
