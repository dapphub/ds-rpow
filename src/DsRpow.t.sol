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
        uint base = 10**27;
        assertEq(rpow.rpow(10 * base, 3, base), 1000 * base);
        assertEq(rpow.rpow(10 * base, 4, base), 10000 * base);
        assertEq(rpow.rpow(3 * base, 13, base), 1594323 * base);
    }
}
