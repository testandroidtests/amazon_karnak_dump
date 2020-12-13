#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery:13279232:e52d04dec2fa2af1e1b67ce8a9686cc45b321c04; then
  applypatch  EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot:7874560:17b5ef3accebfbafefe9008fd37ec2a20f7bee66 EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery 06d7a8a07f8eda2f4cfc5f43f583ec58d04ec795 13277184 17b5ef3accebfbafefe9008fd37ec2a20f7bee66:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery bs=1 seek=13277184 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
