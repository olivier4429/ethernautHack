# Ethernaut Solutions

Solutions et contrats d'attaque pour les challenges [Ethernaut](https://ethernaut.openzeppelin.com/) d'OpenZeppelin.

## 📋 À propos

Ce repository contient mes solutions aux challenges Ethernaut, une plateforme d'apprentissage de la sécurité des smart contracts Ethereum basée sur des CTF (Capture The Flag).

Chaque challenge présente une vulnérabilité courante dans les smart contracts. L'objectif est de comprendre et exploiter ces failles pour progresser dans l'apprentissage de la sécurité blockchain.

## 🛠️ Stack technique

- **Solidity** - Langage des smart contracts
- **Hardhat** - Framework de développement
- **Ethers.js** - Interaction avec la blockchain
- **Sepolia Testnet** - Réseau de test

## 📁 Structure du projet

```
ethernaut-solutions/
├── contracts/
│   ├── attacks/          # Contrats d'attaque pour chaque niveau
│   └── helpers/          # Contrats utilitaires
├── scripts/              # Scripts de déploiement et d'exécution
├── test/                 # Tests des solutions
└── notes/                # Notes et explications des vulnérabilités
```

## 🎯 Challenges résolus

| # | Challenge | Vulnérabilité | Statut |
|---|-----------|---------------|--------|
| 0 | Hello Ethernaut | - | ✅ |
| 1 | Fallback | Fallback functions | 🔄 |
| 2 | Fallout | Constructor typo | 🔄 |
| 3 | Coin Flip | Weak randomness | 🔄 |
| 4 | Telephone | tx.origin vs msg.sender | 🔄 |
| 5 | Token | Integer overflow | 🔄 |
| 6 | Delegation | Delegatecall | 🔄 |
| 7 | Force | Selfdestruct | 🔄 |
| 8 | Vault | Storage visibility | 🔄 |
| 9 | King | Denial of Service | 🔄 |
| 10 | Re-entrancy | Reentrancy attack | 🔄 |
| 11 | Elevator | Interface manipulation | 🔄 |
| 12 | Privacy | Storage slots | 🔄 |
| 13 | Gatekeeper One | Gas manipulation | 🔄 |
| 14 | Gatekeeper Two | Constructor timing | 🔄 |
| 15 | Naught Coin | ERC20 approval | 🔄 |
| 16 | Preservation | Delegatecall + Storage | 🔄 |
| 17 | Recovery | Contract address prediction | 🔄 |
| 18 | Magic Number | Bytecode manipulation | 🔄 |
| 19 | Alien Codex | Array underflow | 🔄 |
| 20 | Denial | DoS via revert | 🔄 |
| 21 | Shop | View function trust | 🔄 |
| 22 | Dex | Price manipulation | 🔄 |
| 23 | Dex Two | Token validation | 🔄 |
| 24 | Puzzle Wallet | Proxy pattern | 🔄 |
| 25 | Motorbike | UUPS proxy | 🔄 |
| 26 | DoubleEntryPoint | Forta detection | 🔄 |
| 27 | Good Samaritan | Custom errors | 🔄 |
| 28 | Gatekeeper Three | Multiple conditions | 🔄 |
| 29 | Switch | Function selector | 🔄 |

## 🚀 Installation

```bash
# Cloner le repository
git clone https://github.com/[votre-username]/ethernaut-solutions.git
cd ethernaut-solutions

# Installer les dépendances
npm install
```

## ⚙️ Configuration

Créer un fichier `.env` à la racine :

```env
SEPOLIA_RPC_URL=https://eth-sepolia.g.alchemy.com/v2/YOUR_API_KEY
PRIVATE_KEY=your_private_key_here
ETHERSCAN_API_KEY=your_etherscan_api_key
```

## 🎮 Utilisation

```bash
# Compiler les contrats
npx hardhat compile

# Lancer les tests
npx hardhat test

# Déployer une solution (exemple)
npx hardhat run scripts/01-fallback.js --network sepolia
```

## 📚 Ressources

- [Ethernaut Official](https://ethernaut.openzeppelin.com/)
- [OpenZeppelin Docs](https://docs.openzeppelin.com/)
- [Solidity Security Best Practices](https://consensys.github.io/smart-contract-best-practices/)
- [SWC Registry](https://swcregistry.io/)

## ⚠️ Disclaimer

**Ces solutions sont à des fins éducatives uniquement.** 

L'exploitation de vulnérabilités sur des smart contracts en production sans autorisation est illégale. Ces techniques doivent être utilisées uniquement :
- Sur vos propres contrats
- Sur des environnements de test
- Dans le cadre de programmes de bug bounty autorisés
- À des fins d'apprentissage et d'audit

## 📝 Notes d'apprentissage

Chaque solution est accompagnée de notes détaillées expliquant :
- La vulnérabilité exploitée
- Le mécanisme d'attaque
- Les bonnes pratiques pour prévenir cette faille
- Des ressources supplémentaires

## 🤝 Contribution

Les suggestions et améliorations sont les bienvenues ! N'hésitez pas à ouvrir une issue ou une pull request.

## 📄 Licence

MIT

---

*Créé dans le cadre de ma formation en développement blockchain*
