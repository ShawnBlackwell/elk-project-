#install-filebeat

---
- name: installing and launching filebeat
  hosts: webservers
  remote_user: AzureAdmin
  become: yes
  tasks:
  - name: download filebeat deb
    command: curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.8.0-amd64.deb
    
  - name: install filebeat deb
    command: dpkg -i filebeat-7.8.0-amd64.deb
  - name: drop in filebeat.yml 
    copy:
      src: /etc/ansible/files/filebeat-config.yml
      dest: /etc/filebeat/filebeat.yml
  - name: enable and configure system module
    command: filebeat modules enable system
  - name: setup filebeat
    command: filebeat setup
  - name: start filebeat service
    command: service filebeat start
