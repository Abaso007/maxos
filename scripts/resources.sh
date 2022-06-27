#!/usr/bin/env bash

echo "Pentest resources script"

usage() {
  echo "Usage: $0 [-a] [-e] [-g] [-o] [-p] [-t] [-v] [-w]" 1>&2;
  echo
  echo "-a (Auth)             Docker authentication"
  echo "-e (Educational)      Pull educational resources (git)"
  echo "-g (Tools)            Pull tools (git)"
  echo "-k (Kali)             Pull Kali (docker)"
  echo "-o (OS)               Pull Operating Systems (docker)"
  echo "-p (PDFs)             Pull AWS PDFs (AWS)"
  echo "-t (Tools)            Pull tools (docker)"
  echo "-v (Vulnerable)       Vulnerable things (docker)"
  echo "-w (Wordlists)        Pull wordlists (git)"
  echo
  echo "Examples:"
  echo "# Everything except Kali"
  echo "$0 -aegoptvw"
  echo
  echo "# Everything"
  echo "$0 -aegkoptvw"
  echo
  echo "# ISO environment"
  echo "$0 -gptw"
  exit 1;
}

arg_auth=0
arg_educational=0
arg_tools_git=0
arg_kali=0
arg_os=0
arg_pdf=0
arg_tools_docker=0
arg_vulnerable=0
arg_wordlists=0

while getopts aegkoptvw flag
do
    case "${flag}" in
        a) arg_auth=1;;
        e) arg_educational=1;;
        g) arg_tools_git=1;;
        k) arg_kali=1;;
        o) arg_os=1;;
        p) arg_pdf=1;;
        t) arg_tools_docker=1;;
        v) arg_vulnerable=1;;
        w) arg_wordlists=1;;
    esac
done

arg_sum=$((${arg_educational}+${arg_tools_git}+${arg_kali}+${arg_os}+${arg_pdf}+${arg_tools_docker}+${arg_vulnerable}+${arg_wordlists}))

# No options specified?
if [ "${arg_sum}" == "0" ]; then
    usage
fi

echo
echo "Selection"
echo "---"
echo "Docker auth: $arg_auth"
echo "Educational repos: $arg_educational"
echo "Git pull: $arg_tools_git"
echo "Kali (docker): $arg_kali"
echo "OS (docker): $arg_os"
echo "AWS PDFs: $arg_pdf"
echo "Tools (docker): $arg_tools_docker"
echo "Vulnerabe things (docker): $arg_vulnerable"
echo "Wordlists: $arg_wordlists"
echo

function git_update() {
  DIR_ACCESSED=`find $2 -maxdepth 0 -type d -atime -1 2>/dev/null | wc -l`

  # Only pull if directory not accessed in last day
  if [[ "$DIR_ACCESSED" == "0" ]]; then
  git clone --depth 1 $1 $2
  cd $2
  git pull
  return 0
  fi
  return 1
}

function pull_kali_docker() {
  ###
  ### Operating Systems (heavy)
  ###
  docker pull booyaabes/kali-linux-full
}

function pull_os_docker() {
  ###
  ### Operating Systems
  ###
  docker pull alpine
  docker pull ubuntu
  docker pull centos
  docker pull debian
  docker pull amazonlinux
  docker pull fedora
  #docker pull kalilinux/kali-rolling
  #docker pull firefart/dockerctf                           # Docker image with some common ctf tools
}

###
### Vulnerable things
###
function pull_vulnerable_things_docker() {
  docker pull citizenstig/dvwa                             # Damn Vulnerable Web Application (DVWA)
  docker pull l505/vulnerablewordpress                     # Vulnerable WordPress Installation
  docker pull hmlio/vaas-cve-2014-6271                     # Vulnerability as a service: Shellshock
  docker pull hmlio/vaas-cve-2014-0160                     # Vulnerability as a service: Heartbleed
  docker pull opendns/security-ninjas                      # Security Ninjas
  docker pull ismisepaul/securityshepherd                  # OWASP Security Shepherd
  docker pull danmx/docker-owasp-webgoat                   # OWASP WebGoat Project docker image
  docker pull vulnerables/web-owasp-nodegoat               # OWASP NodeGoat
  docker pull citizenstig/nowasp                           # OWASP Mutillidae II Web Pen-Test Practice Application
  docker pull bkimminich/juice-shop                        # OWASP Juice Shop
  docker pull eystsen/altoro                               # Altoro Mutual - Demo Vulnerable Web Bank
  docker pull mutzel/all-in-one-hackazon:postinstall       # LAMP Hackazon deployment in a single container
  docker pull tuxotron/tiredful-api                        # Broken web application based on REST API
  docker pull tuxotron/xvwa                                # Xtreme Vulnerable Web Application
}

