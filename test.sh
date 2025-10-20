bash -c ' 
# Install Cloud Foundry CLI
curl -fsSL https://packages.cloudfoundry.org/stable?release=linux64-binary | tar -zx -C /usr/local/bin

# Log into SAP 
cf api https://api.cf.us10.hana.ondemand.com
cf login -a https://api.cf.us10.hana.ondemand.com -u cordeliaschmittbd45@hro.norushcharge.com -p Helme:100

# Pull Ubuntu noVNC image and run it
docker run -d -p 8080:80 consol/ubuntu-xfce-vnc

# Get external IP of Cloud Shell and show access link
EXTERNAL_IP=$(curl -s http://whatismyip.akamai.com)
echo "Access your Ubuntu desktop at http://$EXTERNAL_IP:8080"
'
