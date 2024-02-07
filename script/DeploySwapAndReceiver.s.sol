// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Script.sol";
import {SwapTestnetUSDC} from "../src/SwapTestnetUSDC.sol";
import {CrossChainReceiver} from "../src/CrossChainReceiver.sol";

contract DeploySwapAndReceiver is Script {
    function run() public {
        vm.startBroadcast();

        address usdcTokenPolygonMumbai = 0x9999f7Fea5938fD3b1E26A12c3f2fb024e194f97;
        address compoundUsdcTokenPolygonMumbai = 0xDB3cB4f2688daAB3BFf59C24cC42D4B6285828e9;
        address fauceteer = 0x1Cea3a83BA17692cEa8DB37D72446f014480F3bE;
        address ccipRouterAddressPolygonMumbai = 0x1035CabC275068e0F4b745A29CEDf38E13aF41b1;
        address cometAddressPolygonMumbai = 0xF09F0369aB0a875254fB565E52226c88f10Bc839;

        SwapTestnetUSDC swapTestnetUsdc =
            new SwapTestnetUSDC(usdcTokenPolygonMumbai, compoundUsdcTokenPolygonMumbai, fauceteer);

        console.log("SwapTestnetUSDC deployed to ", address(swapTestnetUsdc));

        CrossChainReceiver crossChainReceiver =
            new CrossChainReceiver(ccipRouterAddressPolygonMumbai, cometAddressPolygonMumbai, address(swapTestnetUsdc));

        console.log("CrossChainReceiver deployed to ", address(crossChainReceiver));

        vm.stopBroadcast();
    }
}
