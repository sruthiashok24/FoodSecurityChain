// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FoodSupplyChain {

    // ─── Roles ───────────────────────────────────────────
    address public owner;
    address public inspector;
    address public distributor;
    address public retailer;

    constructor() {
        owner = msg.sender;
    }

    function setInspector(address _inspector) public {
        require(msg.sender == owner, "Only owner");
        inspector = _inspector;
    }

    function setDistributor(address _distributor) public {
        require(msg.sender == owner, "Only owner");
        distributor = _distributor;
    }

    function setRetailer(address _retailer) public {
        require(msg.sender == owner, "Only owner");
        retailer = _retailer;
    }

    // ─── State ───────────────────────────────────────────
    enum State {
        Harvested,    // 0
        Approved,     // 1
        Rejected,     // 2
        Shipped,      // 3
        Delivered     // 4
    }

    struct FoodBatch {
        uint    id;
        string  cropType;
        string  farmerName;
        string  location;
        uint    quantity;
        uint    price;
        string  harvestDate;
        State   state;
        string  vehicleNumber;
        string  destination;
        string  retailerName;
        bool    exists;
    }

    mapping(uint => FoodBatch) public batches;
    uint public batchCount;

    // ─── Events ──────────────────────────────────────────
    event BatchCreated(
        uint indexed batchId,
        string cropType,
        string farmerName,
        string location,
        uint quantity,
        uint price,
        string harvestDate
    );

    event BatchApproved(
        uint indexed batchId,
        address inspector
    );

    event BatchRejected(
        uint indexed batchId,
        address inspector
    );

    event BatchShipped(
        uint indexed batchId,
        string vehicleNumber,
        string destination
    );

    event BatchDelivered(
        uint indexed batchId,
        string retailerName
    );

    // ─── Functions ───────────────────────────────────────

    // Farmer registers a food batch
    function createBatch(
        string memory _cropType,
        string memory _farmerName,
        string memory _location,
        uint _quantity,
        uint _price,
        string memory _harvestDate
    ) public {
        batchCount++;
        batches[batchCount] = FoodBatch(
            batchCount,
            _cropType,
            _farmerName,
            _location,
            _quantity,
            _price,
            _harvestDate,
            State.Harvested,
            "",
            "",
            "",
            true
        );
        emit BatchCreated(
            batchCount,
            _cropType,
            _farmerName,
            _location,
            _quantity,
            _price,
            _harvestDate
        );
    }

    // Inspector approves batch
    function approveBatch(uint _id) public {
        require(batches[_id].exists, "Batch not found");
        require(
            batches[_id].state == State.Harvested,
            "Batch not in Harvested state"
        );
        batches[_id].state = State.Approved;
        emit BatchApproved(_id, msg.sender);
    }

    // Inspector rejects batch
    function rejectBatch(uint _id) public {
        require(batches[_id].exists, "Batch not found");
        require(
            batches[_id].state == State.Harvested,
            "Batch not in Harvested state"
        );
        batches[_id].state = State.Rejected;
        emit BatchRejected(_id, msg.sender);
    }

    // Distributor ships batch
    function shipBatch(
        uint _id,
        string memory _vehicleNumber,
        string memory _destination
    ) public {
        require(batches[_id].exists, "Batch not found");
        require(
            batches[_id].state == State.Approved,
            "Batch not approved yet"
        );
        batches[_id].state = State.Shipped;
        batches[_id].vehicleNumber = _vehicleNumber;
        batches[_id].destination = _destination;
        emit BatchShipped(_id, _vehicleNumber, _destination);
    }

    // Retailer confirms delivery
    function deliverBatch(
        uint _id,
        string memory _retailerName
    ) public {
        require(batches[_id].exists, "Batch not found");
        require(
            batches[_id].state == State.Shipped,
            "Batch not shipped yet"
        );
        batches[_id].state = State.Delivered;
        batches[_id].retailerName = _retailerName;
        emit BatchDelivered(_id, _retailerName);
    }

    // Get batch details
    function getBatch(uint _id) public view returns (FoodBatch memory) {
        require(batches[_id].exists, "Batch not found");
        return batches[_id];
    }

    // Get current state as string
    function getStateString(uint _id) public view returns (string memory) {
        require(batches[_id].exists, "Batch not found");
        State s = batches[_id].state;
        if (s == State.Harvested)  return "Harvested";
        if (s == State.Approved)   return "Approved";
        if (s == State.Rejected)   return "Rejected";
        if (s == State.Shipped)    return "Shipped";
        if (s == State.Delivered)  return "Delivered";
        return "Unknown";
    }
}
