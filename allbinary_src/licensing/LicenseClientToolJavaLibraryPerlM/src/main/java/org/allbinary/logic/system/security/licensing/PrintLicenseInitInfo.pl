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

package org::allbinary::logic::system::security::licensing::PrintLicenseInitInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $PATH = "G:\\mnt\\bc\\mydev\\work\\allbinary_src\\licensing\\data\\";


sub new {
    my ($class, $options) = @_;
    my $self = bless({}, $class);
        'org::allbinary::business::init::LicenseInitInfoUtil'->getInstance()->setFilePath($org::allbinary::logic::system::security::licensing::PrintLicenseInitInfo::PATH + 'org::allbinary::globals::PATH_GLOBALS'->getInstance()->{INIT_PATH});
    return $self;
}


# throws Exception
sub getLicenseInitInfo {
    my ($self) = @_;
        my $licenseInitInfoUtil = 'org::allbinary::business::init::LicenseInitInfoUtil'->getInstance();
        if ('org::allbinary::logic::io::file::FileFactory'->getInstance()->isFile($licenseInitInfoUtil->getFilePath())) {
            return $licenseInitInfoUtil->read();
        } else {
            print("No Licence File at: " . $licenseInitInfoUtil->getFilePath(), "\n");
            return 'org::allbinary::business::init::LicenseInitInfo'->new();
        }
}


sub printInitInfo {
    my ($self) = @_;
        try {
            my $licenseInitInfo = $self->getLicenseInitInfo();
            print("License ID: " . $licenseInitInfo->getLicenseId(), "\n");
            my $list = $licenseInitInfo->getServerList();
            my $size = $list->size();
            for (my $index = 0; $index < $size; $index++) {
                print("Lic Serv: " . $list->get($index), "\n");
            }
        } catch ($e) {
            print("Error: " . $e);
            print(STDERR $e, "\n");
        }
}


# throws Exception
sub main {
    my ($class, $args) = @_;
        my $initInfo = 'org::allbinary::logic::system::security::licensing::PrintLicenseInitInfo'->new($args);
        $initInfo->printInitInfo();
}

use org::allbinary::business::init::LicenseInitInfo;
use org::allbinary::business::init::LicenseInitInfoUtil;
use org::allbinary::logic::io::file::FileFactory;
use org::allbinary::globals::PATH_GLOBALS;
use org::allbinary::util::BasicArrayList;
use java::lang::System;

1;