###
### Tools (docker)
###
function pull_tools_docker() {
  docker pull trufflesuite/ganache-cli                     # Local blockchain dev
  docker pull owasp/zap2docker-stable                      # official OWASP ZAP
  docker pull wpscanteam/wpscan                            # official WPScan
  docker pull metasploitframework/metasploit-framework     # Official Metasploit
  docker pull diogomonica/docker-bench-security            # Docker Bench for Security
  docker pull phocean/msf                                  # Docker Metasploit
  docker pull frapsoft/slowhttptest                        # Application Layer DoS attack simulator
  docker pull guidelacour/whatweb                          # Next generation web scanner
  docker pull opensecurity/cmsscan                         # CMS Scanner: Scan Wordpress, Drupal, Joomla, vBulletin
  docker pull epi052/feroxbuster                           # A fast, simple, recursive content discovery tool written in Rust
  docker pull greenbone/openvas                           # OpenVAS is a full-featured vulnerability scanner
  docker pull mpepping/cyberchef                           # The Cyber Swiss Army Knife
  docker pull phocean/beef                                 # BeEF framework for XSS browser exploitation
  docker pull byt3bl33d3r/crackmapexec                     # A swiss army knife for pentesting networks
  docker pull rossja/ncc-scoutsuite                        # Multi-Cloud Security Auditing Tool
  docker pull dstotijn/hetty                               # Hetty is an HTTP toolkit for security research
  docker pull stefanscherer/winrm                          # The ultimate WinRM shell for hacking/pentesting
  docker pull filebrowser/filebrowser                      # Web File Browser
  docker pull remnux/ciphey                                # Automatically decrypt, decode, and crack
  docker pull bettercap/bettercap                          # The Swiss Army knife for 802.11, BLE, IPv4 and IPv6 networks
  docker pull dominicbreuker/stego-toolkit                 # Collection of steganography tools - helps with CTF challenges
  docker pull oracleinanutshell/oracle-xe-11g              # Oracle DB
  docker pull rflathers/nginxserve                         # nginx
  docker pull ghcr.io/linuxserver/thelounge                # IRC client
  docker pull mythril/myth                                 # Security analysis tool for EVM bytecode
  docker pull trailofbits/manticore                        # Symbolic execution tool for smart contracts
  docker pull trailofbits/eth-security-toolbox             # Trail of Bits Ethereum security tools
  docker pull williamjackson/cartography                   # Consolidates infrastructure assets and the relationships between them
  docker pull mlabouardy/komiser                           # Cloud Environment Inspector
  docker pull toniblyx/prowler                             # Perform AWS security audits
  docker pull arkadiyt/aws_public_ips                      # Fetch all public IP addresses tied to your AWS account
  docker pull accurics/terrascan                           # Detect compliance and security violations across IaC
  docker pull bridgecrew/checkov                           # Checkov is a static code analysis tool for infrastructure-as-code
  docker pull projectdiscovery/nuclei                      # Configurable targeted scanning based on templates
  docker pull kizzx2/wireguard-socks-proxy                 # Expose a WireGuard tunnel as a SOCKS5 proxy
  docker pull dperson/torproxy                             # Tor and Privoxy docker container
  docker pull cmnatic/rustscan                             # The Modern Port Scanner
  docker pull vuls/vuls                                    # Vulnerability scanner for Linux/FreeBSD
  docker pull xer0dayz/sn1per                              # Discover the attack surface and prioritize risks
  docker pull opensecurity/mobile-security-framework-mobsf # Mobile Security Framework (MobSF)
  #docker pull dwisiswant0/apkleaks                        # Scanning APK file for URIs, endpoints & secrets
  docker pull alekzonder/puppeteer                         # Headless Chrome Node.js API
  docker pull simonthomas/theharvester                     # E-mails, subdomains and names Harvester - OSINT
  docker pull unapibageek/ctfr                             # Abusing Certificate Transparency logs for domains
  docker pull six2dez/reconftw:main                        # Perform automated recon on a target domain
  docker pull zadam/trilium                                # Personal knowledge base
  docker pull machines/filestash                           # A modern web client for file protocols
  docker pull theyahya/sherlock                            # Hunt down social media accounts
  docker pull lirantal/is-website-vulnerable               # Find known security vulnerabilities in frontend JS libs
  docker pull guidelacour/dnsenum                          # Enumerates DNS information from a domain among other things
  docker pull elceef/dnstwist                              # Domain name permutation engine
  docker pull tuetenk0pp/sharelatex-full                   # Overleaf image with all tlmgr packages and minted support 

  ###
  ### https://github.com/cybersecsi/RAUDI
  ###
  docker pull secsi/apktool
  docker pull secsi/bfac
  docker pull secsi/cloudfail
  docker pull secsi/cmseek
  docker pull secsi/dirb
  docker pull secsi/dirhunt
  docker pull secsi/dirsearch
  docker pull secsi/dnscan
  docker pull secsi/dvcs-ripper
  docker pull secsi/ffuf
  docker pull secsi/fierce
  docker pull secsi/findsploit
  docker pull secsi/getjs
  docker pull secsi/gitrob
  docker pull secsi/gittools
  docker pull secsi/gobuster
  docker pull secsi/gospider
  docker pull secsi/httprobe
  docker pull secsi/hydra
  docker pull secsi/jwt_tool
  docker pull secsi/knockpy
  docker pull secsi/lfisuite
  docker pull secsi/masscan
  docker pull secsi/massdns
  docker pull secsi/nmap
  docker pull secsi/puredns
  docker pull secsi/race-the-web
  docker pull secsi/restfulharvest
  docker pull secsi/retire
  docker pull secsi/sandcastle
  docker pull secsi/sqlmap
  docker pull secsi/sublist3r
  docker pull secsi/theharvester
  docker pull secsi/waybackpy
  docker pull secsi/whatweb
  #docker pull secsi/eyewitness
  docker pull secsi/nikto
}

