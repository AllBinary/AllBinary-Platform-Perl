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

package org::allbinary::graphics::color::BasicColorCacheFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::color::BasicColorCacheFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{hashtable} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::color::BasicColorCacheFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub add {
    my ($self, $basicDefaultColor) = @_;
        $self->{hashtable}->put(int($basicDefaultColor), $basicDefaultColor);
}


sub getAndOrCreate {
    my ($self, $integer) = @_;
        my $basicColor = $self->{hashtable}->get($integer);
        if (!defined($basicColor)) {
            $basicColor = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->createInstance(int($integer));
            $self->{hashtable}->put($integer, $basicColor);
        }
        return $basicColor;
}

use org::allbinary::logic::StdUtil;
use org::allbinary::util::ABHashtable;
use org::allbinary::graphics::color::BasicColorFactory;

1;

