#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery:13295616:5ec85b2ed28306d6c3c39f0c6941a4c6f9565c4b; then
  applypatch  EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot:7888896:c2ca2d189e4e3f6ea9a5e5fc00cb7ed487fd4c24 EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery 91bb07e1fdb291322bbe35ba005b9c15bacccba6 13293568 c2ca2d189e4e3f6ea9a5e5fc00cb7ed487fd4c24:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery bs=1 seek=13293568 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
