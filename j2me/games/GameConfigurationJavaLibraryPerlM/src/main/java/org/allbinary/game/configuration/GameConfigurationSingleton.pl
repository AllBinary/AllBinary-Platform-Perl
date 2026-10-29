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

package org::allbinary::game::configuration::GameConfigurationSingleton;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $SINGLETON = 'org::allbinary::game::configuration::GameConfigurationSingleton'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{list} = undef;
    $self->{hashtable} = undef;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::configuration::GameConfigurationSingleton::SINGLETON;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
        $self->{hashtable} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();
    return $self;
}


sub getInstanceByName {
    my ($self, $name) = @_;
        return $self->{hashtable}->get($name);
}


sub getOptionsBasicArrayList {
    my ($self) = @_;
        return $self->{list};
}


sub add {
    my ($self, $gameConfiguration) = @_;
        $self->{list}->add($gameConfiguration);
}


sub getHashtable {
    my ($self) = @_;
        return $self->{hashtable};
}

use org::allbinary::logic::StdUtil;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

