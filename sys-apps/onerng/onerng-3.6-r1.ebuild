# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_P="${P/-/_}"
PYTHON_COMPAT=( python2_7 python3_{4,5,6,7} )

inherit python-r1 udev

DESCRIPTION="Software for the Open Hardware Random Number Generator called OneRNG"
HOMEPAGE="https://www.onerng.info/"
SRC_URI="https://github.com/OneRNG/onerng.github.io/raw/master/sw/${MY_P}.orig.tar.gz -> ${P}.tar.gz"

LICENSE="|| ( LGPL-2.1 LGPL-3 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"

BDEPEND="virtual/pkgconfig"

DEPEND="virtual/udev"

RDEPEND="
	${DEPEND}
	app-crypt/gnupg
	dev-python/python-gnupg[${PYTHON_USEDEP}]
	sys-apps/rng-tools
	sys-process/at
"

S="${WORKDIR}/${MY_P}"

pkg_postinst() {
	udev_reload
}

pkg_postrm() {
	udev_reload
}
