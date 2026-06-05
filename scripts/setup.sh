#!/bin/bash
set -euo pipefail
exec > /var/log/setup.log 2>&1

echo "==> Creating scripts directory..."
mkdir -p /home/ivansto/scripts

# ── user.sh — creates a random user ──────────────────────────────────────────
cat > /home/ivansto/scripts/user.sh << 'EOF'
#!/bin/bash
USERNAME="user$(tr -dc 'a-z0-9' < /dev/urandom | head -c 8)"
useradd -m "$USERNAME"
echo "Created user: $USERNAME"
EOF

# ── file.sh — creates a random file in /home/ivansto/scripts ─────────────────
cat > /home/ivansto/scripts/file.sh << 'EOF'
#!/bin/bash
FILENAME="/home/ivansto/scripts/file_$(tr -dc 'a-z0-9' < /dev/urandom | head -c 8).txt"
touch "$FILENAME"
echo "Created file: $FILENAME"
EOF

# ── folder.sh — creates a random folder in /home/ivansto/scripts ─────────────
cat > /home/ivansto/scripts/folder.sh << 'EOF'
#!/bin/bash
FOLDER="/home/ivansto/scripts/folder_$(tr -dc 'a-z0-9' < /dev/urandom | head -c 8)"
mkdir "$FOLDER"
echo "Created folder: $FOLDER"
EOF

chmod +x /home/ivansto/scripts/*.sh
chown -R ivansto:ivansto /home/ivansto/scripts

echo "==> Setup complete. Scripts are in /home/ivansto/scripts/"
