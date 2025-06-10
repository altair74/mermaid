
router bgp 65000
 template peer-session lts-session
  remote-as 65000
  timers 10 30
 exit-peer-session

 template peer-session aws-session
  remote-as 65001
  timers 10 30
 exit-peer-session

 template peer-policy lts-policy
  default-originate
  soft-reconfiguration inbound
 exit-peer-policy

 template peer-policy aws-policy
  default-originate
  soft-reconfiguration inbound
 exit-peer-policy

 neighbor 10.1.2.1 inherit peer-session lts-session
 neighbor 16.25.54.5 inherit peer-session aws-session
 neighbor 16.25.252.9 inherit peer-session aws-session

 address-family ipv4
  network 0.0.0.0
  neighbor 10.1.2.1 activate
  neighbor 10.1.2.1 inherit peer-policy lts-policy
  neighbor 16.25.54.5 activate
  neighbor 16.25.54.5 inherit peer-policy aws-policy
  neighbor 16.25.252.9 activate
  neighbor 16.25.252.9 inherit peer-policy aws-policy
 exit-address-family

