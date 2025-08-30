## Azure Lab: Deploy Application Gateway and Route Traffic to VMs

## Overview:

Create a resource group, VNet, and two subnets (one dedicated to App Gateway).

Deploy two Ubuntu VMs running nginx.

Create an Application Gateway (Standard v2) with a public frontend.

Configure backend pool, health probe, HTTP settings, listener, and rule.

Test round-robin traffic distribution.

Clean up.

## Notes:

• Application Gateway must be placed in its own dedicated subnet (name can be anything, e.g., AppGatewaySubnet).

• Ensure NSGs/UFW on backend VMs allow HTTP (80) from the Application Gateway subnet.

## 1. Prerequisites:


Azure subscription (Contributor/Owner for the target RG).

SSH key pair or a password for VM login.

## 2. Create Resource Group:

**Azure Portal**

Search Resource groups → Create.

Name: AppGatewayLabRG, Region: your choice (e.g., East US).

Review + create → Create.

## 3. Create VNet and Subnets (Dedicated subnet for App Gateway):

**Azure Portal**

Virtual networks → Create.

Name: AppGatewayVNet, Address space: 10.0.0.0/16.

## Subnets:

AppGatewaySubnet → 10.0.1.0/24 (dedicated to App Gateway)

BackendSubnet → 10.0.2.0/24 (for VMs)

Review + create → Create.

## 4. Deploy Two Ubuntu VMs in Backend Subnet & Install Apache:

Azure Portal (per VM)

Virtual machines → Create → Azure virtual machine.

Basics: Name vm1 (then repeat for vm2), Image: Ubuntu 22.04 LTS, Size: any small SKU, Authentication: SSH key or password.

Networking: place NIC in BackendSubnet. Allow inbound SSH (22) and HTTP (80).

Review + create → Create.


Tip: If NSGs are attached, ensure inbound HTTP (80) is allowed from the App Gateway subnet and that the VMs respond with HTTP 200 on /.

## 5. Create Application Gateway (Standard v2, Public Frontend):

**Azure Portal**

Create a resource → Application Gateway → Create.

Basics: Name AppGatewayDemo, Tier: Standard v2.

Frontends: Public (create a new Public IP).

Networking: VNet AppGatewayVNet, Subnet AppGatewaySubnet (dedicated).

Review + create → Create.

## 6. Add Backend Pool (point to VM private IPs):

**Azure Portal**

Open your Application Gateway → Backend pools → Add.

Name: AppGatewayBackendPool.

Add targets: select Virtual machine (NICs of vm1 and vm2) or IP address (their private IPs).

Add.

## 7. Health Probe (optional explicit probe)

**Azure Portal**

Application Gateway has a default probe, but you can create one:
Settings → Health probes → Add

Name: AppGatewayHealthProbe

Protocol: HTTP, Port: 80, Path: /, Interval/timeout defaults are fine → Add.

## 8. HTTP Settings (backend port, probe, affinity)

**Azure Portal**

Settings → HTTP settings → Add

Name: AppGatewayHTTPSettings

Backend protocol: HTTP, Port: 80

Cookie-based affinity: Disabled (enable if you want stickiness)

Connection draining: Off (optional)

Associate Health probe if you created one. → Add.


## 9. Listener (Public, HTTP:80):
Azure Portal

Settings → Listeners → Add

Name: AppGatewayListener

Frontend IP: Public

Protocol: HTTP, Port: 80 → Add.

## 10. Rule (Map listener → backend pool + HTTP settings):
Azure Portal

Settings → Rules → Add (Basic)

Name: AppGatewayRule

Listener: AppGatewayListener

Backend target: Backend pool = AppGatewayBackendPool

HTTP settings: AppGatewayHTTPSettings → Add.


## 11. Test:

Azure Portal / Browser

In the App Gateway Overview, copy the Public IP.

## Browse: 
```
http://<PublicIP> 
```

## 12. Summary :


Resource Group	Logical container for all resources

VNet & Subnets	Network segmentation; dedicated subnet for App Gateway

Virtual Machines	Backend web servers (Apache on Ubuntu)

Public IP + AppGW	Layer 7 load balancer, public frontend, routes HTTP traffic

Backend Pool	Targets (VM private IPs/NICs) for routing

Health Probe	Monitors backend health (HTTP 200s)

HTTP Settings	Backend protocol/port, affinity, probe

Listener	Frontend endpoint (HTTP:80)

Rule	Binds listener → pool using HTTP settings

## Images:


## 13. Cleanup (to avoid charges):

**Azure Portal**

Delete the resource group AppGatewayLabRG.


## Uday Sairam Kommineni

## Azure Cloud Practioner

**Mail-Id:** saikommineni5@gmail.com

**Linkedin-Url:** https://www.linkedin.com/in/uday-sai-ram-kommineni-uday-sai-ram/S

