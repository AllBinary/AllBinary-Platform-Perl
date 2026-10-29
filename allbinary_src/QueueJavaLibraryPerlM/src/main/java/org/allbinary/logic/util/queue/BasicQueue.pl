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

package org::allbinary::logic::util::queue::BasicQueue;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{queueVector} = 'org::allbinary::util::BasicArrayListD'->new();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub offer {
    my ($self, $anyType) = @_;
        $self->{queueVector}->add($anyType);
        return 1;
}


sub remove {
    my ($self, $anyType) = @_;
        $self->{queueVector}->remove($anyType);
}


sub removeLast {
    my ($self) = @_;
        my $anyType = $self->{queueVector}->get($self->{queueVector}->size() - 1);
        $self->{queueVector}->remove($anyType);
        return $anyType;
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

