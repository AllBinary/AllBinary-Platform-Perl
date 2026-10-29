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

#Warning you must have sql root access
package org::allbinary::business::installer::DynamicInitDb;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::installer::InitDb';


sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    die "No constructor of DynamicInitDb takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $abeClientInformation) = @_;
    my $self = $class->SUPER::new();
        $self->setHelper('org::allbinary::business::init::db::InitDbHelperFactory'->getInstance($abeClientInformation));
    return $self;
}


sub _new2 {
    my ($class, $abeClientInformation, $databaseConnectionInfoInterface) = @_;
    my $self = $class->SUPER::new();
        $self->setHelper('org::allbinary::business::init::db::InitDbHelperFactory'->getInstance($abeClientInformation, $databaseConnectionInfoInterface));
    return $self;
}

use org::allbinary::business::init::db::DatabaseConnectionInfoInterface;
use org::allbinary::business::init::db::InitDbHelperFactory;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::system::security::licensing::LicensingException;
use org::allbinary::business::installer::InitDb;

1;

