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

package org::allbinary::game::midlet::SpecialDemoGameMidlet;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::midlet::DemoGameMidlet';



sub new {
    my ($class, $clientInformationFactory, $licenseLoadingType, $demoSetupFactory, $licenseCheckRunnableFactory) = @_;
    my $self = $class->SUPER::new($clientInformationFactory);
        # super(...) made $self above
    return $self;
}


sub initView {
    my ($self) = @_;
}


sub preInit {
    my ($self) = @_;
        'org::allbinary::logic::system::security::licensing::LicenseServerInitFileUtil'->new()->init();
}

use org::allbinary::logic::system::security::licensing::ClientInformationFactory;
use org::allbinary::logic::system::security::licensing::LicenseServerInitFileUtil;
use org::allbinary::game::midlet::DemoGameMidlet;

1;

