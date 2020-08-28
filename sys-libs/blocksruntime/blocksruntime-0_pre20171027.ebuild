# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs vcs-snapshot

COMMIT=9cc93ae2b58676c23fd02cf0c686fa15b7a3ff81 # 27 Oct 2017

DESCRIPTION="BlocksRuntime library needed for clang's -fblocks support"
HOMEPAGE="https://github.com/mackyle/blocksruntime"
SRC_URI="https://github.com/mackyle/blocksruntime/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0-with-LLVM-exceptions || ( UoI-NCSA MIT )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}"/${PN}-0_pre20171027-ldflags-soname.patch
)

src_prepare() {
	default

	tc-export CC AR RANLIB
}

src_compile() {
	./buildlib -shared || die
}

src_install() {
	prefix="${EPREFIX}/usr" \
	libdir="${EPREFIX}/usr/$(get_libdir)" \
	DESTDIR="${D}" \
		./installlib || die
}