###
### AWS Resources
###
function pull_aws_pdfs() {
  mkdir -p $HOME/pdfs/education/aws
  wget -c https://d1.awsstatic.com/whitepapers/aws-overview.pdf \
    -O $HOME/pdfs/education/aws/aws-overview.pdf
  wget -c https://docs.aws.amazon.com/whitepapers/latest/introduction-aws-security/introduction-aws-security.pdf \
    -O $HOME/pdfs/education/aws/introduction-aws-security.pdf
  wget -c https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/wellarchitected-security-pillar.pdf \
    -O $HOME/pdfs/education/aws/wellarchitected-security-pillar.pdf
  wget -c https://d1.awsstatic.com/whitepapers/compliance/Intro_to_Security_by_Design.pdf \
    -O $HOME/pdfs/education/aws/Intro_to_Security_by_Design.pdf
  wget -c https://d1.awsstatic.com/whitepapers/architecture/AWS_Well-Architected_Framework.pdf \
    -O $HOME/pdfs/education/aws/AWS_Well-Architected_Framework.pdf
  wget -c https://d0.awsstatic.com/whitepapers/compliance/AWS_Risk_and_Compliance_Whitepaper.pdf \
    -O $HOME/pdfs/education/aws/AWS_Risk_and_Compliance_Whitepaper.pdf
  wget -c https://d1.awsstatic.com/whitepapers/Security/AWS_Security_Checklist.pdf \
    -O $HOME/pdfs/education/aws/AWS_Security_Checklist.pdf
  wget -c https://d0.awsstatic.com/whitepapers/compliance/AWS_HIPAA_Compliance_Whitepaper.pdf \
    -O $HOME/pdfs/education/aws/AWS_HIPAA_Compliance_Whitepaper.pdf
  wget -c https://d1.awsstatic.com/whitepapers/aws_cloud_adoption_framework.pdf \
    -O $HOME/pdfs/education/aws/aws_cloud_adoption_framework.pdf
  wget -c https://d1.awsstatic.com/whitepapers/compliance/AWS_Auditing_Security_Checklist.pdf \
    -O $HOME/pdfs/education/aws/AWS_Auditing_Security_Checklist.pdf
  wget -c https://d1.awsstatic.com/whitepapers/compliance/AWS_CIS_Foundations_Benchmark.pdf \
    -O $HOME/pdfs/education/aws/AWS_CIS_Foundations_Benchmark.pdf
  wget -c https://d1.awsstatic.com/whitepapers/aws_security_incident_response.pdf \
    -O $HOME/pdfs/education/aws/aws_security_incident_response.pdf
  wget -c https://d1.awsstatic.com/whitepapers/Overview-AWS-Lambda-Security.pdf \
    -O $HOME/pdfs/education/aws/Overview-AWS-Lambda-Security.pdf
  wget -c https://d1.awsstatic.com/whitepapers/aws-kms-best-practices.pdf \
    -O $HOME/pdfs/education/aws/aws-kms-best-practices.pdf
  wget -c https://d1.awsstatic.com/whitepapers/Security/amazon-efs-encrypted-filesystems.pdf \
    -O $HOME/pdfs/education/aws/amazon-efs-encrypted-filesystems.pdf
  wget -c https://d1.awsstatic.com/whitepapers/Security/security-of-aws-cloudhsm-backups.pdf \
    -O $HOME/pdfs/education/aws/security-of-aws-cloudhsm-backups.pdf
  wget -c https://docs.aws.amazon.com/whitepapers/latest/security-overview-aws-lambda/security-overview-aws-lambda.pdf \
    -O $HOME/pdfs/education/aws/security-overview-aws-lambda.pdf
  wget -c https://d0.awsstatic.com/whitepapers/compliance/NIST_Cybersecurity_Framework_CSF.pdf \
    -O $HOME/pdfs/education/aws/NIST_Cybersecurity_Framework_CSF.pdf
  wget -c https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-144.pdf \
    -O $HOME/pdfs/education/aws/nistspecialpublication800-144.pdf
  wget -c https://d1.awsstatic.com/whitepapers/Security/security-at-the-edge.pdf \
    -O $HOME/pdfs/education/aws/security-at-the-edge.pdf
  wget -c https://d0.awsstatic.com/whitepapers/aws-kms-best-practices.pdf \
    -O $HOME/pdfs/education/aws/aws-kms-best-practices.pdf
}

