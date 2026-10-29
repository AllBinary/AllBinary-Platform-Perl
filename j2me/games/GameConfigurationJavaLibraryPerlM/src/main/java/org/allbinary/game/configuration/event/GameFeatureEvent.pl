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

package org::allbinary::game::configuration::event::GameFeatureEvent;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::AllBinaryEventObject';


sub _init_fields {
    my ($self) = @_;
    $self->{whatChanged} = undef;
}


sub new {
    my ($class, $anyType, $whatChanged) = @_;
    my $self = $class->SUPER::new($anyType);
    $self->_init_fields();
        # super(...) made $self above
        $self->{whatChanged} = $whatChanged;
    return $self;
}


sub getWhatChanged {
    my ($self) = @_;
        return $self->{whatChanged};
}


sub getGameOption {
    my ($self) = @_;
        return $self->getSource();
}

use org::allbinary::logic::util::event::AllBinaryEventObject;

1;

