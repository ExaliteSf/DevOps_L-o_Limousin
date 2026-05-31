
Write-Host "Building Ansible controller image..."
docker build -f Dockerfile.ansible -t ansible-controller .

Write-Host "Running Ansible Playbooks..."
docker run --rm `
  -v "${PWD}:/workspace" `
  -v /var/run/docker.sock:/var/run/docker.sock `
  -w /workspace `
  ansible-controller `
  ansible-playbook -i ansible/inventory.ini ansible/init_swarm_cluster.yml