###
### Educational repos (GitHub)
###
function pull_educational_repos() {
  git_update https://github.com/Azure/terraform.git $HOME/git/education/terraform
  git_update https://github.com/hashicorp/learn-terraform-provision-aks-cluster.git $HOME/git/education/learn-terraform-provision-aks-cluster
  git_update https://github.com/open-guides/og-aws.git $HOME/git/education/og-aws
  git_update https://github.com/OpenZeppelin/awesome-openzeppelin $HOME/git/education/awesome-openzeppelin
  git_update https://github.com/smartcontractkit/full-blockchain-solidity-course-py $HOME/git/education/full-blockchain-solidity-course-py
  git_update https://github.com/anderspitman/awesome-tunneling $HOME/git/education/awesome-tunneling
  git_update https://github.com/ConsenSys/smart-contract-best-practices.git $HOME/git/education/smart-contract-best-practices
  git_update https://github.com/papers-we-love/papers-we-love.git $HOME/git/education/papers-we-love
  git_update https://github.com/public-apis/public-apis.git $HOME/git/education/public-apis
  git_update https://github.com/sindresorhus/awesome.git $HOME/git/education/awesome
  git_update https://github.com/EbookFoundation/free-programming-books.git $HOME/git/education/free-programming-books
  git_update https://github.com/jwasham/coding-interview-university.git $HOME/git/education/coding-interview-university
  git_update https://github.com/awesome-selfhosted/awesome-selfhosted.git $HOME/git/education/awesome-selfhosted
  git_update https://github.com/veggiemonk/awesome-docker.git $HOME/git/education/awesome-docker
  git_update https://github.com/DopplerHQ/awesome-interview-questions.git $HOME/git/education/awesome-interview-questions
  git_update https://github.com/faif/python-patterns.git $HOME/git/education/python-patterns

  ###
  ### Pentest Education
  ###
  git_update https://github.com/nowsecure/secure-mobile-development.git $HOME/git/pentest-education/secure-mobile-development
  git_update https://github.com/nixawk/pentest-wiki.git $HOME/git/pentest-education/pentest-wiki
  git_update https://github.com/vulhub/vulhub.git $HOME/git/pentest-education/vulhub
  git_update https://github.com/Lissy93/personal-security-checklist.git $HOME/git/pentest-education/personal-security-checklist
  git_update https://github.com/HalbornSecurity/PublicReports.git $HOME/git/pentest-education/HalbornPublicReports
  git_update https://github.com/toniblyx/my-arsenal-of-aws-security-tools.git $HOME/git/pentest-education/my-arsenal-of-aws-security-tools
  git_update https://github.com/jassics/awesome-aws-security.git $HOME/git/pentest-education/awesome-aws-security
  git_update https://github.com/mytechnotalent/Reverse-Engineering.git $HOME/git/pentest-education/Reverse-Engineering
  git_update https://github.com/sundowndev/hacker-roadmap.git $HOME/git/pentest-education/hacker-roadmap

  git_update https://github.com/The-Art-of-Hacking/h4cker.git $HOME/git/pentest-education/h4cker
  git_update https://github.com/vitalysim/Awesome-Hacking-Resources.git $HOME/git/pentest-education/Awesome-Hacking-Resources
  git_update https://github.com/mantvydasb/RedTeam-Tactics-and-Techniques.git $HOME/git/pentest-education/RedTeam-Tactics-and-Techniques
  git_update https://github.com/irsdl/top10webseclist.git $HOME/git/pentest-education/top10webseclist
  git_update https://github.com/carpedm20/awesome-hacking.git $HOME/git/pentest-education/awesome-hacking
  git_update https://github.com/ashishb/android-security-awesome.git $HOME/git/pentest-education/android-security-awesome
  git_update https://github.com/apsdehal/awesome-ctf.git $HOME/git/pentest-education/awesome-ctf
  git_update https://github.com/arainho/awesome-api-security.git $HOME/git/pentest-education/awesome-api-security
  git_update https://github.com/S3cur3Th1sSh1t/Pentest-Tools.git $HOME/git/pentest-education/Pentest-Tools
  git_update https://github.com/coreb1t/awesome-pentest-cheat-sheets.git $HOME/git/pentest-education/awesome-pentest-cheat-sheets
  git_update https://github.com/Kitsun3Sec/Pentest-Cheat-Sheets.git $HOME/git/pentest-education/Pentest-Cheat-Sheets
  git_update https://github.com/qazbnm456/awesome-web-security.git $HOME/git/pentest-education/awesome-web-security
  git_update https://github.com/paralax/awesome-honeypots.git $HOME/git/pentest-education/awesome-honeypots
  git_update https://github.com/paragonie/awesome-appsec.git $HOME/git/pentest-education/awesome-appsec
  git_update https://github.com/eon01/DockerCheatSheet.git $HOME/git/pentest-education/DockerCheatSheet
  git_update https://github.com/vaib25vicky/awesome-mobile-security.git $HOME/git/pentest-education/awesome-mobile-security
  git_update https://github.com/GrrrDog/Java-Deserialization-Cheat-Sheet.git $HOME/git/pentest-education/Java-Deserialization-Cheat-Sheet
  git_update https://github.com/ihebski/DefaultCreds-cheat-sheet.git $HOME/git/pentest-education/DefaultCreds-cheat-sheet
  git_update https://github.com/S1ckB0y1337/Active-Directory-Exploitation-Cheat-Sheet.git $HOME/git/pentest-education/Active-Directory-Exploitation-Cheat-Sheet
  git_update https://github.com/jakejarvis/awesome-shodan-queries.git $HOME/git/pentest-education/awesome-shodan-queries
  git_update https://github.com/OlivierLaflamme/Cheatsheet-God.git $HOME/git/pentest-education/Cheatsheet-God
  git_update https://github.com/blaCCkHatHacEEkr/PENTESTING-BIBLE.git $HOME/git/pentest-education/PENTESTING-BIBLE
  git_update https://github.com/sinfulz/JustTryHarder.git $HOME/git/pentest-education/JustTryHarder
  git_update https://github.com/offensive-security/exploitdb.git $HOME/git/pentest-education/exploitdb
  git_update https://github.com/Muhammd/Awesome-Pentest.git $HOME/git/pentest-education/Awesome-Pentest
  git_update https://github.com/sbilly/awesome-security.git $HOME/git/pentest-education/awesome-security
  git_update https://github.com/trimstray/test-your-sysadmin-skills.git $HOME/git/pentest-education/test-your-sysadmin-skills
  git_update https://github.com/docker/labs.git $HOME/git/pentest-education/docker-labs
  git_update https://github.com/imthenachoman/How-To-Secure-A-Linux-Server.git $HOME/git/pentest-education/How-To-Secure-A-Linux-Server
  git_update https://github.com/Hacker0x01/hacker101.git $HOME/git/pentest-education/hacker101
  git_update https://github.com/shieldfy/API-Security-Checklist.git $HOME/git/pentest-education/API-Security-Checklist
  git_update https://github.com/google/google-ctf.git $HOME/git/pentest-education/google-ctf
  git_update https://github.com/madhuakula/kubernetes-goat.git $HOME/git/pentest-education/kubernetes-goat

  git_update https://github.com/OWASP/CheatSheetSeries.git $HOME/git/pentest-education/CheatSheetSeries
  rm -rf $HOME/git/pentest-education/CheatSheetSeriesZip
  mkdir $HOME/git/pentest-education/CheatSheetSeriesZip
  wget https://cheatsheetseries.owasp.org/bundle.zip -O $HOME/git/pentest-education/CheatSheetSeriesZip/bundle.zip
  unzip $HOME/git/pentest-education/CheatSheetSeriesZip/bundle.zip -d $HOME/git/pentest-education/CheatSheetSeriesZip

  git_update https://github.com/swisskyrepo/PayloadsAllTheThings.git $HOME/git/pentest-education/PayloadsAllTheThings
  git_update https://github.com/enaqx/awesome-pentest.git $HOME/git/pentest-education/awesome-pentest
  git_update https://github.com/bayandin/awesome-awesomeness.git $HOME/git/pentest-education/awesome-awesomeness
  git_update https://github.com/trimstray/the-book-of-secret-knowledge.git $HOME/git/pentest-education/the-book-of-secret-knowledge
  git_update https://github.com/Hack-with-Github/Awesome-Hacking.git $HOME/git/pentest-education/Awesome-Hacking
  git_update https://github.com/juliocesarfort/public-pentesting-reports.git $HOME/git/pentest-education/public-pentesting-reports
  git_update https://github.com/Sector443/awesome-list-of-public-pentesting-reports.git $HOME/git/pentest-education/awesome-list-of-public-pentesting-reports
}

