#
# Copyright (C) 2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Profile/96328avng
  NAME:=Generic 96328avng
  PACKAGES:=
endef
define Profile/96328avng/Description
  Package set optimized for 96328avng.
endef
$(eval $(call Profile,96328avng))
