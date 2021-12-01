#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery:13240320:a0a29f236b6d84473f88e1c608ba70cc5e432334; then
  applypatch  EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot:7833600:03b346334d9afe0c79a9aa087f2edd314e3892f1 EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery c68d958c0dceaef04395b09f4b4d7a7a45f0d76d 13238272 03b346334d9afe0c79a9aa087f2edd314e3892f1:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery bs=1 seek=13238272 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
