# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{7..9} )

inherit distutils-r1

DESCRIPTION="Kafka protocol support in Python"
HOMEPAGE="https://github.com/dpkp/kafka-python/ https://pypi.org/project/kafka-python/"
SRC_URI="https://github.com/dpkp/kafka-python/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="snappy test"
RESTRICT="!test? ( test )"

RDEPEND="snappy? ( dev-python/snappy[${PYTHON_USEDEP}] )"
BDEPEND="
	test? (
		${RDEPEND}
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/unittest2[${PYTHON_USEDEP}]
	)"

python_test() {
	unit2 -v || die "tests failed with ${EPYTHON}"
}
