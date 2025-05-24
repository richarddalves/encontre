Name:           encontre
Version:        1.0.0
Release:        1%{?dist}
Summary:        Wrapper amigável para o comando find

License:        MIT
URL:            https://github.com/richarddalves/encontre
Source0:        %{name}-%{version}.tar.gz

BuildArch:      noarch
Requires:       bash >= 4.0
Requires:       findutils
Requires:       coreutils
Requires:       bc

%description
O encontre é um wrapper intuitivo para o comando find do Linux,
oferecendo uma sintaxe mais simples e recursos adicionais como
cores, contadores e filtros avançados.

%prep
%setup -q

%build
# Nada para compilar

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT%{_bindir}
install -m 755 bin/encontre $RPM_BUILD_ROOT%{_bindir}/encontre
ln -s encontre $RPM_BUILD_ROOT%{_bindir}/encontrar

%files
%license LICENSE
%doc README.md
%{_bindir}/encontre
%{_bindir}/encontrar

%changelog
* Sat May 24 2025 Richard Dias Alves <dev@richardalves.com> - 1.0.0-1
- Lançamento inicial