pragma solidity ^0.4.21;

import "ds-test/test.sol";

import "./DsRpow.sol";

contract DsRpowTest is DSTest {
    DsRpow rpow;

    function setUp() public {
        rpow = new DsRpow();
    }

    function test_basic_sanity() public {
        // very test, much correctness
        assertEq(rpow.rpow(10 * (10**27), 3), 1000 * (10**27));
    }
}
