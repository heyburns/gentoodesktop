# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit gnome2-utils meson

DESCRIPTION="Solus Project's Brisk Menu MATE Panel Applet"
HOMEPAGE="https://github.com/getsolus/brisk-menu"

SRC_URI="https://github.com/getsolus/${PN}/releases/download/v${PV}/${PN}-v${PV}.tar.xz -> ${PN}-v${PV}.tar"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-2 CC-BY-SA-4.0"
SLOT="0"
IUSE=""

DEPEND="dev-libs/glib:2
    dev-perl/XML-Parser
    dev-util/intltool
    gnome-base/dconf
    >=mate-base/mate-panel-1.16.0
    sys-devel/gettext
    >=x11-libs/gtk+-3.18:3
    x11-libs/libnotify"
RDEPEND="${DEPEND}"

pkg_preinst(){
    gnome2_schemas_savelist
}

pkg_postinst(){
    gnome2_gconf_install
    gnome2_schemas_update
}

pkg_postrm(){
    gnome2_gconf_uninstall
    gnome2_schemas_update
}
