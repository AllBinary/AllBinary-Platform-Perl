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

package org::allbinary::business::init::db::InitDbHelperFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

our $CLASSNAME = "org.allbinary.business.installer.InitDbCrypted";


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws LicensingException
sub getInstance_j2 {
    my ($class, $abeClientInformation, $databaseConnectionInfoInterface) = @_;
        my $params = [(undef) x (1)];
        my $classes = [(undef) x (1)];
        $classes->[0] = 'org::allbinary::business::init::db::DatabaseConnectionInfoInterface';
        $params->[0] = $databaseConnectionInfoInterface;
        my $anyType = 'org::allbinary::logic::system::loader::AbeFactory'->getInstance()->getInstance($abeClientInformation, $CLASSNAME, $classes, $params);
        return $anyType;
}


# throws LicensingException
sub getInstance_j1 {
    my ($class, $abeClientInformation) = @_;
        my $anyType = 'org::allbinary::logic::system::loader::AbeFactory'->getInstance()->getInstance($abeClientInformation, $CLASSNAME, undef, undef);
        return $anyType;
}

sub getInstance {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j2(@arguments) if scalar(@arguments) == 2;
    return $invocant->getInstance_j1(@arguments) if scalar(@arguments) == 1;
    die "No method getInstance takes " . scalar(@arguments) . " arguments";
}

use java::lang::Object ();
use org::allbinary::logic::system::loader::AbeFactory ();
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface ();
use org::allbinary::logic::system::security::licensing::LicensingException ();

1;

