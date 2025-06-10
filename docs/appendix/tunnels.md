interface Tunnel1
 ip address 16.25.54.6 255.255.255.252
 ip tcp adjust-mss 1379
 tunnel source 20.19.180.126
 tunnel mode ipsec ipv4
 tunnel destination 43.197.47.51
 tunnel protection ipsec profile ipsec-200-profile
 ip virtual-reassembly

interface Tunnel2
 description LTS-TGW-us-east-1-02
 ip address 16.25.252.10 255.255.255.252
 ip tcp adjust-mss 1379
 tunnel source 20.19.180.126
 tunnel mode ipsec ipv4
 tunnel destination 43.239.235.227
 tunnel protection ipsec profile ipsec-201-profile
 ip virtual-reassembly

