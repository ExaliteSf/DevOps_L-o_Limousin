# Script Windows pour executer Ansible via WSL
# Prerequis WSL :
#   pip install ansible
#   ansible-galaxy collection install community.docker
#
# Usage depuis le dossier du projet :
#   cd esgi-2603-my-favorite-places
#   docker compose -f swarm/compose.yml up -d --build
#   .\ansible.ps1

$drive   = (Get-Location).Drive.Name.ToLower()
$path    = (Get-Location).Path -replace '^[A-Za-z]:\\', '' -replace '\\', '/'
$wslPath = "/mnt/$drive/$path"

Write-Host "Running Ansible Playbooks..."
wsl bash -c "cd '$wslPath' && ansible-playbook -i ansible/inventory.ini ansible/init_swarm_cluster.yml"
