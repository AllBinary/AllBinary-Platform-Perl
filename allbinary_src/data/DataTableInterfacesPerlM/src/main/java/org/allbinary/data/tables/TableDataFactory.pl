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

package org::allbinary::data::tables::TableDataFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::data::tables::TableDataFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{INTEGER_MAX_VALUE_STRING} = ("" . (2147483647));
    $self->{ZERO_STRING} = 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{ZERO};
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::data::tables::TableDataFactory::instance;
}

use org::allbinary::string::CommonPhoneStrings;

1;

