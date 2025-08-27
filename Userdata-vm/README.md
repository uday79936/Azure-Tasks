<img width="1917" height="917" alt="Create VM Image-1" src="https://github.com/user-attachments/assets/434e558c-5457-4965-9d23-35a43f11aa14" />## Deploy the Webserver by using user's data:

## Objective: 

Provision a virtual machine (VM) in a cloud environment using user data to automate the deployment of an NGINX-based web server and clone a GitHub application into the web root. The setup includes:

Creating a VM with defaults (availability zone, network, ports 22 and 80 open).

Providing a startup script (script.sh) via user data.

The script installs NGINX and Git, deploys the application from GitHub, and ensures services are started and enabled.

## 1. Assumptions and Scope:


Cloud Environment: Generic cloud (e.g., AWS, Azure, OpenStack, VMware) using cloud-init or equivalent user-data mechanisms.

Default Configuration: The VM is launched in a default network and availability zone, with SSH (22) and HTTP (80) ports open.

Operating System: Ubuntu/Debian-based Linux distribution with access to apt.

Script Execution: The script.sh will be executed automatically on first boot via cloud-init or custom-data mechanism.

## 2. User Data Mechanism:


Most cloud platforms allow you to pass user data to a VM at provisioning. This script runs on first boot and enables automated setup.


## 3. script.sh (User Data Script)

**This is your startup script:**
```
#!/bin/bash
sudo apt -y update
sudo apt -y install nginx
echo "nginx installed successfully"
sudo systemctl start nginx
echo "nginx started"
sudo systemctl enable nginx
echo "nginx enabled"

sudo apt -y install git
echo "git installed"
sudo rm -rf /var/www/html*
echo "files removed"
sudo git clone https://github.com/Ai-TechNov/mario.git /var/www/html/
echo "new app cloned"
```

Save this as **script.sh.**

## Access your server:

**Visit:**
```
   http://<public-ip> 
```
to confirm NGINX and app are serving.

## Troubleshooting:


Check **/var/log/cloud-init.log** for user data execution logs.

Confirm **ports 22 and 80 are open** (e.g., Azure's NSG settings).

Validate **script.sh** has UNIX line endings and executable permissions if required.

## Cloud-init detects user data and executes:

run cmd scripts.

Shell scripts prefixed with #!/bin/bash.

NGINX and Git are installed.

Application repository is cloned into /var/www/html/.

Cloud-init logs at /var/log/cloud-init.log help troubleshoot issues 

## Images:

## 1. Create Virtual Machine:

<img width="1917" height="917" alt="Image" src="https://github.com/user-attachments/assets/a22b6ac9-618a-43e9-a84f-aa94e38d7291" />

## 2. User's Data in virtual machine:

<img width="1912" height="906" alt="Image" src="https://github.com/user-attachments/assets/af24f56f-b505-42fe-affb-66d6df204786" />

## 3. Change the permissions in script.sh:

<img width="1017" height="677" alt="Image" src="https://github.com/user-attachments/assets/50685c66-faa2-4e99-9a3f-e6061135cb17" />

## 4. Script Executed:

<img width="1358" height="887" alt="Image" src="https://github.com/user-attachments/assets/6ff526bc-707f-4b7e-a2a5-a2404b45ae0f" />

## 5. Nginx Started:

<img width="1540" height="500" alt="Image" src="https://github.com/user-attachments/assets/cabafc88-5814-4deb-ad52-62d99fd7ae40" />

## 6. User' data in webserver Output :

<img width="1917" height="1013" alt="Image" src="https://github.com/user-attachments/assets/73002d62-fe9a-48d5-9259-d66aa93211bc" />

## Author:

**Uday Sairam Kommineni**

**Azure Cloud Practioner**

**Mail-Id:**   saikommineni5@gmail.com

**Linkedin-URL:**  https://www.linkedin.com/in/uday-sai-ram-kommineni-uday-sai-ram/



