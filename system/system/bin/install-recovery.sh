#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery:13215744:74d31a3a3a8f58fe89753c69e5880a5e696bf59a; then
  applypatch  EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot:7806976:d0ed95534255c60bb609daa6eb42b877a8a2e17b EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery c2ee9478d64eac42a9604e466edcb3f38f00bd07 13213696 d0ed95534255c60bb609daa6eb42b877a8a2e17b:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery bs=1 seek=13213696 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
