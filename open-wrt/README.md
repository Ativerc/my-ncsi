# open-wrt scripts for network-monitor

Scripts on my OpenWRT Router to test the internet connections.

- `isp-names.sh` - Finds the ISP name in use by using ip-api.com. Triggered from `/etc/hotplug.d/iface`.
- `wan-test.sh` - Tests the status of the internet on each interface of the router. Triggered from `/etc/hotplug.d/iface` and once a minute using `cron`