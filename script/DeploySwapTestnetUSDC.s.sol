// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Script.sol";
import {SwapTestnetUSDC} from "../src/SwapTestnetUSDC.sol";

contract DeploySwapTestnetUSDC is Script {
    function run() public returns (SwapTestnetUSDC) {
        vm.startBroadcast();

        address usdcTokenPolygonMumbai = 0x9999f7Fea5938fD3b1E26A12c3f2fb024e194f97;
        address compoundUsdcTokenPolygonMumbai = 0xDB3cB4f2688daAB3BFf59C24cC42D4B6285828e9;
        address fauceteer = 0x1Cea3a83BA17692cEa8DB37D72446f014480F3bE;

        SwapTestnetUSDC swapTestnetUsdc =
            new SwapTestnetUSDC(usdcTokenPolygonMumbai, compoundUsdcTokenPolygonMumbai, fauceteer);

        console.log("SwapTestnetUSDC deployed to ", address(swapTestnetUsdc));

        vm.stopBroadcast();
        return swapTestnetUsdc;
    }
}
