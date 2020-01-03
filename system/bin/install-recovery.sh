#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery:10602496:eed0a15238181b08dad245d40790cbc363ec31c5; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot:9824256:264457f6420efa992e81d2ac91be7a80398d4091 EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery 812528c77eb4d116b4e58b194203312a24bd1f3c 10600448 264457f6420efa992e81d2ac91be7a80398d4091:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery bs=1 seek=10600448 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
