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

package org::allbinary::game::paint::MainGameDemoStatePaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::paint::Paintable';


sub _init_fields {
    my ($self) = @_;
    $self->{ownershipPaintableInterface} = undef;
    $self->{menuPaintableInterface} = undef;
}


sub new {
    my ($class, $ownershipPaintableInterface, $menuPaintableInterface) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{ownershipPaintableInterface} = $ownershipPaintableInterface;
        $self->{menuPaintableInterface} = $menuPaintableInterface;
    return $self;
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{menuPaintableInterface}->paint($graphics);
        $self->{ownershipPaintableInterface}->paint($graphics);
}


sub getOwnershipPaintableInterface {
    my ($self) = @_;
        return $self->{ownershipPaintableInterface};
}


sub getMenuPaintableInterface {
    my ($self) = @_;
        return $self->{menuPaintableInterface};
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::paint::Paintable;

1;

