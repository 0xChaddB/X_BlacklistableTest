// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "forge-std/Test.sol";
import "../src/Blacklistable.sol";

contract BlacklistableTest is Test {
    Blacklistable blacklistable;
    address admin = address(0x1);
    address user = address(0x2);

    function setUp() public {
        // Deploy the contract and set the admin address
        blacklistable = new Blacklistable(admin);
        vm.startPrank(admin);
        // Add the user to the blacklist
        blacklistable.addBlacklist(user);
        vm.stopPrank();
    }

    function testBlacklistedUserCanRenounceRole() public {
        // Assert the user is blacklisted
        assertTrue(blacklistable.isBlacklisted(user));

        // Simulate the user renouncing the BLACKLISTED_ROLE
        vm.startPrank(user);
        blacklistable.renounceRole(blacklistable.BLACKLISTED_ROLE(), user);
        vm.stopPrank(); 
        // Ensure the user is no longer blacklisted
        assertFalse(blacklistable.isBlacklisted(user));
    }
}
