# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_P="${PN}-plugin-${PV}"

DESCRIPTION="Content-aware resizing for the GIMP"
HOMEPAGE="http://liquidrescale.wikidot.com/"
SRC_URI="http://liquidrescale.wikidot.com/local--files/en:download-page-sources/${MY_P}.tar.bz2"
S="${WORKDIR}/${MY_P}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="
	>=media-gfx/gimp-2.8
	media-libs/liblqr"
DEPEND="${RDEPEND}"
