pragma solidity ^0.4.21;

import "ds-test/test.sol";

import "./DsRpow.sol";
import "./math.sol";

contract DsRpowTest is DSTest {
  DsRpow rpow;
  DSMath math;

  function setUp() public {
    rpow = new DsRpow();
    math = new DSMath();
  }

  function test_basic_sanity() public {
    // very test, much correctness
    uint base = 10**27;
    assertEq(rpow.rpow(0, 3, base), 0);
    assertEq(rpow.rpow(0, 0, base), base);
    assertEq(rpow.rpow(1, 10, base), 0);
    assertEq(rpow.rpow(1005 * 10**25, 3, base), 1015075125 * 10**21);
    assertEq(rpow.rpow(10 * base, 3, base), 1000 * base);
    assertEq(rpow.rpow(10 * base, 4, base), 10000 * base);
    assertEq(rpow.rpow(3 * base, 13, base), 1594323 * base);
  }

  function test_gas_opt() public {
    uint base = 10**27;
    for (uint i = 0; i<10; i++) {
      for (uint j = 0; j<10; j++) {
	assertEq(rpow.rpow(i * base, j, base), i **j * base);
      }
    }
  }
  function test_gas_opt_oldDsPow() public {
    uint base = 10**27;
    for (uint i = 0; i<10; i++) {
      for (uint j = 0; j<10; j++) {
	assertEq(math.rpow(i * base, j), i **j * base);
      }
    }
  }

}
