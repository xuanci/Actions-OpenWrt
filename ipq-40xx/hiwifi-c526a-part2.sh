# 管理地址
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate

# 默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 固件架构
cat >> .config <<EOF
CONFIG_TARGET_ipq40xx=y
CONFIG_TARGET_ipq40xx_DEVICE_hiwifi_c526a=y
EOF

# IPv6支持:
cat >> .config <<EOF
CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y
CONFIG_PACKAGE_ipv6helper=y
EOF

# 取消默认启用的包
cat >> .config <<EOF
# CONFIG_PACKAGE_luci-app-vsftpd is not set
# CONFIG_PACKAGE_luci-app-ssr-plus is not set
# CONFIG_PACKAGE_luci-app-arpbind is not set
# CONFIG_PACKAGE_luci-app-vlmcsd is not set
# CONFIG_PACKAGE_luci-app-wol is not set
# CONFIG_PACKAGE_luci-app-turboacc is not set
# CONFIG_PACKAGE_luci-app-cpufreq is not set
# CONFIG_PACKAGE_luci-app-ipsec-vpnd is not set
# CONFIG_PACKAGE_luci-app-zerotier is not set
# CONFIG_PACKAGE_v2ray is not set
# CONFIG_PACKAGE_shadowsocks-libev-ss-redir is not set
# CONFIG_PACKAGE_shadowsocksr-libev-server is not set
# CONFIG_PACKAGE_block-mount is not set
EOF

# 基本软件:
cat >> .config <<EOF
CONFIG_PACKAGE_bash=y
CONFIG_PACKAGE_nano=y
CONFIG_PACKAGE_wget=y
CONFIG_PACKAGE_curl=y
CONFIG_PACKAGE_unzip=y
CONFIG_PACKAGE_screen=y
CONFIG_PACKAGE_autocore-arm=y
EOF

# FFmpeg
cat >> .config <<EOF
CONFIG_PACKAGE_libopus=y
CONFIG_PACKAGE_libx264=y
CONFIG_PACKAGE_ffmpeg=y
CONFIG_PACKAGE_ffprobe=y
EOF

#cat >> .config <<EOF
# CONFIG_PACKAGE_luci-app-openclash=y
# CONFIG_PACKAGE_luci-app-vssr=y
# CONFIG_PACKAGE_luci-app-vlmcsd=y
# CONFIG_PACKAGE_luci-app-qosv4=y
#EOF

# LuCI主题:
cat >> .config <<EOF
CONFIG_PACKAGE_luci-theme-argon=y
CONFIG_PACKAGE_luci-theme-netgear=y
EOF

# 常用软件 默认已启用
cat >> .config <<EOF
CONFIG_PACKAGE_luci=y
CONFIG_PACKAGE_luci-app-upnp=y
CONFIG_PACKAGE_luci-app-nlbwmon=y
CONFIG_PACKAGE_luci-app-samba=y
CONFIG_PACKAGE_autosamba=y
CONFIG_PACKAGE_default-settings=y
CONFIG_PACKAGE_luci-app-xlnetacc=y
CONFIG_PACKAGE_block-mount=y
CONFIG_PACKAGE_luci-app-openvpn-server=y
CONFIG_PACKAGE_luci-app-rclone=y
EOF

# 其它
sed -i '21d' package/lean/default-settings/files/zzz-default-settings #禁止网络共享分类到NAS
