# Use kali image from linuxserver.io
FROM lscr.io/linuxserver/kali-linux:latest

# Install package selection
RUN apt update && apt install -y \
	fish \
	neovim \
	nvtop \
	openssh-server

# Set ssh port
RUN sed -i 's/^#Port 22/Port 2222/' /etc/ssh/sshd_config

# Enable root login
RUN sed -i 's/^#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Expose SSH port
EXPOSE 2222

# Start sshd
CMD ["/usr/sbin/sshd", "-D"]
