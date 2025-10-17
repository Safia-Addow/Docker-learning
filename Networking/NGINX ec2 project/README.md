
## ⚡ Launching an NGINX Web Server on Amazon EC2 and Connecting It to a Cloudflare Domain 🌐

This guide walks you through how to set up an NGINX web server on an Amazon EC2 instance
and connect it to a domain name managed by Cloudflare.
By the end, your website will be live and accessible through your own domain. 🚀

---

## 🔹 Step 1: Purchase a Domain from Cloudflare

Go to Cloudflare Registrar and buy your domain.
Typical cost: around £3–£8 per year depending on the extension (.com, .net, .io).

---

## 🔹 Step 2: Launch an EC2 Instance

In your AWS Management Console, create a new EC2 instance with the following configuration:

- AMI: Amazon Linux 2023  
- Instance Type: t3.micro (free-tier eligible)  
- Security Group Inbound Rules:  
  - Port 22 (SSH) → Your IP  
  - Port 80 (HTTP) → 0.0.0.0/0  
  - Port 443 (HTTPS) → 0.0.0.0/0  

Once ready, click “Launch Instance” and download your `.pem` key file for SSH access.

---

## 🔹 Step 3: Get the Public IPv4 Address

After your instance is running, go to the **EC2 Dashboard → Instances → Your Instance**.
Copy the **Public IPv4 Address** — you’ll need this for SSH and DNS setup later.

---
# ⚡ Launching an NGINX Web Server on Amazon EC2 and Connecting It to a Cloudflare Domain 🌐

## 🔹 Step 4: Connect to Your EC2 Instance via SSH

Run this command in your terminal 💻:

ssh -i /path/to/your-key.pem ec2-user@<EC2_PUBLIC_IP>

Replace `/path/to/your-key.pem` with the actual path to your key file.  
Replace `<EC2_PUBLIC_IP>` with your instance’s public IPv4 address.

---

## 🔹 Step 5: Install and Start NGINX

Run the following commands to install and enable NGINX on your instance:

sudo yum update -y
sudo yum install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx

Now, open your EC2 public IP in a browser — you should see the default NGINX welcome page. 🎉

---

## 🔹 Step 6: Add an A Record in Cloudflare DNS

Log in to your Cloudflare dashboard, open your domain’s DNS settings,  
and create a new A record pointing to your EC2 instance.

| Type | Name | Value (IPv4 address) | TTL | Proxy Status |
|------|------|----------------------|-----|---------------|
| A | @ | <Your_EC2_Public_IP> | Auto | DNS only |

You can also create a `www` record pointing to the same IP.

---

## 🔹 Step 7: Verify Domain Propagation

After saving your DNS records, wait a few minutes, then check propagation using:

nslookup <your-domain-name>

If the output shows your EC2’s IP address, your domain is correctly mapped. ✅

---

## 🔹 Step 8: Customize Your NGINX Web Page

You can replace the default NGINX homepage with your own HTML:

cd /usr/share/nginx/html
sudo nano index.html

Edit the file to include your own content, for example:

<h1>Welcome to My Website!</h1>
<p>Powered by NGINX on Amazon EC2 🚀</p>

Then restart NGINX:

sudo systemctl restart nginx

---

## 🔹 Step 9: Test Everything in the Browser

Open your browser and visit your domain (e.g., http://yourdomain.com).  
You should see your custom NGINX page live on your domain! 🎊

---

                        ## 🎉 Congratulations!
# 🎉 You now have an NGINX web server running on EC2, mapped to your custom domain!

You now have:
- An NGINX web server running on Amazon EC2
- A domain name from Cloudflare pointing to your server
- A live website accessible from anywhere 🌎

---
