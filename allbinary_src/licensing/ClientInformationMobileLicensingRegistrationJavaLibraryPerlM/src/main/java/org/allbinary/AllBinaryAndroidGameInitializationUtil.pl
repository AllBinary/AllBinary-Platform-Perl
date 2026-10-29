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

package org::allbinary::AllBinaryAndroidGameInitializationUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub init {
    my ($class) = @_;
        my $resourceUtil = 'org::allbinary::data::resource::ResourceUtil'->getInstance();
        my $androidResources = 'org::allbinary::AndroidResources'->getInstance();
        my $licenseInitInfoUtil = 'org::allbinary::business::init::LicenseInitInfoUtil'->getInstance();
        $resourceUtil->addResource($licenseInitInfoUtil->{INITFILENAME}, ("" . ($androidResources->{raw}->{licenseinitdata})));
        $resourceUtil->addResource('org::allbinary::logic::system::security::licensing::PartnerIdentifierFileUtil'->getInstance()->{FILE_NAME}, ("" . ($androidResources->{raw}->{partner})));
}

use org::allbinary::business::init::LicenseInitInfoUtil;
use org::allbinary::data::resource::ResourceUtil;
use org::allbinary::logic::system::security::licensing::PartnerIdentifierFileUtil;
use org::allbinary::AndroidResources;

1;

