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

package org::allbinary::game::paint::BasicGameDemoPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::paint::StatePaintable';


sub _init_fields {
    my ($self) = @_;
    $self->{mainDemoStatePaintable} = undef;
    $self->{ownershipPaintable} = undef;
    $self->{helpPaintableInterface} = undef;
    $self->{currentStatePaintable} = 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
}


sub new {
    my ($class, $mainDemoStatePaintable, $ownershipPaintable, $helpPaintableInterface) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{mainDemoStatePaintable} = $mainDemoStatePaintable;
        $self->setCurrentStatePaintable('org::allbinary::graphics::paint::NullPaintable'->getInstance());
        $self->{ownershipPaintable} = $ownershipPaintable;
        $self->{helpPaintableInterface} = $helpPaintableInterface;
    return $self;
}


sub setState {
    my ($self, $state) = @_;
        if ($state == 0) {
            $self->setCurrentStatePaintable($self->getMainDemoStatePaintable());
        } elsif ($state == 1) {
            $self->setCurrentStatePaintable($self->{helpPaintableInterface});
        } else {
            $self->setCurrentStatePaintable($self->{ownershipPaintable});
        }
}


sub paint {
    my ($self, $graphics) = @_;
        $self->getCurrentStatePaintable()->paint($graphics);
}


sub getHelpPaintableInterface {
    my ($self) = @_;
        return $self->{helpPaintableInterface};
}


sub setCurrentStatePaintable {
    my ($self, $currentStatePaintable) = @_;
        $self->{currentStatePaintable} = $currentStatePaintable;
}


sub getCurrentStatePaintable {
    my ($self) = @_;
        return $self->{currentStatePaintable};
}


sub getMainDemoStatePaintable {
    my ($self) = @_;
        return $self->{mainDemoStatePaintable};
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::paint::NullPaintable;
use org::allbinary::graphics::paint::Paintable;
use org::allbinary::graphics::paint::StatePaintable;

1;

