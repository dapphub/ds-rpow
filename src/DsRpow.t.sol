pragma solidity ^0.4.21;

import "ds-test/test.sol";

import "./DsRpow.sol";

contract DsRpowTest is DSTest {
    DsRpow rpow;

    function setUp() public {
        rpow = new DsRpow();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
