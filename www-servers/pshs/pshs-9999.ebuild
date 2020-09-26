# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGIT_REPO_URI="https://github.com/mgorny/${PN}.git"

inherit autotools git-r3

DESCRIPTION="Pretty small HTTP server -- a command-line tool to share files"
HOMEPAGE="https://github.com/mgorny/pshs/"
SRC_URI=""

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE="libressl +magic qrcode ssl upnp"

RDEPEND=">=dev-libs/libevent-2:0=
	magic? ( sys-apps/file:0= )
	qrcode? ( media-gfx/qrencode:0= )
	ssl? ( >=dev-libs/libevent-2.1:0=[ssl]
		!libressl? ( dev-libs/openssl:0= )
		libressl? ( dev-libs/libressl:= )
	)
	upnp? ( net-libs/miniupnpc:0= )"
DEPEND="${RDEPEND}"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	local myconf=(
		$(use_enable magic libmagic)
		$(use_enable qrcode qrencode)
		$(use_enable ssl)
		$(use_enable upnp)
	)

	econf "${myconf[@]}"
}
