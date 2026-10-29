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

package org::allbinary::game::ag::life::Life;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::ag::life::LifeInterface';

our $NO_LIFE = 'org::allbinary::game::ag::life::Life'->createLife();

sub _init_fields {
    my ($self) = @_;
    $self->{lives} = undef;
    $self->{startLives} = undef;
    $self->{maxlives} = undef;
}


sub createLife {
    my ($class) = @_;
        try {
            return 'org::allbinary::game::ag::life::Life'->new(((int(0) + 32768) % 65536 - 32768), ((int(0) + 32768) % 65536 - 32768));
        } catch ($e) {
            die ("RuntimeException");
        }
}


sub new {
    my ($class, $lives, $maxlives) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{maxlives} = $maxlives;
        if ($lives > $self->{maxlives}) {
            die ("To Many Lives");
        }
        $self->{lives} = $lives;
        $self->{startLives} = $lives;
    return $self;
}


sub get {
    my ($self) = @_;
        return $self->{lives};
}


sub set {
    my ($self, $lives) = @_;
        $self->{lives} = $lives;
}


sub reset {
    my ($self) = @_;
        $self->{lives} = $self->{startLives};
}


sub add {
    my ($self, $lives) = @_;
        if (!$self->reachedLimit()) {
            if ($self->{lives} + $lives <= $self->getMaxlives()) {
                $self->{lives} = ((int(($self->{lives} + $lives)) + 32768) % 65536 - 32768);
            } else {
                $self->{lives} = $self->getMaxlives();
            }
        }
}


sub isAlive {
    my ($self) = @_;
        if ($self->{lives} <= 0) {
            return 0;
        } else {
            return 1;
        }
}


sub getMaxlives {
    my ($self) = @_;
        return $self->{maxlives};
}


sub reachedLimit {
    my ($self) = @_;
        if ($self->{lives} > $self->{maxlives} || $self->{lives} < 0) {
            return 1;
        } else {
            return 0;
        }
}


sub deaths {
    my ($self, $lives) = @_;
        if (!$self->reachedLimit()) {
            if ($self->{lives} - $lives >= 0) {
                $self->{lives} = ((int(($self->{lives} - $lives)) + 32768) % 65536 - 32768);
            } else {
                $self->{lives} = 0;
            }
        }
}


sub getStartLives {
    my ($self) = @_;
        return $self->{startLives};
}


sub setStartLives {
    my ($self, $startLives) = @_;
        $self->{startLives} = $startLives;
}

use org::allbinary::game::ag::life::LifeInterface;

1;

