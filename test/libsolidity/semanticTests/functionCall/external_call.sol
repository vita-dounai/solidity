pragma solidity >= 0.6.0;

contract C {
    function g(uint n) external pure returns (uint) {
        return n + 1;
    }

    function f(uint n) public view returns (uint) {
        return this.g(2 * n);
    }

    function d(uint n) external pure returns (uint[] memory) {
        uint[] memory data = new uint[](n);
        for (uint i = 0; i < data.length; ++i)
            data[i] = i;
        return data;
    }

    function dt(uint n) public view returns (uint) {
        uint[] memory data = this.d(n);
        uint sum = 0;
        for (uint i = 0; i < data.length; ++i)
            sum += data[i];
        return sum;
    }
}

// ====
// compileViaYul: also
// ----
// g(uint256): 4 -> 5
// f(uint256): 2 -> 5
// dt(uint256): 4 -> 6
