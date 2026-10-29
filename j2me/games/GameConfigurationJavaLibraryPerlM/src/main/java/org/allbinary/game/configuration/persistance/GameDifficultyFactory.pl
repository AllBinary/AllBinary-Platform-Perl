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

package org::allbinary::game::configuration::persistance::GameDifficultyFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::configuration::persistance::GameDifficultyFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{level} = 0;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::configuration::persistance::GameDifficultyFactory::instance;
}


sub setLevel {
    my ($self, $level) = @_;
        $self->{level} = $level;
}


sub getLevel {
    my ($self) = @_;
        return $self->{level};
}


1;

