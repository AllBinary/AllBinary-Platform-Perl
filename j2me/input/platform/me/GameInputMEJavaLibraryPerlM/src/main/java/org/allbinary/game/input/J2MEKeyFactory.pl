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

package org::allbinary::game::input::J2MEKeyFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::input::J2MEKeyFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{gameKeyFactory} = 'org::allbinary::game::input::GameKeyFactory'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::input::J2MEKeyFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub init {
    my ($self) = @_;
        my $gameKeyArray = [$self->{gameKeyFactory}->{DOWN}, $self->{gameKeyFactory}->{FIRE}, $self->{gameKeyFactory}->{GAME_A}, $self->{gameKeyFactory}->{GAME_B}, $self->{gameKeyFactory}->{GAME_C}, $self->{gameKeyFactory}->{GAME_D}, $self->{gameKeyFactory}->{KEY_NUM0}, $self->{gameKeyFactory}->{KEY_NUM1}, $self->{gameKeyFactory}->{KEY_NUM2}, $self->{gameKeyFactory}->{KEY_NUM3}, $self->{gameKeyFactory}->{KEY_NUM4}, $self->{gameKeyFactory}->{KEY_NUM5}, $self->{gameKeyFactory}->{KEY_NUM6}, $self->{gameKeyFactory}->{KEY_NUM7}, $self->{gameKeyFactory}->{KEY_NUM8}, $self->{gameKeyFactory}->{KEY_NUM9}, $self->{gameKeyFactory}->{KEY_POUND}, $self->{gameKeyFactory}->{KEY_STAR}, $self->{gameKeyFactory}->{LEFT}, $self->{gameKeyFactory}->{LEVEL_DOWN}, $self->{gameKeyFactory}->{LEVEL_UP}, $self->{gameKeyFactory}->{NONE}, $self->{gameKeyFactory}->{RIGHT}, $self->{gameKeyFactory}->{UP}];
        my $inputFactory = 'org::allbinary::game::input::InputFactory'->getInstance();
        for (my $index = scalar(@{$gameKeyArray}); --$index >= 0; ) {
            $inputFactory->add($gameKeyArray->[$index]->getId(), $gameKeyArray->[$index]);
        }
}


sub isSubmission {
    my ($self, $input) = @_;
        if ($input == $self->{gameKeyFactory}->{FIRE}) {
            return 1;
        }
        return 0;
}


sub isDelete {
    my ($self, $input) = @_;
        if ($input == $self->{gameKeyFactory}->{GAME_D}) {
            return 1;
        }
        return 0;
}


sub isBackSpace {
    my ($self, $input) = @_;
        return 0;
}


sub isUp {
    my ($self, $input) = @_;
        if ($input == $self->{gameKeyFactory}->{UP}) {
            return 1;
        }
        return 0;
}


sub isDown {
    my ($self, $input) = @_;
        if ($input == $self->{gameKeyFactory}->{DOWN}) {
            return 1;
        }
        return 0;
}


sub isLeft {
    my ($self, $input) = @_;
        if ($input == $self->{gameKeyFactory}->{LEFT}) {
            return 1;
        }
        return 0;
}


sub isRight {
    my ($self, $input) = @_;
        if ($input == $self->{gameKeyFactory}->{RIGHT}) {
            return 1;
        }
        return 0;
}


sub isEnter {
    my ($self, $input) = @_;
        if ($input == $self->{gameKeyFactory}->{FIRE}) {
            return 1;
        }
        return 0;
}

use org::allbinary::game::input::GameKeyFactory;
use org::allbinary::game::input::InputFactory;

1;

