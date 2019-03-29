# node_exporter setup
1. sudo useradd --no-create-home --shell /bin/false node_exporter
2. cd ~
3. curl -LO https://github.com/prometheus/node_exporter/releases/download/v0.17.0/node_exporter-0.17.0.linux-amd64.tar.gz
4. tar xvf node_exporter-0.17.0.linux-amd64.tar.gz
5. sudo cp node_exporter-0.17.0.linux-amd64/node_exporter /usr/local/bin
6. sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter
7. rm -rf node_exporter-0.17.0.linux-amd64.tar.gz node_exporter-0.17.0.linux-amd64
8. Create service
```
sudo bash -c 'cat > /etc/systemd/system/node_exporter.service' << EOF
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target
[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter
[Install]
WantedBy=multi-user.target
EOF
```
9. sudo systemctl daemon-reload && sudo systemctl enable node_exporter && sudo systemctl start node_exporter &&
10. sudo systemctl status node_exporter

# prometheus setup
1. sudo useradd -–no-create-home -–shell /bin/false node_exporter
2. sudo mkdir /etc/prometheus
3. sudo mkdir /var/lib/prometheus
4. sudo chown prometheus:prometheus /etc/prometheus
5. sudo chown prometheus:prometheus /var/lib/prometheus
6. cd ~
7. curl -LO https://github.com/prometheus/prometheus/releases/download/v2.8.0/prometheus-2.8.0.linux-amd64.tar.gz
8. tar xvf prometheus-2.8.0.linux-amd64.tar.gz
9. sudo cp prometheus-2.8.0.linux-amd64/prometheus /usr/local/bin/
10. sudo cp prometheus-2.8.0.linux-amd64/promtool /usr/local/bin/
11. sudo chown prometheus:prometheus /usr/local/bin/prometheus
12. sudo chown prometheus:prometheus /usr/local/bin/promtool
13. cp -r prometheus-2.0.0.linux-amd64/consoles /etc/prometheus
14. sudo cp -r prometheus-2.0.0.linux-amd64/console_libraries /etc/prometheus
15. sudo chown -R prometheus:prometheus /etc/prometheus/consoles
16. sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries
17. rm -rf prometheus-2.0.0.linux-amd64.tar.gz prometheus-2.0.0.linux-amd64
18. create config in /etc/prometheus/prometheus.yml
sudo chown prometheus:prometheus /etc/prometheus/prometheus.yml
