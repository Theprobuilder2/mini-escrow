// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MiniEscrow {
    // Wer zahlt? Wer empfängt? Wer schlichtet bei Streit?
    address public auftraggeber;
    address payable public empfaenger;
    address public schiedsrichter;

    // Wird ausgeführt, wenn der Contract erstellt und mit Geld gefüllt wird
    constructor(address payable _empfaenger, address _schiedsrichter) payable {
        auftraggeber = msg.sender;
        empfaenger = _empfaenger;
        schiedsrichter = _schiedsrichter;
    }

    // Geld an den Empfaenger auszahlen
    function auszahlen() public {
        require(msg.sender == schiedsrichter || msg.sender == auftraggeber, "Kein Recht dazu");
        (bool success, ) = empfaenger.call{value: address(this).balance}("");
        require(success, "Fehler beim Senden");
    }

    // Geld an den Auftraggeber zurueck
    function erstatten() public {
        require(msg.sender == schiedsrichter || msg.sender == auftraggeber, "Kein Recht dazu");
        (bool success, ) = payable(auftraggeber).call{value: address(this).balance}("");
        require(success, "Fehler beim Senden");
    }
}
