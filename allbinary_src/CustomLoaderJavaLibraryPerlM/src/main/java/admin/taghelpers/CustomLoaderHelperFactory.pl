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
use parent -norequire,'java::lang::Object','admin::taghelpers::TagHelperFactoryInterface';

our $CLASSNAME = "admin.taghelpers.CustomLoaderHelper";
our $FACTORYNAME = "CustomLoaderHelperFactory";


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws LicensingException
sub getInstance_j2 {
    my ($self, $hashMap, $pageContext) = @_;
        my $abeClientInformation = 'org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory'->getInstance();
        return 'admin::taghelpers::HelperFactory'->getInstance($abeClientInformation, $FACTORYNAME, $CLASSNAME, $hashMap, $pageContext);
}


# throws LicensingException
sub getInstance_j1 {
    my ($self, $abeClientInformation) = @_;
        return 'admin::taghelpers::HelperFactory'->getInstance($abeClientInformation, $FACTORYNAME, $admin::taghelpers::CustomLoaderHelperFactory::CLASSNAME);
}

sub getInstance {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j2(@arguments) if scalar(@arguments) == 2;
    return $invocant->getInstance_j1(@arguments) if scalar(@arguments) == 1;
    die "No method getInstance takes " . scalar(@arguments) . " arguments";
}

use java::lang::Object ();
use java::util::HashMap ();
# use javax::servlet::jsp::PageContext ();
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface ();
use org::allbinary::logic::system::security::licensing::LicensingException ();
use org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory ();
use admin::taghelpers::HelperFactory ();

1;

