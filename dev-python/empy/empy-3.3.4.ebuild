# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DISTUTILS_USE_SETUPTOOLS=no
PYTHON_COMPAT=( python3_{6,7,8,9} pypy3 )

inherit distutils-r1

DESCRIPTION="A powerful and robust templating system for Python"
HOMEPAGE="http://www.alcyone.com/software/empy/"
SRC_URI="http://www.alcyone.com/software/${PN}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ia64 ~ppc ~x86"
IUSE="doc"

python_test() {
	"${PYTHON}" em.py sample.em | diff sample.bench -
	if [[ ${PIPESTATUS[0]} -ne 0 || ${PIPESTATUS[1]} -ne 0 ]]; then
		die "Testing failed with ${EPYTHON}"
	fi
}

python_install_all() {
	distutils-r1_python_install_all
	if use doc; then
		dodir /usr/share/doc/"${PF}"/examples
		insinto /usr/share/doc/"${PF}"/examples
		doins sample.em sample.bench
		#3.3 has the html in this funny place. Fix in later version:
		dohtml doc/home/max/projects/empy/doc/em/*
		dohtml doc/home/max/projects/empy/doc/em.html
		dohtml doc/index.html
	fi
}
