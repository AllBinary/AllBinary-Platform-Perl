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

package org::allbinary::logic::system::security::licensing::LicenseTypeFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::system::security::licensing::LicenseTypeFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{UNKNOWN} = 'org::allbinary::logic::system::security::licensing::LicenseType'->new('org::allbinary::string::CommonStrings'->getInstance()->{UNKNOWN});
    $self->{DEMO} = 'org::allbinary::logic::system::security::licensing::LicenseType'->new("Demo");
    $self->{NORMAL} = 'org::allbinary::logic::system::security::licensing::LicenseType'->new("Normal");
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::system::security::licensing::LicenseTypeFactory::instance;
}


# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $name) = @_;
        if ($self->{DEMO}->getName()->compareTo($name) == 0) {
            return $self->{DEMO};
        } elsif ($self->{NORMAL}->getName()->compareTo($name) == 0) {
            return $self->{NORMAL};
        }
        return $self->{UNKNOWN};
}

use org::allbinary::string::CommonStrings;
use org::allbinary::logic::system::security::licensing::LicenseType;

1;

