// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Script.sol";
import {TransferUSDC} from "../src/TransferUSDC.sol";

contract DeployTransferUSDC is Script {
    function run() public {
        vm.startBroadcast();

        address ccipRouterAddressAvalancheFuji = 0xF694E193200268f9a4868e4Aa017A0118C9a8177;
        address linkTokenAddressAvalancheFuji = 0x0b9d5D9136855f6FEc3c0993feE6E9CE8a297846;
        address usdcTokenAvalancheFuji = 0x5425890298aed601595a70AB815c96711a31Bc65;

        TransferUSDC transferUsdc =
            new TransferUSDC(ccipRouterAddressAvalancheFuji, linkTokenAddressAvalancheFuji, usdcTokenAvalancheFuji);

        console.log("TransferUSDC deployed to ", address(transferUsdc));

        vm.stopBroadcast();
    }
}
