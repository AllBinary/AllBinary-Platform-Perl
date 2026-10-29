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

package org::allbinary::game::configuration::feature::Feature;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $hashtable = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();

sub _init_fields {
    my ($self) = @_;
    $self->{name} = undef;
}


sub new {
    my ($class, $name) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{name} = $name;
        'org::allbinary::game::configuration::feature::Feature'->add($name, $self);
        'org::allbinary::game::configuration::event::ChangedGameFeatureListener'->getInstance()->add($self);
    return $self;
}


sub getInstance {
    my ($class, $name) = @_;
        return $org::allbinary::game::configuration::feature::Feature::hashtable->get($name);
}


sub add {
    my ($class, $name, $gameFeature) = @_;
        $org::allbinary::game::configuration::feature::Feature::hashtable->put($name, $gameFeature);
}


sub toString {
    my ($self) = @_;
        return $self->getName();
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}

use org::allbinary::game::configuration::event::ChangedGameFeatureListener;
use org::allbinary::logic::StdUtil;
use org::allbinary::util::ABHashtable;

1;

