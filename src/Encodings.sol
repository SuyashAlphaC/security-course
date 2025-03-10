//SPDX-License-Identifier:MIT

pragma solidity ^0.8.19;

contract Encodings {
    function encodeString() public pure returns(bytes memory) {
        string memory str = "Hello, World!";
        bytes memory strBytes = abi.encode(str);
        return strBytes;
    }

    function encodePackedString() public pure returns(bytes32) {
        string memory str = "Hello, World!";
        bytes32 strBytesPacked = keccak256(abi.encodePacked(str));
        return strBytesPacked;
    }

    function encodeThroughbytes() public pure returns(bytes memory) {
        string memory str = "Hello, World!";
        bytes memory strBytes = bytes(str);
        return strBytes;
    }

    function decodeString() public pure returns (string memory) {
        string memory someString = abi.decode(encodeString(), (string));
        return someString;
    }

    function multiEncode() public pure returns (bytes memory) {
        bytes memory someString = abi.encode("some string", "it's bigger!");
        return someString;
    }

    
    function multiDecode() public pure returns (string memory, string memory) {
        (string memory someString, string memory someOtherString) = abi.decode(multiEncode(), (string, string));
        return (someString, someOtherString);
    }

    function multiEncodePacked() public pure returns (bytes memory) {
        bytes memory someString = abi.encodePacked("some string", "it's bigger!");
        return someString;
    }
    
    function multiStringCastPacked() public pure returns (string memory) {
        string memory someString = string(multiEncodePacked());
        return someString;
    }
}
