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

package admin::taghelpers::CustomLoaderHelperFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::taghelpers::TagHelperFactoryInterface';

our $CLASSNAME = "admin.taghelpers.CustomLoaderHelper";
our $FACTORYNAME = "CustomLoaderHelperFactory";


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws LicensingException
sub getInstance {
    my ($self, $hashMap, $pageContext) = @_;
        my $abeClientInformation = 'org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory'->getInstance();
        return 'admin::taghelpers::HelperFactory'->getInstance($abeClientInformation, $FACTORYNAME, $CLASSNAME, $hashMap, $pageContext);
}


# throws LicensingException
# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $abeClientInformation) = @_;
        return 'admin::taghelpers::HelperFactory'->getInstance($abeClientInformation, $FACTORYNAME, $admin::taghelpers::CustomLoaderHelperFactory::CLASSNAME);
}

use java::util::HashMap;
# use javax::servlet::jsp::PageContext;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::system::security::licensing::LicensingException;
use org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory;
use admin::taghelpers::TagHelperFactoryInterface;
use admin::taghelpers::HelperFactory;

1;

