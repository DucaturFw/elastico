pragma solidity ^0.4.19;

import 'zeppelin-solidity/contracts/math/SafeMath.sol';

contract Elastico {
    
    using SafeMath for uint256;
    
    uint256 public unblocked;
    address public oracle;
    address public icofounder;
    uint256 public spent;
    
    modifier onlyOracle () {
        require(msg.sender == oracle);
        _;
    }
    
    modifier onlyIcoFounder () {
        require(msg.sender == icofounder);
        _;
    }
    
    function unblock(unit256 _unblock) external onlyOracle {
        unblocked = unblocked + _unblock;
    }
    
    function setOracle(address _oracle) internal {
        oracle = _oracle;
    }
    
    function setIcofounder(address _founder) internal {
        icofounder = _founder;
    }
    
    function getEth() public onlyIcoFounder {
        require(unblocked > spent);
        spent = unblocked;
        bool isSent = owner.transfer(unblocked.sub(spent));
        require(isSent);
    }

}
