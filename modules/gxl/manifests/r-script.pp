class gxl::r-script {
	r::package { 'foreach': 
	repo => 'http://R-Forge.R-project.org',
	dependencies=>true,}
	r::package { 'doMC': 
	repo => 'http://R-Forge.R-project.org',
	dependencies=>true,}

	r::package { '/opt/r-script/corpcor_1.6.3.tar.gz':
	repo=> NULL,
	dependencies=>true,
	require => FILE['/opt/r-script/corpcor_1.6.3.tar.gz'] ,
	packagename  => 'corpcor'}
	file { '/opt/r-script/':
	ensure  => 'directory',
	mode    => '755',
	owner  => root,
	group  => root,
	}
	file { '/opt/r-script/corpcor_1.6.3.tar.gz':
	ensure  => 'file',
	mode    => '755',
	owner  => root,
	group  => root,
	source => 'puppet:///modules/gxl/corpcor_1.6.3.tar.gz',
	require => FILE['/opt/r-script'],
	}
}