###
### Pentest Tools
###
function pull_tool_repos() {
  ###
  ### Pentest Frameworks
  ###
  git_update https://github.com/OWASP/wstg $HOME/git/pentest-frameworks/wstg
  git_update https://github.com/OWASP/owasp-mstg.git $HOME/git/pentest-frameworks/owasp-mstg
  if [[ "$?" == "0" ]]; then
    cd $HOME/git/pentest-frameworks/owasp-mstg
    bash tools/docker/pandoc_makedocs.sh
  fi

  git_update https://github.com/s0md3v/Corsy.git $HOME/git/pentest-tools/Corsy
  git_update https://github.com/epinna/tplmap.git $HOME/git/pentest-tools/tplmap
  git_update https://github.com/crawlab-team/crawlab.git $HOME/git/pentest-tools/crawlab
  git_update https://github.com/epi052/feroxbuster.git $HOME/git/pentest-tools/feroxbuster
  git_update https://github.com/flipkart-incubator/Astra.git $HOME/git/pentest-tools/Astra
  git_update https://github.com/pwndoc/pwndoc.git $HOME/git/pentest-tools/pwndoc
  git_update https://github.com/gwen001/pentest-tools.git $HOME/git/pentest-tools/gwen001-pentest-tools
  git_update https://github.com/ethibox/awesome-stacks.git $HOME/git/pentest-tools/awesome-stacks
  git_update https://github.com/portainer/portainer $HOME/git/pentest-tools/portainer
  git_update https://github.com/LasCC/Hack-Tools.git $HOME/git/pentest-tools/Hack-Tools
  git_update https://github.com/commixproject/commix.git $HOME/git/pentest-tools/commix
  git_update https://github.com/qeeqbox/social-analyzer.git $HOME/git/pentest-tools/social-analyzer
  git_update https://github.com/zaproxy/zaproxy.git $HOME/git/pentest-tools/zaproxy
  git_update https://github.com/carlospolop/PEASS-ng.git $HOME/git/pentest-tools/PEASS-ng
  git_update https://github.com/techgaun/github-dorks.git $HOME/git/pentest-tools/github-dorks
  git_update https://github.com/maK-/parameth.git $HOME/git/pentest-tools/parameth
  git_update https://github.com/Sh1Yo/x8 $HOME/git/pentest-tools/x8
  git_update https://github.com/vishnudxb/automated-pentest.git $HOME/git/pentest-tools/automated-pentest
  git_update https://github.com/carlospolop/hacktricks.git $HOME/git/pentest-tools/hacktricks
  git_update https://gitlab.com/invuls/pentest-projects/pcf.git $HOME/git/pentest-tools/pcf
  git_update https://github.com/Nightbringer21/fridump.git $HOME/git/pentest-tools/fridump
  git_update https://github.com/caddyserver/caddy.git $HOME/git/pentest-tools/caddy
  git_update https://github.com/mzet-/linux-exploit-suggester.git $HOME/git/pentest-tools/linux-exploit-suggester
  git_update https://github.com/va1da5/docker-objection-for-android.git $HOME/git/misc/objection
  git_update https://github.com/iddoeldor/frida-snippets.git $HOME/git/misc/frida-snippets
  git_update https://github.com/cybersecsi/RAUDI $HOME/git/pentest-tools/RAUDI
  git_update https://github.com/sullo/nikto.git $HOME/git/pentest-tools/nikto
  git_update https://github.com/sherlock-project/sherlock.git $HOME/git/pentest-tools/sherlock
  git_update https://github.com/ivre/ivre.git $HOME/git/pentest-tools/ivre
  git_update https://github.com/wapiti-scanner/wapiti.git $HOME/git/pentest-tools/wapiti
  git_update https://github.com/google/tsunami-security-scanner.git $HOME/git/pentest-tools/tsunami-security-scanner
  #git_update --depth 1 https://github.com/andresriancho/w3af.git $HOME/git/pentest-tools/w3af

  ###
  ### Misc tools
  ###
  git_update https://github.com/nocodb/nocodb.git $HOME/git/misc/nocodb
  git_update https://github.com/ethibox/awesome-stacks.git $HOME/git/misc/awesome-stacks
  git_update https://github.com/rvaiya/warpd.git $HOME/git/misc/warpd
  git_update https://github.com/overleaf/overleaf.git $HOME/git/misc/overleaf
  git_update https://github.com/TeamPiped/Piped-Docker $HOME/git/misc/Piped-Docker
  git_update https://github.com/deviantony/docker-elk.git $HOME/git/misc/docker-elk
  git_update https://github.com/rascal999/burp-config.git $HOME/git/misc/burp-config
  git_update https://github.com/GamehunterKaan/AutoPWN-Suite.git $HOME/git/pentest-tools/AutoPWN-Suite

  ###
  ### Exploits
  ###
  git_update https://github.com/berdav/CVE-2021-4034 $HOME/git/misc/CVE-2021-4034
  git_update https://github.com/trickest/cve.git $HOME/git/misc/cve

  ###
  ### Tools which need building
  ###

  # shcheck
  git_update https://github.com/santoru/shcheck.git $HOME/git/pentest-tools/shcheck
  if [[ "$?" == "0" ]]; then
    docker build . -t shcheck
  fi

  # DrHeader
  git_update https://github.com/Santandersecurityresearch/DrHeader.git $HOME/git/pentest-tools/DrHeader
  if [[ "$?" == "0" ]]; then
    docker build . -t drheader
  fi

  # Nettacker
  git_update https://github.com/OWASP/Nettacker.git $HOME/git/pentest-tools/Nettacker
  if [[ "$?" == "0" ]]; then
    docker build . -t nettacker
  fi

  # Raccoon
  git_update https://github.com/evyatarmeged/Raccoon.git $HOME/git/pentest-tools/Raccoon
  if [[ "$?" == "0" ]]; then
    docker build -t evyatarmeged/raccoon .
  fi

  # rengine
  git_update https://github.com/yogeshojha/rengine.git $HOME/git/pentest-tools/rengine
  if [[ "$?" == "0" ]]; then
    make certs
    make build
  fi

  # Infoga
  git_update https://github.com/m4ll0k/Infoga.git $HOME/git/pentest-tools/Infoga
  if [[ "$?" == "0" ]]; then
    docker build . -t infoga
  fi

  # apkleaks
  git_update https://github.com/dwisiswant0/apkleaks.git $HOME/git/pentest-tools/apkleaks
  if [[ "$?" == "0" ]]; then
    docker build . -t apkleaks
  fi

  # angularjs-csti-scanner
  git_update https://github.com/tijme/angularjs-csti-scanner.git $HOME/git/pentest-tools/angularjs-csti-scanner.git
  if [[ "$?" == "0" ]]; then
    docker build . -t angularjs-csti-scanner
  fi

  # Arjun
  git_update https://github.com/s0md3v/Arjun.git $HOME/git/pentest-tools/Arjun
  if [[ "$?" == "0" ]]; then
    docker build . -t arjun
  fi

  # frida
  mkdir -p $HOME/venv/pentest-tools/frida
  python -m venv $HOME/venv/pentest-tools/frida
  source $HOME/venv/pentest-tools/frida/bin/activate
  pip install frida
  pip install frida-tools

  # cloudsploit
  git_update https://github.com/aquasecurity/cloudsploit.git $HOME/git/pentest-tools/cloudsploit
  if [[ "$?" == "0" ]]; then
    docker build . -t cloudsploit:0.0.1
  fi

  # S3Scanner
  git_update https://github.com/sa7mon/S3Scanner.git $HOME/git/pentest-tools/S3Scanner
  if [[ "$?" == "0" ]]; then
    docker build . -t s3scanner:latest
  fi

  # aws-security-viz
  git_update https://github.com/anaynayak/aws-security-viz.git $HOME/git/pentest-tools/aws-security-viz
  if [[ "$?" == "0" ]]; then
    docker build -t sec-viz .
  fi

  # CloudMapper
  git_update https://github.com/duo-labs/cloudmapper.git $HOME/git/pentest-tools/cloudmapper
  if [[ "$?" == "0" ]]; then
    docker build -t cloudmapper .
  fi

  # EyeWitness
  git_update https://github.com/FortyNorthSecurity/EyeWitness.git $HOME/git/pentest-tools/EyeWitness
  if [[ "$?" == "0" ]]; then
    docker build --build-arg user=$USER --tag eyewitness --file ./Python/Dockerfile .
  fi

  # spiderfoot
  git_update https://github.com/smicallef/spiderfoot.git $HOME/git/pentest-tools/spiderfoot
  if [[ "$?" == "0" ]]; then
    docker build . -t spiderfoot
  fi

  # routersploit
  git_update https://www.github.com/threat9/routersploit $HOME/git/pentest-tools/routersploit
  if [[ "$?" == "0" ]]; then
    docker build -t routersploit .
  fi

  # scanless
  git_update https://github.com/vesche/scanless.git $HOME/git/pentest-tools/scanless
  if [[ "$?" == "0" ]]; then
    docker build -t scanless .
  fi

  # joomscan
  git_update https://github.com/OWASP/joomscan.git $HOME/git/pentest-tools/joomscan
  if [[ "$?" == "0" ]]; then
    docker build -t rezasp/joomscan .
  fi

  # impacket
  git_update https://github.com/SecureAuthCorp/impacket.git $HOME/git/pentest-tools/impacket
  if [[ "$?" == "0" ]]; then
    docker build -t "impacket:latest" .
  fi

  # droopescan
  git_update https://github.com/droope/droopescan.git $HOME/git/pentest-tools/droopescan
  if [[ "$?" == "0" ]]; then
    docker build -t droope/droopescan .
  fi

  # vulnx
  git_update https://github.com/anouarbensaad/VulnX.git $HOME/git/pentest-tools/VulnX
  if [[ "$?" == "0" ]]; then
    docker build -t vulnx ./docker/
  fi

  # v86
  git_update https://github.com/copy/v86.git $HOME/git/misc/v86
  if [[ "$?" == "0" ]]; then
    docker build -f tools/docker/exec/Dockerfile -t v86:alpine-3.14 .
  fi
}

