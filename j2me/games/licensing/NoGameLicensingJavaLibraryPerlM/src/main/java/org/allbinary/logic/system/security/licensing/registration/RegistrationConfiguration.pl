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

package org::allbinary::logic::system::security::licensing::registration::RegistrationConfiguration;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $SINGLETON = 'org::allbinary::logic::system::security::licensing::registration::RegistrationConfiguration'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{registrationCode} = "No Registration Code";
    $self->{NAME} = "registrationid";
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::system::security::licensing::registration::RegistrationConfiguration::SINGLETON;
}


# throws Exception
sub read {
    my ($self) = @_;
}


# throws Exception
sub write {
    my ($self) = @_;
}


sub toString {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringMaker'->new()->append("Registration Code: ")->append($self->getRegistrationCode())->toString();
}


sub setRegistrationCode {
    my ($self, $registrationCode) = @_;
        $self->{registrationCode} = $registrationCode;
}


sub getRegistrationCode {
    my ($self) = @_;
        return $self->{registrationCode};
}

use org::allbinary::logic::string::StringMaker;

1;

