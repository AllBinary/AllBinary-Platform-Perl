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

package org::allbinary::game::resource::ResourceLoadingLevelFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::resource::ResourceLoadingLevelFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{LOAD_EARLY} = 'org::allbinary::game::resource::ResourceLoadingLevel'->new("Load Early", 2147483647);
    $self->{LOAD_TOUCH} = 'org::allbinary::game::resource::ResourceLoadingLevel'->new("Load Touch", 2147483647 - 1);
    $self->{LOAD_GAME} = 'org::allbinary::game::resource::ResourceLoadingLevel'->new("Load Game", 2147483647 - 2);
    $self->{LEVEL} = 'org::allbinary::game::resource::ResourceLoadingLevel'->new("Level", 2147483647 - 99);
    $self->{MAX_LEVEL} = 'org::allbinary::game::resource::ResourceLoadingLevel'->new("Max Level", 2147483647 - 100);
    $self->{LOAD_ALL} = 'org::allbinary::game::resource::ResourceLoadingLevel'->new("Load All", -1);
    $self->{RESOURCE_LOADING_LEVEL_ARRAY} = [$self->{LOAD_ALL}, $self->{MAX_LEVEL}, $self->{LEVEL}, $self->{LOAD_GAME}, $self->{LOAD_TOUCH}, $self->{LOAD_EARLY}];
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::resource::ResourceLoadingLevelFactory::instance;
}


sub getLevelString {
    my ($self, $level) = @_;
        for (my $index = 0; $index < scalar(@{$self->{RESOURCE_LOADING_LEVEL_ARRAY}}); $index++) {
            if ($level == $self->{RESOURCE_LOADING_LEVEL_ARRAY}->[$index]->getLevel()) {
                return $self->{RESOURCE_LOADING_LEVEL_ARRAY}->[$index]->getName();
            }
        }
        return ("" . ($level));
}

use org::allbinary::game::resource::ResourceLoadingLevel;

1;

