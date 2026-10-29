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

package org::allbinary::game::layer::LevelLayersFinder;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::layer::LevelLayersFinder'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{enumerationUtil} = 'org::allbinary::util::EnumerationUtil'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::LevelLayersFinder::instance;
}


sub get {
    my ($self, $hashtable) = @_;
        my $smallIntegerSingletonFactory = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance();
        my $list = 'org::allbinary::util::BasicArrayListD'->new();
        my $enumeration = $hashtable->keys();
        my $layerHashtableCanBeNull = undef;
        my $integerCanBeNull = undef;
        my $cachedIntegerCanBeNull = undef;
        while ($self->{enumerationUtil}->hasMoreElements($enumeration)) {
            $layerHashtableCanBeNull = $hashtable->get($self->{enumerationUtil}->nextElement($enumeration));
            $integerCanBeNull = $layerHashtableCanBeNull->get($org::allbinary::layer::Layer::ID);
            $cachedIntegerCanBeNull = $smallIntegerSingletonFactory->getAt(int($integerCanBeNull));
            if (!$list->contains($cachedIntegerCanBeNull)) {
                $list->add($cachedIntegerCanBeNull);
            }
        }
        return $list;
}

use java::util::Enumeration;
use org::allbinary::layer::Layer;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::util::EnumerationUtil;

1;

