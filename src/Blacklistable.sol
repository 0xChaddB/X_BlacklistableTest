// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "../lib/openzeppelin-contracts/contracts/access/AccessControl.sol";

contract Blacklistable is AccessControl {
    // Define roles
    bytes32 public constant BLACKLIST_MANAGER_ROLE = keccak256("BLACKLIST_MANAGER_ROLE");
    bytes32 public constant BLACKLISTED_ROLE = keccak256("BLACKLISTED_ROLE");

    event UserBlacklisted(address indexed account);
    event UserRemovedFromBlacklist(address indexed account);

    constructor(address admin) {
        // Set up the admin role
        _grantRole(DEFAULT_ADMIN_ROLE, admin);
        _grantRole(BLACKLIST_MANAGER_ROLE, admin);

    }

    function addBlacklist(address account) external onlyRole(BLACKLIST_MANAGER_ROLE) {
        grantRole(BLACKLISTED_ROLE, account);
    }

    function removeFromBlacklist(address account) external onlyRole(BLACKLIST_MANAGER_ROLE) {
        revokeRole(BLACKLISTED_ROLE, account);
    }

    function isBlacklisted(address account) public view returns (bool) {
        return hasRole(BLACKLISTED_ROLE, account);
    }

    function _onlyNotBlacklisted(address account) private view {
        require(!isBlacklisted(account), "Blacklisted account");
    }
}
