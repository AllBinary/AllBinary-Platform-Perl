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

package org::allbinary::game::ag::layer::hud::basic::score::ScoreableAddOnlyForHud;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::score::Scoreable';


sub _init_fields {
    my ($self) = @_;
    $self->{scoreHudWidget} = undef;
}


sub new {
    my ($class, $scoreVectorGraphic) = @_;
    my $self = $class->SUPER::new(0);
    $self->_init_fields();
        # super(...) made $self above
        $self->{scoreHudWidget} = $scoreVectorGraphic;
        $self->getScoreHudWidget()->set(0);
    return $self;
}


sub removePoints {
    my ($self, $points) = @_;
}


sub addPoints {
    my ($self, $points) = @_;
        $self->SUPER::addPoints($points);
        $self->getScoreHudWidget()->add($points);
}


sub getScoreHudWidget {
    my ($self) = @_;
        return $self->{scoreHudWidget};
}

use org::allbinary::game::score::Scoreable;

1;