###
### Wordlists
###
function pull_wordlists() {
  git_update https://github.com/random-robbie/bruteforce-lists.git $HOME/git/wordlists/bruteforce-lists
  git_update https://github.com/google/fuzzing.git $HOME/git/wordlists/fuzzing
  git_update https://github.com/six2dez/OneListForAll.git $HOME/git/wordlists/OneListForAll
  git_update https://github.com/v0re/dirb.git $HOME/git/wordlists/dirb
  git_update https://github.com/danielmiessler/SecLists.git $HOME/git/wordlists/SecLists
  wget https://gist.github.com/jhaddix/b80ea67d85c13206125806f0828f4d10/raw/c81a34fe84731430741e0463eb6076129c20c4c0/content_discovery_all.txt -O $HOME/git/wordlists/content_discovery_all.txt
}

# hetty fs
mkdir $HOME/.hetty

# Docker auth
if [ $arg_auth == 1 ]; then
  docker login
fi

# Educational repos
if [ $arg_educational == 1 ]; then
  pull_educational_repos
fi

# Git pull
if [ $arg_tools_git == 1 ]; then
  pull_tool_repos
fi

# Kali (docker)
if [ $arg_kali == 1 ]; then
  pull_kali_docker
fi

# OS (docker)
if [ $arg_os == 1 ]; then
  pull_os_docker
fi

# AWS PDFs
if [ $arg_pdf == 1 ]; then
  pull_aws_pdfs
fi

# Tools (docker)
if [ $arg_tools_docker == 1 ]; then
  pull_tools_docker
fi

# Vulnerable things (docker)
if [ $arg_vulnerable == 1 ]; then
  pull_vulnerable_things_docker
fi

# Wordlists
if [ $arg_vulnerable == 1 ]; then
  pull_wordlists
fi

# Notify
/home/user/git/nixos/scripts/telegram_notify.sh "Finished updating resources."
