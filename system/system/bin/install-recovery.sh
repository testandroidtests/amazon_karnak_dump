#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery:13301760:65189375ed74a2f2dc1e391f014d47d1be629973; then
  applypatch  EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot:7895040:1a12f54f7e343b0e0612ee9f367a702deb03354e EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery 682aa31efa409ef80ad5cb1b1d8967855ddb3ba9 13299712 1a12f54f7e343b0e0612ee9f367a702deb03354e:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery bs=1 seek=13299712 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
