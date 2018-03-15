pragma solidity ^0.4.19;

import 'zeppelin-solidity/contracts/token/ERC20/StandardToken.sol';
import 'zeppelin-solidity/contracts/ownership/Ownable.sol';
import 'zeppelin-solidity/contracts/math/SafeMath.sol';
import './elastico.sol';


contract Token is StandardToken, Ownable {

    string public constant name = "Elastico client token";
    string public constant symbol = "ECT";
    uint32 public constant decimals = 18;
    uint256 public constant INITIAL_SUPPLY = 10**6; 
    uint256 public totalTokens;

    function Token() public {
        totalTokens = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
    }
}

contract Crowdsale is Ownable, Elastico {
    
    using SafeMath for uint256;

    address public constant ORACLE_ADRESS = '0x1979C2A9D21F9f8FFB73F0a81CE9823c4F306eaF'; 
    uint256 rate;

    function Crowdsale() public {
        owner = msg.sender;
        rate = 1000;
        setOracle(ORACLE_ADRESS);
        setIcofounder(owner);

    }

    function() external payable {
        uint256 tokens = rate.mul(msg.value).div(1 ether);
        token.transfer(msg.sender, tokens);

    }
}