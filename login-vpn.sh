#!/bin/bash

echo -n "Enter Email: "  
read email  
email=${email/\@/\%40}
echo -n "Enter PassWord: "  
read passwd
echo -n "Enter 2fa-code: "
read code
curl -L -d "email=$email&passwd=$passwd&code=$code" "https://renzhe.cloud/auth/login"
# wget -O config.yaml 
