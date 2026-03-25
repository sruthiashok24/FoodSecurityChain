# 🌾 Farm2Fork — Food Security Blockchain System

A blockchain-based food supply chain tracking system built on Ethereum. Every food batch is recorded on an immutable local blockchain — from the farmer's field to the consumer's plate — tamper-proof, transparent, and permanently on-chain.

---

## 🔗 Live Demo Flow

Farmer registers batch → Inspector verifies → Distributor ships → Retailer confirms → Consumer tracks full journey ✅

---

## 🛠 Tech Stack

- Solidity — Smart contract logic  
- Truffle — Compile & deploy contracts  
- Ganache UI — Local Ethereum blockchain  
- Web3.js — Frontend ↔ Blockchain bridge  
- HTML + CSS + JS — Portal UI  

---

## 📁 Project Structure

FoodSecurityChain/
│
├── contracts/
│   └── FoodSupplyChain.sol
│
├── migrations/
│   ├── 1_initial_migration.js
│   └── 2_deploy_contracts.js
│
├── frontend/
│   ├── index.html
│   ├── farmer.html
│   ├── inspector.html
│   ├── distributor.html
│   ├── retailer.html
│   ├── consumer.html
│   └── web3.min.js
│
└── truffle-config.js

---

## ⚙️ Prerequisites

- Node.js (v16 or above)  
- Truffle (npm install -g truffle)  
- Ganache UI (Desktop app)  

---

## 🚀 Setup & Run

Step 1 — Clone the repo  
git clone https://github.com/sruthiashok24/FoodSecurityChain.git  
cd FoodSecurityChain  

Step 2 — Open Ganache  
Open Ganache UI → Click QUICKSTART → Ensure RPC: http://127.0.0.1:7545  

Step 3 — Compile contract  
truffle compile  

Step 4 — Deploy contract  
truffle migrate  

Copy the contract address shown:  
contract address: 0xYOUR_CONTRACT_ADDRESS  

Step 5 — Update frontend  

In all HTML files, update:  
const CONTRACT_ADDRESS = "0xYOUR_CONTRACT_ADDRESS";  

Files:  
index.html  
farmer.html  
inspector.html  
distributor.html  
retailer.html  
consumer.html  

Step 6 — Run app  
Open frontend/index.html in Chrome  

---

## 👥 Roles & Portals

Farmer → farmer.html → accounts[0] → Register batch  
Inspector → inspector.html → accounts[1] → Approve/Reject  
Distributor → distributor.html → accounts[2] → Ship  
Retailer → retailer.html → accounts[3] → Confirm delivery  
Consumer → consumer.html → Track batch  

---

## 🔁 Application Flow

1. Farmer registers batch → Batch created  
2. Inspector approves/rejects → Verified  
3. Distributor ships → Logistics updated  
4. Retailer confirms → Delivery done  
5. Consumer tracks → Full history visible  

---

## ⛓ Smart Contract

States:  
0 → Harvested  
1 → Approved  
2 → Rejected  
3 → Shipped  
4 → Delivered  

Functions:  
createBatch()  
approveBatch()  
rejectBatch()  
shipBatch()  
deliverBatch()  
getBatch()  

Events:  
BatchCreated()  
BatchApproved()  
BatchRejected()  
BatchShipped()  
BatchDelivered()  

---

## 💡 Features

- Tamper-proof blockchain records  
- Transparent supply chain tracking  
- Event-driven smart contract  
- Fully local (Ganache-based) system  
- No authentication needed (role-based portals)  
- Real-time blockchain transactions  

---

## 🧑‍💻 Team

Hemashri S (23Z228)  
Naveenasri R (23Z240)
Sobanarani S M (23Z267)   
Sruthi A (23Z272)
Yogesh (23Z279)

---

## 📜 License

Educational project for blockchain learning  

---



Powered by Ethereum · Ganache · Truffle · Solidity · Web3.js
