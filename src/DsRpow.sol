pragma solidity ^0.4.21;

contract DsRpow {
  function rpow(int x, uint n) public pure returns (int z) {
    assembly {
      function fail() { revert(0, 0) }

      let min  := exp(2, 255)
      let one  := exp(10, 27)
      let half := div(one, 2)

      for { z := exp(10, 27) }
          iszero(iszero(n))
          { }
        {
          if mod(n, 2)
            {
              // [[ z := rmul(z, x) ]]
              let tmp1 := mul(z, x)
              if iszero(and(or(iszero(slt(x, 0)), sgt(min, z)),
                            or(iszero(x), eq(sdiv(tmp1, x), z))))
                { fail() }
              let tmp2 := add(tmp1, half)
              if sgt(0, and(xor(tmp2, tmp1), xor(tmp2, half)))
                { fail() }
              z := sdiv(tmp2, one)
            }
          n := div(n, 2)
          if gt(n, 0)
            {
              // [[ x := rmul(x, x) ]]
              let tmp1 := mul(x, x)
              if iszero(and(or(iszero(slt(x, 0)), sgt(min, x)),
                            or(iszero(x), eq(sdiv(tmp1, x), x))))
                { fail() }
              let tmp2 := add(tmp1, half)
              if sgt(0, and(xor(tmp2, tmp1), xor(tmp2, half)))
                { fail() }
              x := sdiv(tmp2, one)
            }
        }
    }
  }
}
