
# 📘 My Notes on Networking

These are my summarised notes from learning about networking fundamentals, covering key topics like DNS, routing, subnetting, OSI model, cloud networking, and troubleshooting. The notes are structured for clarity and quick revision, and I’ve tried to keep the explanations simple and practical without changing the core concepts.


# Intro to Networking

### What is a Computer Network?
Devices connected to each other to share resources. Enables communication between devices.

- **LAN**: Small, e.g., Home Wi-Fi. Allows local device communication.
- **WAN**: Large, global, e.g., Internet.

---

### Switches, Routers, and Firewalls

- **Switches**: Connect devices within the same network using Ethernet cables. Manage LAN data flow.
- **Router**: Connects different networks (e.g., home network to the internet).
- **Firewall**: Protects from unauthorized access. Monitors traffic.

---

### IP Address & MAC Address

- **IP Address**: Unique identifier (IPv4/IPv6). Enables device communication across networks. Assigned by network.
- **MAC Address**: Unique ID for hardware (e.g., laptop). Used within local network.

**Your message (data) needs both:**
- IP → For routing to location
- MAC → For delivery to correct device

---

### Ports & Protocols

- **Ports**: Logical endpoints for communication.
- **Protocols**: Rules for data formatting/transmission.

**Examples:**
- **TCP**: Connection-based, reliable
- **UDP**: No connection, faster, not guaranteed

---

### OSI Model (7 Layers)

Framework to understand how data travels.

1. **Physical** – Transfers raw bits via medium (cables, Wi-Fi)
2. **Data Link** – Node-to-node transfer (MAC, switches)
3. **Network** – Routes packets (IP, Routers)
4. **Transport** – Reliable data delivery (TCP, UDP)
5. **Session** – Manages connections
6. **Presentation** – Encryption & Data formatting
7. **Application** – Services like browsers (HTTP, FTP)

---

### TCP/IP Model

- **Application Layer** – Network services (HTTP)
- **Transport Layer** – End-to-end (TCP, UDP)
- **Internet Layer** – Routing (IP)
- **Network Access Layer** – Physical & Datalink (MAC, signals)

---

# DNS (Domain Name System)

### What is DNS?
Translates website names into IP addresses.

---

### DNS Components

#### Name Servers

- **Authoritative**: Holds DNS records
- **Recursive**: Requests records on your behalf

---

#### Zone Files

- Stored in name servers
- Contain domain-specific data for DNS queries

#### Common DNS Record Types

- **MX**: Directs email traffic
- **TXT**: Email authentication, domain verification

---

### DNS Resolution Process

1. User types `google.com` into browser
2. Request sent to DNS resolver
3. Resolver checks local cache
4. If not found, asks root server → returns `.com` TLD
5. TLD returns authoritative name server
6. Authoritative server returns IP
7. Resolver passes IP to browser → website loads

---

### DNS Resolver Flow

- Checks `/etc/hostfile`
- If not there, checks local DNS cache
- Then → Root → TLD → Authoritative → Returns IP
- Caches result for future requests

---

# 🛠️ Routing & Subnetting

### What is Routing?

Determines best path for data across networks.

- **Router**: Directs traffic
- **Routing Table**: Helps decide routes

---

### Static vs Dynamic Routing

- **Static Routing**: Manually configured
- **Dynamic Routing**: Automatically updates using protocols

---

### Routing Protocols

- **OSPF**: Fast, shortest path using link status
- **BGP**: Exchanges routes between networks (AS), rule-based

---

### Subnetting

Dividing a network into smaller subnets for better management.

---

#### CIDR Notation Example

IP Address: 192.168.1.0/24
Prefix: 24

---


#### Binary Subnet Mask

11111111.11111111.11111111.00000000 → 255.255.255.0

---

#### Subnet Example

- Subnets Required: 4
- Subnet Mask: `255.255.255.0`
- Network Address: `192.168.1.0`
- Broadcast Address: `192.168.1.255`
- **Usable IPs**: `192.168.1.1` – `192.168.1.254`

---

# NAT (Network Address Translation)

### What is NAT?

Translates private IP to public IP to access the internet.

- Example:  
  `192.168.1.10 → 98.117.53.254`

---

### Types of NAT

- **Static NAT**: 1-to-1 fixed mapping
- **Dynamic NAT**: Mapped to available public IPs
- **PAT**: Multiple devices use one public IP with unique ports

---

# Network Troubleshooting

### Useful Commands

- `ping` – Test connectivity
- `traceroute` – Show data path
- `nslookup` – Resolve domain to IP
- `dig` – Advanced DNS lookup
- `/etc/hostfile` – Manual hostname resolution

---

### Troubleshooting Steps

1. Run `ping`
2. Run `dig` / `nslookup`
3. Check `/etc/hostfile`
4. Check firewall settings
5. Clear DNS cache
6. Run `traceroute`

---

# Cloud Networking

### VPC – Virtual Private Cloud

- Your own cloud-based network
- Define IP ranges, subnets, route tables, gateways

### Subnets

- Subdivisions inside VPC

### Gateways

- Connect VPC to outside (e.g., Internet)
