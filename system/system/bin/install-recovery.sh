#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery:13275136:e0b84330236f26f006b40c15131818142b3f44e1; then
  applypatch  EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot:7874560:06403f56e4efff2406fe7fe6ce4030769bb5ae54 EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery d3508e0eebc2c213fe08dc8a4df23b2911f67a12 13273088 06403f56e4efff2406fe7fe6ce4030769bb5ae54:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery bs=1 seek=13273088 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
