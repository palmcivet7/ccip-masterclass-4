// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Script.sol";
import {CrossChainReceiver} from "../src/CrossChainReceiver.sol";

contract DeployCrossChainReceiver is Script {
    function run() public {
        vm.startBroadcast();

        address ccipRouterAddressPolygonMumbai = 0x1035CabC275068e0F4b745A29CEDf38E13aF41b1;
        address cometAddressPolygonMumbai = 0xF09F0369aB0a875254fB565E52226c88f10Bc839;
        address fauceteer = address(0); // deploy SwapTestnetUSDC first

        CrossChainReceiver crossChainReceiver =
            new CrossChainReceiver(ccipRouterAddressPolygonMumbai, cometAddressPolygonMumbai, fauceteer);

        console.log("CrossChainReceiver deployed to ", address(crossChainReceiver));

        vm.stopBroadcast();
    }
}
