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

package org::allbinary::util::CircularIndexUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $NULL_CIRCULAR_INDEX_UTIL = 'org::allbinary::util::CircularIndexUtil'->new(0, 0);

sub _init_fields {
    my ($self) = @_;
    $self->{index} = 0;
    $self->{lastIndex} = 0;
    $self->{size} = 0;
}


sub new {
    my ($class, $index, $size) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setSize($size);
        $self->setIndex($index);
    return $self;
}


sub next {
    my ($self) = @_;
        if ($self->{index} >= $self->{lastIndex}) {
            $self->{index} = 0;
        } else {
            $self->{index}++;
        }
        return $self->{index};
}


sub previous {
    my ($self) = @_;
        if ($self->{index} < 1) {
            $self->{index} = $self->{lastIndex};
        } else {
            $self->{index}--;
        }
        return $self->{index};
}


sub setIndex {
    my ($self, $index) = @_;
        if ($index > $self->{lastIndex}) {
            return;
        }
        $self->{index} = $index;
}


sub getIndex {
    my ($self) = @_;
        return $self->{index};
}


sub createInstance {
    my ($class, $max) = @_;
        return 'org::allbinary::util::CircularIndexUtil'->new(0, $max);
}


sub createInstanceAt {
    my ($class, $index, $max) = @_;
        return 'org::allbinary::util::CircularIndexUtil'->new($index, $max);
}


sub setSize {
    my ($self, $size) = @_;
        $self->{size} = $size;
        $self->{lastIndex} = $size - 1;
        $self->{index} = 0;
}


sub getSize {
    my ($self) = @_;
        return $self->{size};
}


sub toString {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::string::CommonLabels'->getInstance()->{INDEX_LABEL})->appendint($self->{index})->append("lastIndex: ")->appendint($self->{lastIndex})->append("size: ")->appendint($self->{size})->toString();
}

# use jsinterop::annotations::JsType;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonLabels;
# use jsinterop::annotations::JsMethod;
# use jsinterop::annotations::JsConstructor;
# use jsinterop::annotations::JsProperty;

1;

