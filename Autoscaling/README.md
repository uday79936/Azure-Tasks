## 🚀 Azure Virtual Machine Scale Set (VMSS) Deployment Lab:

## 📌 Project Overview:

This lab demonstrates how to deploy and configure an Azure Virtual Machine Scale Set (VMSS) running Ubuntu Linux VMs with:

A custom startup script to install and configure Apache Web Server.

An Azure Load Balancer to distribute traffic.

Autoscaling rules based on CPU usage.

## 🧱 Architecture: 

VMSS:                   Ubuntu Server 20.04 LTS

Web Server:                     nginx

Load Balancer:   Azure Load Balancer for distributing HTTP traffic

Scaling Rules:     Autoscale based on CPU (scale-out and scale-in)

## ⚙️ Deployment Steps:

## 1️⃣ Create a Virtual Machine Scale Set:


Log in to the Azure Portal
.

Search Virtual Machine Scale Sets → Click Create.

Basics Tab
Field	Value
Subscription	Your active subscription
Resource Group	VMSSLabRG
Name	MyVMSS
Region	East US (or region with AZs)
Orchestration Mode	Uniform
Image	Ubuntu Server 20.04 LTS
Authentication Type	Password or SSH key
Username	azureuser
Password / SSH	Provide credentials
Instances Tab
Field	Value
Initial instance count	2
Availability Zone	Zone redundant
VM Size	Standard B1s
Disks Tab

Use default OS disk settings.

Networking Tab
Field	Value
Virtual Network	New or existing
Public IP	Enabled
Load Balancing	Azure Load Balancer
Inbound Ports	HTTP (80), SSH (22)
Management Tab

## Enable Boot diagnostics (optional):

Scaling Tab

Enable Autoscaling:

Minimum: 2

Maximum: 5

Scale Out: CPU > 70%

Scale In: CPU < 30%

Advanced Tab (Custom Data)

## Add the nginx:

```
#!/bin/bash
sudo apt -y update
sudo apt -y install nginx
sudo systemctl start nginx
sudo systemctl enable nginx
sudo rm -rf /var/www/html*
sudo git clone https://github.com/Ai-TechNov/mario.git /var/www/html/

```

## 2️⃣ Deploy Resources:

Click Review + Create → Deploy (takes ~5 min).

## 3️⃣ Test the Web Application

Go to VMSS → Overview.

Copy the Load Balancer Public IP.

## Open in browser:
```
http://<public-ip>
```


## ✅ You should see:
Welcome to Azure VM Scale Set!

## 4️⃣ Trigger Autoscaling (Optional):

SSH into a VM instance:
```
sudo apt install stress -y
stress --cpu 1 --timeout 300
```


This increases CPU load → triggers scale-out beyond 70% usage.

## 5️⃣ Clean Up:


## To avoid charges:

az group delete --name VMSSLabRG --yes --no-wait

## Images:





## 📈 Lab Summary:

Task	Status
Deploy VMSS	✅
Install web app via startup script	✅
Configure Load Balancer	✅
Setup autoscaling	✅
Access public site	✅

## 📂 Repository Structure:
```
azure-vmss-lab/
│── README.md        # Documentation
│── scripts/
│    └── userdata.sh  # nginx script
```
## 🔮 Future Enhancements:

Use Application Gateway with WAF instead of Basic Load Balancer.

Deploy via ARM templates or Terraform for IaC.

Integrate with Azure Monitor for advanced metrics.

## 👨‍💻 Author:

**Uday Sairam Kommineni**

**Azure Cloud Practioner**

**Mail-Id:** saikommineni5@gmail.com

**LinkedIn-URL:** https://www.linkedin.com/in/uday-sai-ram-kommineni-uday-sai-ram/