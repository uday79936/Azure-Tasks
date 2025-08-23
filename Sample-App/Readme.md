# Azure VM Lab: Deploying a Sample App with Nginx

A step-by-step guide to create an Azure Virtual Machine (VM), install Nginx, and deploy a simple web app.

---

## 1. Create the Virtual Machine

1. Sign in to the Azure Portal.

2. Navigate to **Virtual machines** → click **+ Create** → **Azure virtual machine**.

3. **Basics** tab:
   - **Subscription**: Select your Azure subscription.
   - **Resource group**: Create a new one or choose an existing one (e.g., `LabRG`).
   - **Virtual machine name**: `SampleVM`.
   - **Region**: Choose the one closest to you.
   - **Image**: Select **Ubuntu 20.04 LTS**.
   - **Size**: e.g., `Standard B1s` (cost-effective and suitable for testing).
   - **Authentication type**: Choose **SSH public key** (recommended) or **Password**.
   - **Username**: `azureuser`.
   - **SSH key**: Generate a new pair or paste your public key.

4. **Disks** tab: Leave as default (Premium SSD or Standard SSD).

5. **Networking** tab:
   - Use default virtual network and subnet.
   - **Public IP**: Yes (for remote access).
   - **NIC network security group (NSG)**:
     - Add inbound rule to allow **SSH (port 22)**.
     - Add inbound rule to allow **HTTP (port 80)**.

6. **Management**, **Monitoring**, **Advanced** tabs: Leave defaults (optional: disable diagnostics if not required).

7. Click **Review + create**, then **Create**. Wait ~1–2 minutes for deployment.

---

## 2. Connect to the VM via SSH

**1. From the VM’s Overview page, copy the **Public IP address**

**2. On your local machine terminal, connect with:**

   ```
   ssh azureuser@<your-public-ip>
   ```
If you're on Windows without a native terminal, use PuTTY or Windows Terminal/WSL.

## 3. Update & Install Nginx Update packages:

```
sudo apt update
```
## Install Nginx:
```
sudo apt install nginx -y
```
## 4. Manage Nginx Service:

**Start Nginx:**

```
sudo systemctl start nginx
```
## Enable on boot:

```
sudo systemctl enable nginx
```

## Check service status:

```
systemctl status nginx
```
You should see Active: running in green.

## 5. Verify Installation:
Get the server’s IP:

```
hostname -I
```
## From your browser, navigate to:
```
http://<your-server-ip>
```
▶ You should see the default Nginx Welcome Page.

## 6. Deploy the Sample App:
Open a browser and go to:
```
http://<your-public-ip>
```
Now you should see the “Welcome to Azure VM Web App” page displayed.

## 7. Clean-Up (Optional):

**To avoid ongoing charges:**

Stop or delete the VM via the Azure Portal.

Or delete the whole resource group:

Navigate to Resource Group (e.g., LabRG) → click Delete → confirm deletion.

Quick Reference: Nginx Commands
Action	Command
```
Start Nginx	sudo systemctl start nginx
Stop Nginx	sudo systemctl stop nginx
Restart Nginx	sudo systemctl restart nginx
Reload Config	sudo systemctl reload nginx
Check Status	systemctl status nginx
```
## Lab Verification Checklist:

 **systemctl status nginx shows Active: running:**

 Browser access to:
 ```
 http://<server-ip> displays default Nginx page
```
 Browser access to:
 ```
  http://<public-ip> displays sample web app page
```
## Images:

## 1. Create Azure Virtual Image:

<img width="1915" height="898" alt="Image" src="https://github.com/user-attachments/assets/1b879b8f-03bc-48d0-a27e-c131fb48198b" />

## 2. Sample Virtual Image:

<img width="1910" height="933" alt="Image" src="https://github.com/user-attachments/assets/c152af49-e32a-40fe-a061-cc7517545f73" />

## 3. Azure SSH Command:

<img width="1908" height="903" alt="Image" src="https://github.com/user-attachments/assets/3c0764bd-1c69-47c9-8471-ea33e1205020" />

## 4. Connect the Server:

<img width="778" height="157" alt="Image" src="https://github.com/user-attachments/assets/2d7be3e3-69f2-448d-a653-aafbc5862c51" />

## 5. Nginx Command:

<img width="696" height="121" alt="Image" src="https://github.com/user-attachments/assets/d82a5565-46f4-475c-95f3-167d6c03505f" />

## 6. Nginx Status Command:

<img width="767" height="131" alt="Image" src="https://github.com/user-attachments/assets/d5119914-b002-4efa-bc8e-56fd6c6a8317" />

## 7. Status Image:

<img width="1495" height="528" alt="Image" src="https://github.com/user-attachments/assets/0d8dcfbe-d41d-43f3-9ab2-a2ea5a511503" />

## 8. Nginx Sample Output:

<img width="1570" height="543" alt="Image" src="https://github.com/user-attachments/assets/d3904ff5-b591-4ba8-ab6a-c4d907a76649" />

## 9. Debian Index.html:

<img width="642" height="226" alt="Image" src="https://github.com/user-attachments/assets/f3766495-8e96-40b4-b002-d5529437611a" />

## 10. Nginx Output:

<img width="1508" height="476" alt="Image" src="https://github.com/user-attachments/assets/dacc9555-edef-428c-bc59-3d6587d59274" />

## 11. Loginform Output:

<img width="1907" height="1017" alt="Image" src="https://github.com/user-attachments/assets/081c7c00-62c6-4a80-995f-9615bd0cd3cb" />

## Summary:

## You’ve successfully:

**Created an Ubuntu VM in Azure**

**Configured networking and firewall rules**

**Installed and managed Nginx**

**Verified web server functionality via browser**

**(Optional) Cleaned up resources to avoid extra charges**

## Congratulations! You’ve completed the lab for Azure VM setup and sample app deployment using Nginx.

## Author:

## Uday Sairam Kommineni
## Azure Cloud Practioner

**Linkedin-URL:** 
https://www.linkedin.com/in/uday-sai-ram-kommineni-uday-sai-ram/

 **Mail-Id:**  saikommineni5@gmail.com
