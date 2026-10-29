#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package org::allbinary::logic::system::security::licensing::SetLicenseInitInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $stdinput = 'java::io::BufferedReader'->new('java::io::InputStreamReader'->new($java::lang::System::in));

sub _init_fields {
    my ($self) = @_;
    $self->{vector} = 'org::allbinary::logic::system::security::licensing::BasicArrayListD'->new();
}


sub new {
    my ($class, $options) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        'org::allbinary::business::init::LicenseInitInfoUtil'->getInstance()->setFilePath($org::allbinary::logic::system::security::licensing::PrintLicenseInitInfo::PATH + 'org::allbinary::globals::PATH_GLOBALS'->getInstance()->{INIT_PATH});
        for (my $index = 1; $index < scalar(@{$options}); $index++) {
            $self->{vector}->add($options->[$index]);
        }
    return $self;
}


# throws Exception
sub getLicenseInitInfo {
    my ($self) = @_;
        my $licenseInitInfoUtil = 'org::allbinary::business::init::LicenseInitInfoUtil'->getInstance();
        if ('org::allbinary::logic::io::file::FileFactory'->getInstance()->isFile($licenseInitInfoUtil->{INITFILENAME})) {
            return $licenseInitInfoUtil->read();
        } else {
            return 'org::allbinary::business::init::LicenseInitInfo'->new();
        }
}


sub createNewLicenseInitInfo {
    my ($self, $licenceServerVector) = @_;
        try {
            if (!defined($licenceServerVector)) {
                die ("null BasicArrayList Passed - Just Make Empty if you want");
            }
            my $licenseInitInfo = $self->getLicenseInitInfo();
            print("License Serv Example: http://www.dartstatistics.com/LicServ/serverssl.php", "\n");
            $licenseInitInfo->clearServers();
            my $file = 'java::io::File'->new($org::allbinary::logic::system::security::licensing::PrintLicenseInitInfo::PATH . "licenseservers.txt");
            my $reader = 'java::io::FileReader'->new($file);
            my $lineNumberReader = 'java::io::LineNumberReader'->new($reader);
            while (1) {
                my $line = $lineNumberReader->readLine();
                if (defined($line)) {
                    $licenseInitInfo->addServer($line);
                } else {
                    last;
                }
            }
            'org::allbinary::business::init::LicenseInitInfoUtil'->getInstance()->write($licenseInitInfo);
            'org::allbinary::business::init::LicenseInitInfoUtil'->getInstance()->read();
        } catch ($e) {
            print("Error: " . $e);
            print(STDERR $e, "\n");
        }
}


# throws Exception
sub main {
    my ($class, $args) = @_;
        my $initInfo = 'org::allbinary::logic::system::security::licensing::SetLicenseInitInfo'->new($args);
        $initInfo->createNewLicenseInitInfo('org::allbinary::logic::system::security::licensing::BasicArrayListD'->new());
}

# use java::io::BufferedReader;
# use java::io::InputStreamReader;
use org::allbinary::business::init::LicenseInitInfo;
use org::allbinary::business::init::LicenseInitInfoUtil;
use org::allbinary::logic::io::file::FileFactory;
use org::allbinary::globals::PATH_GLOBALS;
use java::io::File;
# use java::io::FileReader;
# use java::io::LineNumberReader;
use org::allbinary::util::BasicArrayList;
use java::lang::System;
use org::allbinary::logic::system::security::licensing::BasicArrayListD;
use org::allbinary::logic::system::security::licensing::PrintLicenseInitInfo;

1;

