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

package org::allbinary::media::graphics::geography::pathfinding::PathCacheFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $pathFactory = 'org::allbinary::media::graphics::geography::pathfinding::PathCacheFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{basicArrayListUtil} = 'org::allbinary::util::BasicArrayListUtil'->getInstance();
    $self->{hashtable} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::graphics::geography::pathfinding::PathCacheFactory::pathFactory;
}


sub getSize {
    my ($self) = @_;
        return $self->{hashtable}->size();
}


sub add {
    my ($self, $pathId, $list) = @_;
        $self->{hashtable}->put($pathId, $list);
}


sub remove {
    my ($self, $pathId) = @_;
        $self->{hashtable}->remove($pathId);
}


# throws Exception
sub removeAll {
    my ($self) = @_;
        $self->{hashtable}->clear();
        if ($self->{hashtable}->size() > 0) {
            die ("Did not clear");
        }
}


# throws Exception
sub getOrCreate {
    my ($self, $pathIdInteger) = @_;
        my $listCanBeNull = $self->{hashtable}->get($pathIdInteger);
        if (!defined($listCanBeNull)) {
            $listCanBeNull = $self->{basicArrayListUtil}->getImmutableInstance();
        }
        return $listCanBeNull;
}

use org::allbinary::logic::StdUtil;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListUtil;

1;

