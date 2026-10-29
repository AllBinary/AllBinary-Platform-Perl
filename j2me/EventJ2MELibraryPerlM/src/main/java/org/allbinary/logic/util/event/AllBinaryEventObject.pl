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

package org::allbinary::logic::util::event::AllBinaryEventObject;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $NULL_EVENT = 'org::allbinary::logic::util::event::AllBinaryEventObject'->new('org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT});

sub _init_fields {
    my ($self) = @_;
    $self->{source} = undef;
}


sub new {
    my ($class, $anyType) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{source} = $anyType;
    return $self;
}


sub getSource {
    my ($self) = @_;
        return $self->{source};
}


sub setSource {
    my ($self, $source) = @_;
        $self->{source} = $source;
}

# use jsinterop::annotations::JsType;
use org::allbinary::logic::NullUtil;
# use jsinterop::annotations::JsMethod;
# use jsinterop::annotations::JsConstructor;
# use jsinterop::annotations::JsProperty;

1;

