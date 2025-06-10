#!/usr/bin/env bash
set -e

# 1) Clone (change to your repo URL)
#git clone git@github.com:YOUR_ORG/YOUR_REPO.git
#cd YOUR_REPO

# 2) Make the new directories
mkdir -p docs/diagrams docs/appendix config/snippets .github/workflows

# 3) Move files into structure
mv ~/tmp_mermaid/network-architecture.md              docs/network-architecture.md
mv ~/tmp_mermaid/vpn-architecture.mmd                 docs/diagrams/vpn-architecture.mmd

mv ~/tmp_mermaid/trustpoint.md                        docs/appendix/trustpoint.md
mv ~/tmp_mermaid/ikev2-proposal.md                    docs/appendix/ikev2-proposal.md
mv ~/tmp_mermaid/ikev2-profiles.md                    docs/appendix/ikev2-profiles.md
mv ~/tmp_mermaid/ipsec-transform-set.md               docs/appendix/ipsec-transform-set.md
mv ~/tmp_mermaid/ipsec-profiles.md                    docs/appendix/ipsec-profiles.md
mv ~/tmp_mermaid/tunnels.md                           docs/appendix/tunnels.md
mv ~/tmp_mermaid/interfaces.md                        docs/appendix/interfaces.md
mv ~/tmp_mermaid/bgp.md                               docs/appendix/bgp.md

mv ~/tmp_mermaid/full-vpn.cfg                         config/full-vpn.cfg
mv ~/tmp_mermaid/snippets/*.cfg                       config/snippets/

# 4) Add CI workflow
cat > .github/workflows/ci.yml <<EOF
name: CI

on:
  push:
    paths:
      - 'docs/diagrams/**.mmd'
jobs:
  lint_mermaid:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Lint Mermaid diagrams
        run: |
          npm install -g @mermaid-js/mermaid-cli
          mmdc -i docs/diagrams/vpn-architecture.mmd -o /dev/null
EOF

# 5) Commit & push
git add .
git commit -m "Reorganize repo: docs/, appendix/, config/, CI workflow"
git push origin main

