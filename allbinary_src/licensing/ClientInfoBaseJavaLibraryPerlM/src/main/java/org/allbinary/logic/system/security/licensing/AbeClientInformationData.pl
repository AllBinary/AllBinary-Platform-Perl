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

package org::allbinary::logic::system::security::licensing::AbeClientInformationData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::system::security::licensing::AbeClientInformationData'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{KEY} = "KEY";
    $self->{NAME} = "NAME";
    $self->{VERSION} = "VERSION";
    $self->{SPECIALNAME} = "SPECIALNAME";
    $self->{LICENSEID} = "LICENSEID";
    $self->{LICENSE_TYPE} = "LICENSETYPE";
    $self->{PREVIOUSLICENSEID} = "PREVIOUSLICENSEID";
    $self->{OSNAME} = "OSNAME";
    $self->{OSARCH} = "OSARCH";
    $self->{OSVERSION} = "OSVERSION";
    $self->{OS} = "OS";
    $self->{HARDWARE} = "HARDWARE";
    $self->{LICENSESERVERS} = "LICENSESERVERS";
    $self->{NEWLICENSE} = "NEWLICENSE";
    $self->{ISNEW} = "ISNEW";
    $self->{SPECIAL} = "SPECIAL";
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::system::security::licensing::AbeClientInformationData::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


1;

