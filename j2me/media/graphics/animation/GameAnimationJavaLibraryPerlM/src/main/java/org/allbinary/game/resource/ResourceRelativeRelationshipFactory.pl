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

package org::allbinary::game::resource::ResourceRelativeRelationshipFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::resource::ResourceRelativeRelationshipFactoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{basicArrayListUtil} = 'org::allbinary::util::BasicArrayListUtil'->getInstance();
    $self->{hashtable} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();
    $self->{initialized} = 0;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub init {
    my ($self, $level) = @_;
        $self->setInitialized(1);
}


# throws Exception
sub getResourceRelativeRelationshipList {
    my ($self, $resource) = @_;
        my $listCanBeNull = $self->{hashtable}->get($resource);
        if (!defined($listCanBeNull)) {
            return $self->{basicArrayListUtil}->getImmutableInstance();
        }
        return $listCanBeNull;
}


# throws Exception
sub addResourceRelativeRelationship {
    my ($self, $resource, $hardPoint) = @_;
        my $list = $self->getResourceRelativeRelationshipList($resource);
        if ($list == $self->{basicArrayListUtil}->getImmutableInstance()) {
            $list = 'org::allbinary::util::BasicArrayListD'->new();
        }
        $list->add($hardPoint);
        $self->{hashtable}->put($resource, $list);
}


sub isLoadingLevel {
    my ($self, $level) = @_;
        return 0;
}


sub isFeature {
    my ($self) = @_;
        return 0;
}


sub setInitialized {
    my ($self, $initialized) = @_;
        $self->{initialized} = $initialized;
}


sub isInitialized {
    my ($self) = @_;
        return $self->{initialized};
}

use org::allbinary::graphics::RelativeRelationship;
use org::allbinary::logic::StdUtil;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::util::BasicArrayListUtil;
use org::allbinary::game::resource::ResourceRelativeRelationshipFactoryInterface;

1;

