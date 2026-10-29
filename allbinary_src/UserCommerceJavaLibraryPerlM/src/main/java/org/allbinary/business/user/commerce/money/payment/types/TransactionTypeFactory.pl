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

package org::allbinary::business::user::commerce::money::payment::types::TransactionTypeFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::business::user::commerce::money::payment::types::TransactionTypeFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{SALE} = 'org::allbinary::business::user::commerce::money::payment::types::TransactionType'->new("Sale");
    $self->{CREDIT} = 'org::allbinary::business::user::commerce::money::payment::types::TransactionType'->new("Credit");
    $self->{AUTHORIZATION} = 'org::allbinary::business::user::commerce::money::payment::types::TransactionType'->new("Authorization");
    $self->{DELAYEDCAPTURE} = 'org::allbinary::business::user::commerce::money::payment::types::TransactionType'->new("Delayed Capture");
    $self->{VOID} = 'org::allbinary::business::user::commerce::money::payment::types::TransactionType'->new("Void");
    $self->{INQUIRY} = 'org::allbinary::business::user::commerce::money::payment::types::TransactionType'->new("Inquiry");
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::business::user::commerce::money::payment::types::TransactionTypeFactory::instance;
}

use org::allbinary::business::user::commerce::money::payment::types::TransactionType;

1;

